/* Local PE mapping harness for testing this EXE's machine code against mock
   Windows APIs. It is deliberately limited to this build and is not Wine. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <dlfcn.h>

static uint16_t u16(const unsigned char *p) { uint16_t v;memcpy(&v,p,2);return v; }
static uint32_t u32(const unsigned char *p) { uint32_t v;memcpy(&v,p,4);return v; }
static uint64_t u64(const unsigned char *p) { uint64_t v;memcpy(&v,p,8);return v; }

void __attribute__((ms_abi)) start(void) {
    FILE *f=fopen("Axiom-Editor.exe","rb"); long size; unsigned char *file,*base,*opt,*sec,*imports; uint32_t pe,nsec,optlen,image_size,head,entry,irva;
    if(!f){perror("EXE");exit(1);}fseek(f,0,SEEK_END);size=ftell(f);rewind(f);file=malloc((size_t)size);if(!file||fread(file,1,(size_t)size,f)!=(size_t)size)abort();fclose(f);
    pe=u32(file+0x3c);if(memcmp(file+pe,"PE\0\0",4))abort();nsec=u16(file+pe+6);optlen=u16(file+pe+20);opt=file+pe+24;
    if(u16(opt)!=0x20b)abort();entry=u32(opt+16);image_size=u32(opt+56);head=u32(opt+60);irva=u32(opt+120);
    base=mmap(NULL,image_size,PROT_READ|PROT_WRITE|PROT_EXEC,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);if(base==MAP_FAILED){perror("mmap");exit(1);}
    memcpy(base,file,head);sec=opt+optlen;
    for(uint32_t i=0;i<nsec;i++,sec+=40){uint32_t va=u32(sec+12),rawsize=u32(sec+16),raw=u32(sec+20);if(rawsize)memcpy(base+va,file+raw,rawsize);}
    imports=base+irva;
    for(;u32(imports)||u32(imports+12)||u32(imports+16);imports+=20){
        uint32_t original=u32(imports),iat=u32(imports+16);if(!original)original=iat;
        for(uint32_t i=0;;i++){
            uint64_t rva=u64(base+original+i*8);void *fn;
            if(!rva)break;if(rva>>63){fprintf(stderr,"ordinal not supported\n");exit(1);}
            char *name=(char*)(base+(uint32_t)rva+2);fn=dlsym(RTLD_DEFAULT,name);
            if(!fn){fprintf(stderr,"missing mock %s\n",name);exit(1);}memcpy(base+iat+i*8,&fn,8);
        }
    }
    free(file);
    ((void (__attribute__((ms_abi)) *)(void))(base+entry))();
    fprintf(stderr,"PE entry unexpectedly returned\n");exit(1);
}
