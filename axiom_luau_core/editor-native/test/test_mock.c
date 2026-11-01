/* Executes the built PE with deterministic WinAPI substitutes, not Windows. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/evp.h>
#include <errno.h>
#include <fcntl.h>
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>
#define ABI __attribute__((ms_abi))
typedef uint16_t WCHAR;
typedef void *HANDLE;
typedef void *HWND;
typedef uint32_t DWORD;
typedef uint32_t UINT;
typedef uint64_t WPARAM;
typedef int64_t LPARAM;
typedef int64_t LRESULT;
typedef struct { int x,y; } POINT;
typedef struct { int left,top,right,bottom; } RECT;
typedef struct { HWND hwnd; UINT message; WPARAM wParam; LPARAM lParam; DWORD time; POINT pt; DWORD unused; } MSG;
typedef LRESULT (ABI *WNDPROC)(HWND,UINT,WPARAM,LPARAM);
typedef struct { UINT style; WNDPROC lpfnWndProc; int a,b; HANDLE instance,icon,cursor,brush; const WCHAR *menu,*name; } WNDCLASS;
typedef struct { DWORD size; HWND owner; HANDLE inst; const WCHAR *filter; WCHAR *custom; DWORD customMax,filterIndex; WCHAR *file; DWORD maxFile; WCHAR *title; DWORD maxTitle; const WCHAR *initial,*caption; DWORD flags; uint16_t offset,ext; const WCHAR *def; LPARAM data; void *hook; const WCHAR *templ; void *reserved; DWORD reserved2,flagsEx; } OFN;
typedef struct { DWORD size,usage,pid; uint64_t heap; DWORD module,threads,parent; int priority; DWORD flags; WCHAR name[260]; } PROCESSENTRY;
typedef struct { DWORD size,module,pid,global_usage,process_usage; unsigned char *base; DWORD image_size; HANDLE instance; WCHAR name[256],path[260]; } MODULEENTRY;
typedef struct {DWORD low,high;} FILETIME;
typedef struct {DWORD attributes;FILETIME created,accessed,written;DWORD sizeHigh,sizeLow,reserved0,reserved1;WCHAR name[260],shortName[14];} FINDDATA;
typedef struct { DWORD cbSize,fMask; HWND hwnd; const WCHAR *verb,*file,*params,*dir; int show; HANDLE inst; void *idlist; const WCHAR *cls; HANDLE key; DWORD hotkey; HANDLE icon,process; } SHELLINFO;
typedef struct { DWORD size; void *a,*b; DWORD ui,revocation,choice; void *file; DWORD state; HANDLE stateData; const WCHAR *url; DWORD flags,context; void *settings; } TRUSTDATA;
typedef struct { DWORD size; void *cert; } CERTPREFIX;
typedef struct { DWORD length; void *descriptor; int inherit; } SECATTR;
typedef struct { DWORD size; WCHAR *reserved,*desktop,*title; DWORD x,y,xsize,ysize,xchars,ychars,fill,flags; uint16_t show,reserved2size; unsigned char *reserved2; HANDLE input,output,error; } STARTUP;
typedef struct { HANDLE process,thread; DWORD process_id,thread_id; } PROCESSINFO;
extern ABI void start(void);
static WNDPROC proc;
static HWND mainwin=(HWND)(uintptr_t)10000, ed=(HWND)(uintptr_t)101, out=(HWND)(uintptr_t)777;
static WCHAR edit[2048], output[8192];
static const char *script="local x = 42\r\nprint(x)\r\n";
static const char *mode="ok";
static char written[2048];
static size_t wlen,readpos;
static int step,copy_called,scan_success,open_success,moved,deleted,disabled,opened,window_closed;
static int installing, probing, versioning, localing, verify_calls, installer_started, installer_deleted, posted, queue_pos, queue_count;
static DWORD queue_event[4], queue_message[4];
static LPARAM queue_detail[4];
static int probe_result, probe_log_seen, next_process, probe_hash_stage, probe_mutated;
static uint64_t probe_file_read,probe_hash_bytes;
static FILE *probe_input;
static FILE *version_file;
static char version_test_root[512];
static char version_readonly_path[2048];
static int version_result,version_launch_called,version_copy_called;
static int version_readonly_cleared;
static DWORD version_last_error;
static int local_result,local_pipe_count,local_started,local_terminated;
static size_t local_stdout_pos,local_input_len;
static char local_input[2048];
static int real_probe(void){return versioning||!strncmp(mode,"probe-real",10);}
static size_t http_readpos,installer_bytes;
static int idcount=2000;
static CERTPREFIX mockCert={sizeof(CERTPREFIX),(void*)0x608};
ABI void *mockProvider(HANDLE h){return h==(HANDLE)0x606?(void*)0x607:NULL;}
ABI void *mockSigner(void *p,DWORD i,int c,DWORD j){return p==(void*)0x607&&!i&&!c&&!j?(void*)0x609:NULL;}
ABI CERTPREFIX *mockCertificate(void *p,DWORD i){return p==(void*)0x609&&!i?&mockCert:NULL;}
static const WCHAR path[]={'C',':','\\','s','c','r','i','p','t','.','l','u','a','u',0};
static int weq(const WCHAR *w,const char *s){while(*w&&*s&&*w==(unsigned char)*s){++w;++s;}return !*w&&!*s;}
static int whas(const WCHAR *w,const char *s){for(size_t i=0;w[i];i++){size_t j=0;while(s[j]&&w[i+j]&&(unsigned char)s[j]==w[i+j])j++;if(!s[j])return 1;}return 0;}
static void wset(WCHAR *d,const WCHAR *s,size_t n){size_t i=0;while(s[i]&&i+1<n){d[i]=s[i];i++;}d[i]=0;}
static void fromascii(WCHAR *d,const char *s,size_t n){size_t i=0;while(s[i]&&i+1<n){d[i]=(unsigned char)s[i];i++;}d[i]=0;}

static int version_host_path(const WCHAR *wide,char *out,size_t cap){
 char path[2048];size_t i=0;while(wide[i]&&i+1<sizeof(path)){if(wide[i]>127)return 0;path[i]=(char)wide[i];i++;}path[i]=0;
 const char *suffix;const char *sub;
 if(!strncmp(path,"C:\\sandbox",10)){sub="/local";suffix=path+10;}
 else if(!strncmp(path,"C:\\Roblox",9)){sub="/Roblox";suffix=path+9;}
 else return 0;
 int n=snprintf(out,cap,"%s%s%s",version_test_root,sub,suffix);if(n<0||(size_t)n>=cap)return 0;
 for(i=0;out[i];i++)if(out[i]=='\\')out[i]='/';return 1;
}
static int version_write_file(const char *path,const char *data){FILE *f=fopen(path,"wb");if(!f)return 0;size_t n=strlen(data);int ok=fwrite(data,1,n,f)==n;return fclose(f)==0&&ok;}
static void version_posix_remove(const char *path){
 struct stat st;if(lstat(path,&st))return;
 if(S_ISDIR(st.st_mode)){DIR *d=opendir(path);if(!d)abort();struct dirent *e;while((e=readdir(d))){char child[2048];if(!strcmp(e->d_name,".")||!strcmp(e->d_name,".."))continue;if(snprintf(child,sizeof(child),"%s/%s",path,e->d_name)>=(int)sizeof(child))abort();version_posix_remove(child);}closedir(d);if(rmdir(path))abort();}
 else if(unlink(path))abort();
}
static void version_setup(void){
 char buf[2048],source[1024],exe[2048],dll[2048],target[1024];const char *fixture=getenv("AXIOM_TEST_ROBLOX_CLIENT"),*library=getenv("AXIOM_TEST_ROBLOX_LIBRARY");
 snprintf(version_test_root,sizeof(version_test_root),"/tmp/axiom-client-test-XXXXXX");if(!mkdtemp(version_test_root)||!fixture||!library)abort();
 snprintf(buf,sizeof(buf),"%s/local",version_test_root);if(mkdir(buf,0700))abort();
 snprintf(source,sizeof(source),"%s/Roblox",version_test_root);if(mkdir(source,0700))abort();
 snprintf(exe,sizeof(exe),"%s/RobloxPlayerBeta.exe",source);snprintf(dll,sizeof(dll),"%s/RobloxPlayerBeta.dll",source);
 if(!strcmp(mode,"version-wrong")){if(!version_write_file(exe,"not the client"))abort();}else if(link(fixture,exe))abort();
 if(!strcmp(mode,"version-wrongdll")){if(!version_write_file(dll,"not the library"))abort();}else if(strcmp(mode,"version-nodll")&&link(library,dll))abort();
 snprintf(buf,sizeof(buf),"%s/content",source);if(mkdir(buf,0700))abort();
 snprintf(buf,sizeof(buf),"%s/content/asset.txt",source);if(!version_write_file(buf,"asset"))abort();
 if(!strcmp(mode,"version-link")){snprintf(buf,sizeof(buf),"%s/content/link",source);if(symlink("/tmp",buf))abort();}
 if(!strcmp(mode,"version-stage-link")){snprintf(buf,sizeof(buf),"%s/victim",version_test_root);if(mkdir(buf,0700))abort();snprintf(buf,sizeof(buf),"%s/victim/sentinel",version_test_root);if(!version_write_file(buf,"preserve"))abort();}
 if(!strcmp(mode,"version-existing")||!strcmp(mode,"version-launch")||!strcmp(mode,"version-conflict")){
  snprintf(buf,sizeof(buf),"%s/local/Axiom",version_test_root);if(mkdir(buf,0700))abort();
  snprintf(buf,sizeof(buf),"%s/local/Axiom/Versions",version_test_root);if(mkdir(buf,0700))abort();
  snprintf(target,sizeof(target),"%s/local/Axiom/Versions/version-5a21b87bbc2641cf",version_test_root);if(mkdir(target,0700))abort();
  if(!strcmp(mode,"version-conflict")){snprintf(buf,sizeof(buf),"%s/sentinel",target);if(!version_write_file(buf,"leave me"))abort();}
  else{snprintf(buf,sizeof(buf),"%s/RobloxPlayerBeta.exe",target);if(link(fixture,buf))abort();snprintf(buf,sizeof(buf),"%s/RobloxPlayerBeta.dll",target);if(link(library,buf))abort();snprintf(buf,sizeof(buf),"%s/.axiom-client-complete",target);if(!version_write_file(buf,"AXIOM-CLIENT-COPY-1\nversion-5a21b87bbc2641cf\n"))abort();}
 }
}
static int version_assert_files(void){
 char path[2048];struct stat st;
 snprintf(path,sizeof(path),"%s/Roblox/RobloxPlayerBeta.exe",version_test_root);if(lstat(path,&st))return 0;
 snprintf(path,sizeof(path),"%s/local/Axiom/Versions/version-5a21b87bbc2641cf",version_test_root);
 int exists=lstat(path,&st)==0;
 if(!strcmp(mode,"version-prepare")){
  if(!exists||version_copy_called<3)return 0;
  snprintf(path,sizeof(path),"%s/local/Axiom/Versions/version-5a21b87bbc2641cf/.axiom-client-complete",version_test_root);if(lstat(path,&st))return 0;
  snprintf(path,sizeof(path),"%s/local/Axiom/Versions/version-5a21b87bbc2641cf/content/asset.txt",version_test_root);if(lstat(path,&st))return 0;
 }
 if(!strcmp(mode,"version-launch")&&!version_launch_called)return 0;
 if(!strcmp(mode,"version-conflict")){snprintf(path,sizeof(path),"%s/local/Axiom/Versions/version-5a21b87bbc2641cf/sentinel",version_test_root);if(lstat(path,&st))return 0;}
 if((!strcmp(mode,"version-link")||!strcmp(mode,"version-copyfail")||!strcmp(mode,"version-readonly-fail")||!strcmp(mode,"version-stage-link")||!strcmp(mode,"version-wrong")||!strcmp(mode,"version-wrongdll")||!strcmp(mode,"version-nodll"))&&exists)return 0;
 if(!strcmp(mode,"version-readonly-fail")&&!version_readonly_cleared)return 0;
 if(!strcmp(mode,"version-stage-link")){snprintf(path,sizeof(path),"%s/victim/sentinel",version_test_root);if(lstat(path,&st))return 0;}
 snprintf(path,sizeof(path),"%s/local/Axiom/Versions",version_test_root);DIR *d=opendir(path);if(d){struct dirent *e;while((e=readdir(d)))if(strstr(e->d_name,"Axiom-staging-")){closedir(d);return 0;}closedir(d);}
 return 1;
}

ABI HANDLE GetProcessHeap(void){return (HANDLE)1;}
ABI void *HeapAlloc(HANDLE h,DWORD f,uint64_t n){(void)h;(void)f;return calloc(1,(size_t)n);}
ABI int HeapFree(HANDLE h,DWORD f,void *p){(void)h;(void)f;free(p);return 1;}
ABI HANDLE GetModuleHandleW(const WCHAR *x){(void)x;return (HANDLE)1;}
ABI HANDLE LoadLibraryW(const WCHAR *x){(void)x;return (HANDLE)1;}
ABI int FreeLibrary(HANDLE h){(void)h;return 1;}
ABI void *GetProcAddress(HANDLE h,const char *n){(void)h;if(!strcmp(n,"WTHelperProvDataFromStateData"))return (void*)mockProvider;if(!strcmp(n,"WTHelperGetProvSignerFromChain"))return (void*)mockSigner;if(!strcmp(n,"WTHelperGetProvCertFromChain"))return (void*)mockCertificate;return NULL;}
ABI void ExitProcess(UINT code){
 int expected_disabled=!strcmp(mode,"connect")?1:0;
 int ok=code==0&&disabled==expected_disabled&&window_closed;
 if(!installing&&!probing&&!versioning&&!localing)ok=ok&&open_success&&scan_success&&copy_called;
 if(!strcmp(mode,"ok"))ok=ok&&moved==1&&!deleted&&wlen==strlen(script)&&!memcmp(written,script,wlen);
 if(!strcmp(mode,"flushfail"))ok=ok&&!moved&&deleted==1;
 if(!strcmp(mode,"installok"))ok=ok&&verify_calls==2&&installer_started==1&&installer_deleted==1&&installer_bytes==8&&posted==2;
 if(!strcmp(mode,"invalidsig"))ok=ok&&verify_calls==2&&!installer_started&&installer_deleted==1&&posted==1;
 if(!strcmp(mode,"wrongpub"))ok=ok&&verify_calls==2&&!installer_started&&installer_deleted==1&&posted==1;
 if(!strcmp(mode,"httpfail"))ok=ok&&!verify_calls&&!installer_started&&installer_deleted==1&&posted==1;
 if(probing){
  int expected=1;
  if(!strcmp(mode,"probe-none"))expected=2;
  if(!strcmp(mode,"probe-many"))expected=3;
  if(!strcmp(mode,"probe-open"))expected=4;
  if(!strcmp(mode,"probe-size")||!strcmp(mode,"probe-hash")||!strcmp(mode,"probe-realhashbad"))expected=7;
  if(!strcmp(mode,"probe-module"))expected=8;
  if(!strcmp(mode,"probe-memory"))expected=9;
  if(!strcmp(mode,"probe-table")||!strcmp(mode,"probe-realtablebad"))expected=10;
  if(!strcmp(mode,"probe-code"))expected=11;
  if(!strcmp(mode,"probe-crypto"))expected=12;
  ok=ok&&posted==1&&probe_result==expected&&probe_log_seen;
  if(expected==1){
   ok=ok&&whas(output,"16 bytes de quatro trechos conferidos")&&whas(output,"nao confirma execucao");
   ok=ok&&whas(output,!strcmp(mode,"probe-noctx")?"Possivel contexto nao localizado":"Possivel contexto legivel");
  }
  if(expected==7)ok=ok&&whas(output,"Arquivo diferente do cliente desktop analisado");
  if(expected==10)ok=ok&&whas(output,"tabela completa na memoria difere");
  if(expected==11)ok=ok&&whas(output,"trechos na memoria difere");
 }
 if(versioning){
  int expected=1;
  if(!strcmp(mode,"version-existing"))expected=2;
  if(!strcmp(mode,"version-launch"))expected=3;
  if(!strcmp(mode,"version-none"))expected=4;
  if(!strcmp(mode,"version-many"))expected=5;
  if(!strcmp(mode,"version-open"))expected=6;
  if(!strcmp(mode,"version-wrong")||!strcmp(mode,"version-wrongdll"))expected=7;
  if(!strcmp(mode,"version-nodll"))expected=8;
  if(!strcmp(mode,"version-copyfail")||!strcmp(mode,"version-readonly-fail")||!strcmp(mode,"version-stage-link"))expected=10;
  if(!strcmp(mode,"version-link"))expected=11;
  if(!strcmp(mode,"version-conflict"))expected=13;
  if(!strcmp(mode,"version-noinstall"))expected=14;
  ok=ok&&posted==1&&version_result==expected&&version_assert_files();
  version_posix_remove(version_test_root);
 }
 if(localing){
  int expected=1;
  if(!strcmp(mode,"local-syntax"))expected=2;
  if(!strcmp(mode,"local-missing"))expected=3;
  if(!strcmp(mode,"local-launchfail"))expected=4;
  if(!strcmp(mode,"local-timeout"))expected=5;
  if(!strcmp(mode,"local-pipefail")||!strcmp(mode,"local-writefail"))expected=6;
  ok=ok&&posted==1&&local_result==expected;
  if(expected==1)ok=ok&&whas(output,!strcmp(mode,"local-check")?"Sintaxe local verificada":"Execucao local finalizada");
  if(!strcmp(mode,"local-truncate"))ok=ok&&whas(output,"Saida limitada aos primeiros 6000 bytes");
  if(!strcmp(mode,"local-timeout"))ok=ok&&local_terminated;
  if(local_started&&strcmp(mode,"local-writefail"))ok=ok&&local_input_len==strlen("print(\"Axiom\")")&&!memcmp(local_input,"print(\"Axiom\")",local_input_len);
 }
 if(!ok){fprintf(stderr,"mock %s failed: code=%u open=%d scan=%d copy=%d disabled=%d closed=%d moved=%d deleted=%d bytes=%zu\n",mode,code,open_success,scan_success,copy_called,disabled,window_closed,moved,deleted,wlen);exit(1);}
 printf("mock %s passed\n",mode);exit(0);
}
ABI int CloseHandle(HANDLE h){if(h==(HANDLE)0x701&&probe_input){fclose(probe_input);probe_input=NULL;}if(version_file&&(HANDLE)version_file==h){fclose(version_file);version_file=NULL;}return 1;}
ABI HANDLE CreateThread(void *a,uint64_t b,DWORD (ABI *f)(void*),void *arg,DWORD c,DWORD *d){(void)a;(void)b;(void)c;(void)d;f(arg);return (HANDLE)1;}
ABI DWORD GetCurrentProcessId(void){return 500;}
ABI DWORD GetModuleFileNameW(HANDLE h,WCHAR *path,DWORD cap){if(h||cap<40)abort();fromascii(path,"C:\\Axiom Dir\\Axiom-Editor.exe",cap);return (DWORD)strlen("C:\\Axiom Dir\\Axiom-Editor.exe");}
ABI DWORD GetTempPathW(DWORD cap,WCHAR *p){const char *s="C:\\Temp\\";if(cap<9)abort();fromascii(p,s,cap);return (DWORD)strlen(s);}
ABI DWORD WaitForSingleObject(HANDLE h,DWORD timeout){if(localing&&h==(HANDLE)0x915&&timeout==15000)return !strcmp(mode,"local-timeout")?258:0;if(localing&&h==(HANDLE)1&&timeout==0xffffffffU)return 0;if(h!=(HANDLE)0x604||timeout!=1200000)abort();return 0;}
ABI int GetExitCodeProcess(HANDLE h,DWORD *code){if(localing&&h==(HANDLE)0x915){*code=!strcmp(mode,"local-syntax")?1:0;return 1;}if(h!=(HANDLE)0x604)abort();*code=0;return 1;}
ABI int CreatePipe(HANDLE *r,HANDLE *w,SECATTR *sa,DWORD size){if(!localing||sa->length!=sizeof(*sa)||!sa->inherit||size)abort();if(!strcmp(mode,"local-pipefail"))return 0;if(!local_pipe_count++){*r=(HANDLE)0x910;*w=(HANDLE)0x911;}else{*r=(HANDLE)0x912;*w=(HANDLE)0x913;}return 1;}
ABI int SetHandleInformation(HANDLE h,DWORD mask,DWORD flags){if(!localing||(h!=(HANDLE)0x911&&h!=(HANDLE)0x912)||mask!=1||flags)abort();return 1;}
ABI int CreateProcessW(const WCHAR *exe,WCHAR *cmd,void *pa,void *ta,int inherit,DWORD flags,void *env,const WCHAR *dir,STARTUP *si,PROCESSINFO *pi){
 if(!localing||!weq(exe,"C:\\Axiom Dir\\axiom-luau.exe")||!whas(cmd,"\"C:\\Axiom Dir\\axiom-luau.exe\" ")||pa||ta||!inherit||flags!=0x08000000||env||dir||si->size!=sizeof(*si)||si->flags!=0x100||si->input!=(HANDLE)0x910||si->output!=(HANDLE)0x913||si->error!=(HANDLE)0x913)abort();
 if(!whas(cmd,(!strcmp(mode,"local-check")||!strcmp(mode,"local-syntax"))?"check -":"run - --timeout-ms 5000"))abort();
 if(!strcmp(mode,"local-launchfail"))return 0;
 local_started=1;pi->process=(HANDLE)0x915;pi->thread=(HANDLE)0x916;return 1;
}
ABI int TerminateProcess(HANDLE h,UINT code){if(!localing||h!=(HANDLE)0x915||(code!=124&&code!=125))abort();local_terminated++;return 1;}
ABI int WideCharToMultiByte(UINT cp,DWORD flags,const WCHAR *in,int n,char *dst,int cap,const char *d,int *used){(void)cp;(void)flags;(void)d;(void)used;if(!dst)return n;if(cap<n)return 0;for(int i=0;i<n;i++){if(in[i]>127)return 0;dst[i]=(char)in[i];}return n;}
ABI int MultiByteToWideChar(UINT cp,DWORD flags,const char *in,int n,WCHAR *dst,int cap){(void)cp;(void)flags;if(!dst)return n;if(cap<n)return 0;for(int i=0;i<n;i++)dst[i]=(unsigned char)in[i];return n;}
ABI HANDLE CreateFileW(const WCHAR *name,DWORD access,DWORD share,void *sec,DWORD create,DWORD flags,HANDLE t){(void)share;(void)sec;(void)flags;(void)t;if(versioning){char host[2048];if(!version_host_path(name,host,sizeof(host))||version_file)abort();if(access==0x80000000U&&create==3)version_file=fopen(host,"rb");else if(access==0x40000000U&&create==1){int fd=open(host,O_WRONLY|O_CREAT|O_EXCL,0600);if(fd>=0)version_file=fdopen(fd,"wb");}else abort();return version_file?(HANDLE)version_file:(HANDLE)(intptr_t)-1;}if(access==0x80000000U){if(create!=3)abort();if(weq(name,"C:\\script.luau"))return (HANDLE)0x501;if(weq(name,"C:\\Roblox\\RobloxPlayerBeta.exe")&&share==7){if(real_probe()){const char *fixture=getenv("AXIOM_TEST_ROBLOX_CLIENT");if(!fixture||(probe_input=fopen(fixture,"rb"))==NULL)abort();}return (HANDLE)0x701;}if(weq(name,"C:\\Temp\\Axiom-RobloxInstaller-500-0.exe")&&share==1)return (HANDLE)0x505;abort();}if(access==0x40000000U){if(create!=1)abort();if(whas(name,".axiom-tmp-500-"))return (HANDLE)0x502;if(weq(name,"C:\\Temp\\Axiom-RobloxInstaller-500-0.exe"))return (HANDLE)0x504;}abort();}
ABI DWORD GetFileSize(HANDLE h,DWORD *hi){if(hi)*hi=0;if(versioning&&h==(HANDLE)version_file){if(fseek(version_file,0,SEEK_END))abort();long n=ftell(version_file);rewind(version_file);if(n<0)abort();return (DWORD)n;}if(h==(HANDLE)0x701){if(real_probe()){if(!probe_input||fseek(probe_input,0,SEEK_END))abort();long n=ftell(probe_input);rewind(probe_input);if(n<0)abort();return (DWORD)n;}return !strcmp(mode,"probe-size")?142680527:142680528;}if(h!=(HANDLE)0x501)abort();return (DWORD)strlen(script);}
ABI int ReadFile(HANDLE h,void *buf,DWORD cap,DWORD *n,void *x){(void)x;if(localing&&h==(HANDLE)0x912){const char *outtext=!strcmp(mode,"local-syntax")?"Erro: Erro de sintaxe":"42\n";size_t total=!strcmp(mode,"local-truncate")?7000:strlen(outtext),left=total-local_stdout_pos;if(left>cap)left=cap;if(!strcmp(mode,"local-truncate"))memset(buf,'x',left);else memcpy(buf,outtext+local_stdout_pos,left);local_stdout_pos+=left;*n=(DWORD)left;return left!=0;}if(versioning&&h==(HANDLE)version_file){*n=(DWORD)fread(buf,1,cap,version_file);return !ferror(version_file);}if(h==(HANDLE)0x701){if(real_probe()){if(!probe_input)abort();*n=(DWORD)fread(buf,1,cap,probe_input);if(*n&&!probe_mutated&&!strcmp(mode,"probe-realhashbad")){((unsigned char*)buf)[0]^=1;probe_mutated=1;}return !ferror(probe_input);}uint64_t left=142680528-probe_file_read;if(left>cap)left=cap;memset(buf,0,(size_t)left);probe_file_read+=left;*n=(DWORD)left;return 1;}if(h!=(HANDLE)0x501)abort();size_t len=strlen(script)-readpos;if(len>cap)len=cap;memcpy(buf,script+readpos,len);readpos+=len;*n=(DWORD)len;return 1;}
ABI int WriteFile(HANDLE h,const void *buf,DWORD len,DWORD *n,void *x){(void)x;if(localing&&h==(HANDLE)0x911){if(!strcmp(mode,"local-writefail")){*n=0;return 0;}if(local_input_len+len>sizeof(local_input))abort();memcpy(local_input+local_input_len,buf,len);local_input_len+=len;*n=len;return 1;}if(versioning&&h==(HANDLE)version_file){*n=(DWORD)fwrite(buf,1,len,version_file);return *n==len;}if(h==(HANDLE)0x504){installer_bytes+=len;*n=len;return 1;}if(h!=(HANDLE)0x502||wlen+len>sizeof(written))abort();memcpy(written+wlen,buf,len);wlen+=len;*n=len;return 1;}
ABI int FlushFileBuffers(HANDLE h){if(versioning&&h==(HANDLE)version_file)return fflush(version_file)==0;if(h!=(HANDLE)0x502&&h!=(HANDLE)0x504)abort();return strcmp(mode,"flushfail")!=0;}
ABI int DeleteFileW(const WCHAR *p){if(versioning){char host[2048];if(!version_host_path(p,host,sizeof(host)))abort();if(version_readonly_path[0]&&!strcmp(host,version_readonly_path))return 0;return unlink(host)==0;}if(whas(p,".axiom-tmp-500-")){deleted++;return 1;}if(weq(p,"C:\\Temp\\Axiom-RobloxInstaller-500-0.exe")){installer_deleted++;return 1;}abort();}
ABI int MoveFileExW(const WCHAR *from,const WCHAR *to,DWORD flags){if(!whas(from,".axiom-tmp-500-")||!weq(to,"C:\\script.luau")||flags!=9)abort();moved++;return 1;}
ABI HANDLE CreateToolhelp32Snapshot(DWORD flags,DWORD pid){if(flags==2&&pid==0)return (HANDLE)0x503;if(flags==0x18&&pid==123)return !strcmp(mode,"probe-module")?(HANDLE)(intptr_t)-1:(HANDLE)0x702;abort();}
ABI int Process32FirstW(HANDLE h,PROCESSENTRY *p){if(h!=(HANDLE)0x503||p->size!=sizeof(*p))abort();if(!strcmp(mode,"probe-none")||!strcmp(mode,"version-none"))return 0;p->pid=123;fromascii(p->name,"RobloxPlayerBeta.exe",260);return 1;}
ABI int Process32NextW(HANDLE h,PROCESSENTRY *p){(void)h;if((!strcmp(mode,"probe-many")||!strcmp(mode,"version-many"))&&!next_process++){p->pid=124;return 1;}return 0;}
ABI int Module32FirstW(HANDLE h,MODULEENTRY *m){if(h!=(HANDLE)0x702||m->size!=sizeof(*m))abort();m->base=(unsigned char*)(uintptr_t)0x140000000ULL;m->image_size=0x0922a000;fromascii(m->name,"RobloxPlayerBeta.exe",256);return 1;}
ABI HANDLE OpenProcess(DWORD access,int inherit,DWORD pid){if(access!=(versioning?0x1000U:0x1010U)||inherit||pid!=123)abort();return (!strcmp(mode,"probe-open")||!strcmp(mode,"version-open"))?NULL:(HANDLE)0x703;}
ABI int QueryFullProcessImageNameW(HANDLE h,DWORD f,WCHAR *p,DWORD *size){if(h!=(HANDLE)0x703||f||*size<64)abort();fromascii(p,"C:\\Roblox\\RobloxPlayerBeta.exe",*size);*size=30;return 1;}
typedef struct {DIR *dir;char base[2048];} VERSION_FIND;
static int version_fill_find(VERSION_FIND *f,FINDDATA *data){
 struct dirent *e=readdir(f->dir);if(!e){version_last_error=18;return 0;}
 char path[4096];struct stat st;if(snprintf(path,sizeof(path),"%s/%s",f->base,e->d_name)>=(int)sizeof(path)||lstat(path,&st))abort();
 memset(data,0,sizeof(*data));fromascii(data->name,e->d_name,260);data->attributes=S_ISDIR(st.st_mode)?0x10U:0;
 if(S_ISLNK(st.st_mode))data->attributes|=0x400U;
 data->sizeHigh=(DWORD)((uint64_t)st.st_size>>32);data->sizeLow=(DWORD)st.st_size;return 1;
}
ABI DWORD GetEnvironmentVariableW(const WCHAR *name,WCHAR *out,DWORD cap){if(!versioning||!weq(name,"LOCALAPPDATA")||cap<11)abort();fromascii(out,"C:\\sandbox",cap);return 10;}
ABI DWORD GetFileAttributesW(const WCHAR *name){
 if(localing){if(!weq(name,"C:\\Axiom Dir\\axiom-luau.exe"))abort();return !strcmp(mode,"local-missing")?0xffffffffU:0x80U;}
 char path[2048];struct stat st;if(!versioning||!version_host_path(name,path,sizeof(path)))abort();
 if(lstat(path,&st)){version_last_error=2;return 0xffffffffU;}
 DWORD a=S_ISDIR(st.st_mode)?0x10U:0;
 if(S_ISLNK(st.st_mode)){struct stat target;if(!stat(path,&target)&&S_ISDIR(target.st_mode))a|=0x10U;a|=0x400U;}
 if(version_readonly_path[0]&&!strcmp(path,version_readonly_path))a|=1U;
 version_last_error=0;return a;
}
ABI int SetFileAttributesW(const WCHAR *name,DWORD attrs){char path[2048];if(!versioning||!version_host_path(name,path,sizeof(path))||!version_readonly_path[0]||strcmp(path,version_readonly_path)||(attrs&1U))abort();version_readonly_path[0]=0;version_readonly_cleared++;return 1;}
ABI DWORD GetLastError(void){return version_last_error;}
ABI int CreateDirectoryW(const WCHAR *name,void *sec){char path[2048];(void)sec;if(!versioning||!version_host_path(name,path,sizeof(path)))abort();if(!mkdir(path,0700)){version_last_error=0;return 1;}version_last_error=errno==EEXIST?183:5;return 0;}
ABI int RemoveDirectoryW(const WCHAR *name){char path[2048];struct stat st;if(!versioning||!version_host_path(name,path,sizeof(path)))abort();if(!lstat(path,&st)&&S_ISLNK(st.st_mode))return unlink(path)==0;return rmdir(path)==0;}
ABI HANDLE FindFirstFileW(const WCHAR *pattern,FINDDATA *data){
 char path[2048];if(!versioning||!version_host_path(pattern,path,sizeof(path)))abort();size_t n=strlen(path);if(n<2||strcmp(path+n-2,"/*"))abort();path[n-2]=0;
 VERSION_FIND *find=calloc(1,sizeof(*find));if(!find)abort();strcpy(find->base,path);find->dir=opendir(path);
 if(!find->dir){free(find);version_last_error=2;return (HANDLE)(intptr_t)-1;}
 if(!version_fill_find(find,data)){closedir(find->dir);free(find);version_last_error=2;return (HANDLE)(intptr_t)-1;}return (HANDLE)find;
}
ABI int FindNextFileW(HANDLE h,FINDDATA *data){return version_fill_find((VERSION_FIND*)h,data);}
ABI int FindClose(HANDLE h){VERSION_FIND *find=(VERSION_FIND*)h;int ok=closedir(find->dir)==0;free(find);return ok;}
ABI int CopyFileW(const WCHAR *from,const WCHAR *to,int failIfExists){
 char src[2048],dst[2048];if(!versioning||!failIfExists||!version_host_path(from,src,sizeof(src))||!version_host_path(to,dst,sizeof(dst)))abort();version_copy_called++;
 if(!strcmp(mode,"version-copyfail"))return 0;
 if(!strcmp(mode,"version-readonly-fail")&&version_copy_called==2)return 0;
 if(!strcmp(mode,"version-stage-link")){
  char *at=strstr(dst,"/Axiom/Versions/Axiom-staging-");if(!at)abort();char *end=strchr(at+strlen("/Axiom/Versions/"),'/');if(!end)abort();*end=0;
  char victim[2048];snprintf(victim,sizeof(victim),"%s/victim",version_test_root);if(rmdir(dst)||symlink(victim,dst))abort();return 0;
 }
 int in=open(src,O_RDONLY),out=open(dst,O_WRONLY|O_CREAT|O_EXCL,0600);if(in<0||out<0)abort();char buffer[65536];ssize_t n;
 while((n=read(in,buffer,sizeof(buffer)))>0){ssize_t done=0;while(done<n){ssize_t wrote=write(out,buffer+done,(size_t)(n-done));if(wrote<=0)abort();done+=wrote;}}
 int ok=n==0&&close(in)==0&&close(out)==0;if(ok&&!strcmp(mode,"version-readonly-fail")&&version_copy_called==1)strcpy(version_readonly_path,dst);return ok;
}
ABI int MoveFileW(const WCHAR *from,const WCHAR *to){char src[2048],dst[2048];struct stat st;if(!versioning||!version_host_path(from,src,sizeof(src))||!version_host_path(to,dst,sizeof(dst)))abort();if(!lstat(dst,&st)){version_last_error=183;return 0;}if(rename(src,dst)){version_last_error=5;return 0;}return 1;}
ABI int ReadProcessMemory(HANDLE h,const void *a,void *buf,uint64_t size,uint64_t *got){
 const uint64_t base=0x140000000ULL,addr=(uintptr_t)a;uint64_t ptr=0;
 static const uint64_t rvas[4]={0x41d0080,0x262fb30,0x265b4d0,0x5996a10};
 static const unsigned char prefixes[4][16]={
  {0x48,0x83,0xec,0x38,0x8b,0x81,0x48,0x16,0,0,0x90,0x83,0xf8,3,0x7d,0x25},
  {0x48,0x89,0x4c,0x24,8,0x55,0x56,0x41,0x57,0x48,0x8d,0xac,0x24,0,0xfd,0xff},
  {0x48,0x89,0x54,0x24,0x10,0x48,0x89,0x4c,0x24,8,0x55,0x53,0x56,0x57,0x41,0x54},
  {0x48,0x89,0x5c,0x24,0x18,0x48,0x89,0x74,0x24,0x20,0x57,0x48,0x83,0xec,0x20,0x0f}};
 if(h!=(HANDLE)0x703)abort();
 if(addr==base+0x71cfba0&&size==256){if(!strcmp(mode,"probe-memory"))return 0;if(real_probe()){const char *fixture=getenv("AXIOM_TEST_ROBLOX_CLIENT");FILE *f=fixture?fopen(fixture,"rb"):NULL;if(!f||fseek(f,0x71ce7a0,SEEK_SET)||fread(buf,1,256,f)!=256)abort();fclose(f);if(!strcmp(mode,"probe-realtablebad"))((unsigned char*)buf)[0]^=1;}else memset(buf,0,256);*got=256;return 1;}
 for(int i=0;i<4;i++)if(addr==base+rvas[i]&&size==16){memcpy(buf,prefixes[i],16);if(!strcmp(mode,"probe-code")&&i==2)((unsigned char*)buf)[0]^=1;*got=16;return 1;}
 if(!strcmp(mode,"probe-noctx"))return 0;
 if(addr==base+0x8d06600)ptr=0x220000000ULL;
 else if(addr==0x2200001f8ULL)ptr=0x230000000ULL;
 else if(addr==0x230000440ULL)ptr=0x240000000ULL;
 else if(addr==0x240000000ULL)ptr=0x14000abcdULL;
 else abort();
 if(size!=8)abort();memcpy(buf,&ptr,8);*got=8;return 1;
}
ABI int CryptAcquireContextW(uint64_t *p,const WCHAR *container,const WCHAR *provider,DWORD type,DWORD flags){if(container||provider||type!=24||flags!=0xf0000000U)abort();if(!strcmp(mode,"probe-crypto"))return 0;*p=0x801;return 1;}
ABI int CryptCreateHash(uint64_t provider,DWORD alg,uint64_t key,DWORD flags,uint64_t *hash){if(provider!=0x801||alg!=0x800c||key||flags)abort();if(real_probe()){EVP_MD_CTX *ctx=EVP_MD_CTX_new();if(!ctx||EVP_DigestInit_ex(ctx,EVP_sha256(),NULL)!=1)abort();*hash=(uintptr_t)ctx;}else *hash=0x802;probe_hash_bytes=0;probe_hash_stage++;return 1;}
ABI int CryptHashData(uint64_t hash,const unsigned char *buf,DWORD n,DWORD flags){if(!hash||!buf||flags)abort();if(real_probe()){if(EVP_DigestUpdate((EVP_MD_CTX*)(uintptr_t)hash,buf,n)!=1)abort();}else if(hash!=0x802)abort();probe_hash_bytes+=n;return 1;}
ABI int CryptGetHashParam(uint64_t hash,DWORD param,unsigned char *dst,DWORD *n,DWORD flags){
 static const unsigned char file[32]={0xa5,0xa1,0x3a,0x9e,0x4f,0x57,0x8f,0xce,0x06,0x75,0xe0,0xdf,0xc3,0xed,0xcd,0xaa,0xd6,0x39,0xdc,0xb3,0xe3,0x06,0xba,0xde,0xb9,0xdf,0x59,0x70,0x10,0xca,0x62,0x29};
 static const unsigned char table[32]={0x21,0xfd,0xe3,0x7c,0xe0,0x44,0x8c,0x18,0xf5,0x53,0x2f,0x44,0x0b,0x09,0x5b,0x19,0xe0,0xd0,0x41,0x27,0xab,0xbb,0x8b,0x66,0x54,0x0e,0x3c,0x4c,0xd8,0x9f,0xa8,0xf3};
 if(!hash||param!=2||*n!=32||flags)abort();
 if(real_probe()){unsigned int result_size=0;if(EVP_DigestFinal_ex((EVP_MD_CTX*)(uintptr_t)hash,dst,&result_size)!=1||result_size!=32)abort();*n=result_size;return 1;}
 if(hash!=0x802)abort();
 if(probe_hash_stage==1&&probe_hash_bytes==142680528)memcpy(dst,file,32);
 else if(probe_hash_stage==2&&probe_hash_bytes==256)memcpy(dst,table,32);
 else abort();
 if((probe_hash_stage==1&&!strcmp(mode,"probe-hash"))||(probe_hash_stage==2&&!strcmp(mode,"probe-table")))dst[0]^=1;
 *n=32;return 1;
}
ABI int CryptDestroyHash(uint64_t hash){if(real_probe()){EVP_MD_CTX_free((EVP_MD_CTX*)(uintptr_t)hash);return 1;}return hash==0x802;}
ABI int CryptReleaseContext(uint64_t provider,DWORD flags){return provider==0x801&&!flags;}
ABI uint16_t RegisterClassW(const WNDCLASS *w){proc=w->lpfnWndProc;return 1;}
ABI HWND CreateWindowExW(DWORD ex,const WCHAR *cls,const WCHAR *text,DWORD style,int x,int y,int w,int h,HWND parent,HANDLE menu,HANDLE inst,void *p){
 (void)ex;(void)style;(void)x;(void)y;(void)w;(void)h;(void)inst;(void)p;
 if(!parent)return mainwin;
 if((uintptr_t)menu==101){wset(edit,text,2048);return ed;}
 if(weq(cls,"EDIT")&&weq(text,"Editor pronto. Execucao dentro do Roblox ainda nao implementada.\r\n")){wset(output,text,8192);return out;}
 return menu?menu:(HWND)(uintptr_t)(idcount++);
}
ABI LRESULT DefWindowProcW(HWND h,UINT m,WPARAM w,LPARAM l){(void)h;(void)m;(void)w;(void)l;return 0;}
ABI int ShowWindow(HWND h,int v){(void)h;(void)v;return 1;}
ABI int UpdateWindow(HWND h){(void)h;return 1;}
ABI int GetMessageW(MSG *msg,HWND h,UINT lo,UINT hi){(void)h;(void)lo;(void)hi;msg->hwnd=mainwin;msg->wParam=0;msg->lParam=0;
 if(installing){if(step++==0){msg->message=0x111;msg->wParam=110;return 1;}if(queue_pos<queue_count){msg->message=0x8002;msg->wParam=queue_event[queue_pos++];return 1;}if(!window_closed){msg->message=0x10;return 1;}return 0;}
 if(probing){if(step++==0){msg->message=0x111;msg->wParam=!strcmp(mode,"connect")?108:111;return 1;}if(queue_pos<queue_count){msg->message=queue_message[queue_pos];msg->wParam=queue_event[queue_pos];msg->lParam=queue_detail[queue_pos++];return 1;}if(!window_closed){msg->message=0x10;return 1;}return 0;}
 if(versioning){if(step++==0){msg->message=0x111;msg->wParam=(!strcmp(mode,"version-launch")||!strcmp(mode,"version-noinstall"))?113:112;return 1;}if(queue_pos<queue_count){msg->message=queue_message[queue_pos];msg->wParam=queue_event[queue_pos];msg->lParam=queue_detail[queue_pos++];return 1;}if(!window_closed){msg->message=0x10;return 1;}return 0;}
 if(localing){if(step++==0){msg->message=0x111;msg->wParam=!strcmp(mode,"execute")?109:((!strcmp(mode,"local-check")||!strcmp(mode,"local-syntax"))?114:115);return 1;}if(queue_pos<queue_count){msg->message=queue_message[queue_pos];msg->wParam=queue_event[queue_pos];msg->lParam=queue_detail[queue_pos++];return 1;}if(!window_closed){msg->message=0x10;return 1;}return 0;}
 switch(step++){
 case 0:msg->message=0x111;msg->wParam=107;return 1;
 case 1:msg->message=0x111;msg->wParam=102;return 1;
 case 2:msg->message=0x111;msg->wParam=105;return 1;
 case 3:msg->message=0x111;msg->wParam=103;return 1;
 case 4:msg->message=0x111;msg->wParam=104;return 1;
 case 5:msg->message=0x10;return 1;
 default:return 0;}
}
ABI int TranslateMessage(const MSG *m){(void)m;return 1;}
ABI LRESULT DispatchMessageW(const MSG *m){return proc(m->hwnd,m->message,m->wParam,m->lParam);}
ABI void PostQuitMessage(int n){(void)n;}
ABI int PostMessageW(HWND h,UINT m,WPARAM w,LPARAM l){(void)h;if((m!=0x8002&&m!=0x8003&&m!=0x8004&&m!=0x8005)||queue_count>=4)abort();queue_message[queue_count]=m;queue_event[queue_count]=(DWORD)w;queue_detail[queue_count++]=l;if(m==0x8003)probe_result=(int)w;if(m==0x8004)version_result=(int)w;if(m==0x8005)local_result=(int)w;posted++;return 1;}
ABI int DestroyWindow(HWND h){window_closed=1;proc(h,2,0,0);return 1;}
ABI int GetClientRect(HWND h,RECT *r){(void)h;r->left=r->top=0;r->right=1120;r->bottom=720;return 1;}
ABI int MoveWindow(HWND h,int x,int y,int w,int z,int b){(void)h;(void)x;(void)y;(void)w;(void)z;(void)b;return 1;}
ABI LRESULT SendMessageW(HWND h,UINT m,WPARAM w,LPARAM l){if(h==ed&&m==0xB0){if(w)*(DWORD*)(uintptr_t)w=0;if(l)*(DWORD*)(uintptr_t)l=0;}if(h==ed&&m==0x301)copy_called++;if(h==ed&&m==0xBA)return 3;if(h==ed&&m==0xCE)return 0;return 0;}
ABI int SetWindowTextW(HWND h,const WCHAR *s){if(h==ed){wset(edit,s,2048);if(weq(s,script))open_success=1;}if(h==out){wset(output,s,8192);if(whas(s,"Clientes Roblox detectados: 1"))scan_success=1;if(probing&&probe_result&&(!weq(s,"")))probe_log_seen=1;}return 1;}
ABI int GetWindowTextW(HWND h,WCHAR *dst,int cap){const WCHAR *src=h==ed?edit:h==out?output:path;int i=0;while(src[i]&&i+1<cap){dst[i]=src[i];i++;}dst[i]=0;return i;}
ABI int GetWindowTextLengthW(HWND h){const WCHAR *s=h==ed?edit:output;int n=0;while(s[n])n++;return n;}
ABI int EnableWindow(HWND h,int b){if(!b&&((uintptr_t)h==108||(uintptr_t)h==109))disabled++;return 1;}
ABI HANDLE LoadCursorW(HANDLE h,const WCHAR *n){(void)h;(void)n;return (HANDLE)1;}
ABI int MessageBoxW(HWND h,const WCHAR *t,const WCHAR *c,UINT x){(void)h;(void)t;(void)c;(void)x;return 7;}
ABI int FillRect(HANDLE dc,const RECT *r,HANDLE b){(void)dc;(void)r;(void)b;return 1;}
ABI int DrawTextW(HANDLE dc,const WCHAR *t,int n,RECT *r,UINT f){(void)dc;(void)t;(void)n;(void)r;(void)f;return 1;}
ABI uint64_t SetTimer(HWND h,uint64_t id,UINT t,void *p){(void)h;(void)t;(void)p;return id;}
ABI int KillTimer(HWND h,uint64_t id){(void)h;(void)id;return 1;}
ABI HANDLE GetStockObject(int n){(void)n;return (HANDLE)1;}
ABI HANDLE CreateFontW(int a,int b,int c,int d,int e,DWORD f,DWORD g,DWORD h,DWORD i,DWORD j,DWORD k,DWORD l,DWORD m,const WCHAR*n){(void)a;(void)b;(void)c;(void)d;(void)e;(void)f;(void)g;(void)h;(void)i;(void)j;(void)k;(void)l;(void)m;(void)n;return (HANDLE)1;}
ABI HANDLE CreateSolidBrush(DWORD color){(void)color;return (HANDLE)1;}
ABI int DeleteObject(HANDLE h){(void)h;return 1;}
ABI HANDLE SelectObject(HANDLE a,HANDLE b){(void)a;(void)b;return (HANDLE)1;}
ABI DWORD SetTextColor(HANDLE h,DWORD c){(void)h;return c;}
ABI DWORD SetBkColor(HANDLE h,DWORD c){(void)h;return c;}
ABI int SetBkMode(HANDLE h,int m){(void)h;return m;}
ABI int GetOpenFileNameW(OFN *o){if(o->size!=sizeof(*o)||o->maxFile!=1024)abort();wset(o->file,path,1024);opened++;return 1;}
ABI int GetSaveFileNameW(OFN *o){(void)o;abort();}
ABI HANDLE WinHttpOpen(const WCHAR *a,DWORD b,const WCHAR*c,const WCHAR*d,DWORD e){(void)a;(void)b;(void)c;(void)d;(void)e;return (HANDLE)0x601;}
ABI HANDLE WinHttpConnect(HANDLE h,const WCHAR *host,unsigned short port,DWORD f){(void)f;if(h!=(HANDLE)0x601||!weq(host,"setup.rbxcdn.com")||port!=443)abort();return (HANDLE)0x602;}
ABI HANDLE WinHttpOpenRequest(HANDLE h,const WCHAR *method,const WCHAR *path,const WCHAR*v,const WCHAR*r,const WCHAR**acc,DWORD flags){(void)v;(void)r;(void)acc;if(h!=(HANDLE)0x602||!weq(method,"GET")||!weq(path,"/RobloxPlayerInstaller.exe")||flags!=0x800000)abort();return (HANDLE)0x603;}
ABI int WinHttpSetTimeouts(HANDLE h,int a,int b,int c,int d){(void)h;(void)a;(void)b;(void)c;(void)d;return 1;}
ABI int WinHttpSetOption(HANDLE h,DWORD option,void *v,DWORD n){if(h!=(HANDLE)0x603||option!=63||n!=4||*(DWORD*)v!=2)abort();return 1;}
ABI int WinHttpSendRequest(HANDLE h,const WCHAR *hdr,DWORD a,void *b,DWORD c,DWORD d,uint64_t e){(void)hdr;(void)a;(void)b;(void)c;(void)d;(void)e;return h==(HANDLE)0x603;}
ABI int WinHttpReceiveResponse(HANDLE h,void *x){(void)x;return h==(HANDLE)0x603;}
ABI int WinHttpQueryHeaders(HANDLE h,DWORD opt,const WCHAR *n,void *buf,DWORD *size,DWORD *idx){(void)n;(void)size;(void)idx;if(h!=(HANDLE)0x603||opt!=(19U|0x20000000U))abort();*(DWORD*)buf=!strcmp(mode,"httpfail")?500:200;return 1;}
ABI int WinHttpReadData(HANDLE h,void *buf,DWORD max,DWORD *n){static const char data[]="MZsample";if(h!=(HANDLE)0x603)abort();size_t left=8-http_readpos;if(left>max)left=max;memcpy(buf,data+http_readpos,left);http_readpos+=left;*n=(DWORD)left;return 1;}
ABI int WinHttpCloseHandle(HANDLE h){(void)h;return 1;}
ABI int WinVerifyTrust(HWND h,void *g,TRUSTDATA *d){(void)h;(void)g;if(d->size!=sizeof(*d)||d->ui!=2||d->choice!=1||(d->state!=1&&d->state!=2))abort();if(d->state==1)d->stateData=(HANDLE)0x606;verify_calls++;return !strcmp(mode,"invalidsig")?1:0;}
ABI DWORD CertGetNameStringW(void *cert,DWORD type,DWORD flags,void *p,WCHAR *name,DWORD cap){(void)p;if(cert!=(void*)0x608||type!=4||flags)abort();const char *s=!strcmp(mode,"wrongpub")?"Wrong Publisher":"Roblox Corporation";fromascii(name,s,cap);return (DWORD)strlen(s)+1;}
ABI int ShellExecuteExW(SHELLINFO *s){if(versioning){char host[2048];struct stat st;if(s->cbSize!=sizeof(*s)||s->fMask!=0x40||!s->dir||!version_host_path(s->file,host,sizeof(host))||lstat(host,&st))abort();version_launch_called++;s->process=(HANDLE)0x704;return 1;}if(s->cbSize!=sizeof(*s)||s->fMask!=0x40||!weq(s->file,"C:\\Temp\\Axiom-RobloxInstaller-500-0.exe")||verify_calls!=2)abort();installer_started++;s->process=(HANDLE)0x604;return 1;}
int main(int argc,char **argv){if(argc>1)mode=argv[1];installing=!strcmp(mode,"installok")||!strcmp(mode,"invalidsig")||!strcmp(mode,"wrongpub")||!strcmp(mode,"httpfail");probing=!strncmp(mode,"probe-",6)||!strcmp(mode,"connect");versioning=!strncmp(mode,"version-",8);localing=!strncmp(mode,"local-",6)||!strcmp(mode,"execute");if(versioning)version_setup();start();return 1;}
