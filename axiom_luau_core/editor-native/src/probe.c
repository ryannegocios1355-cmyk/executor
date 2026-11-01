/* Read-only fingerprinting for the exact desktop client observed by the user.
   A fingerprint never asserts that the in-game execution engine exists. */
typedef unsigned char BYTE;
typedef unsigned short WCHAR;
typedef const WCHAR *LPCWSTR;
typedef WCHAR *LPWSTR;
typedef unsigned int DWORD;
typedef unsigned long long UINT_PTR;
typedef long long INT_PTR;
typedef int BOOL;
typedef void *HANDLE;
typedef void *HWND;

typedef struct { DWORD dwSize,cntUsage,th32ProcessID; UINT_PTR th32DefaultHeapID; DWORD th32ModuleID,cntThreads,th32ParentProcessID; int pcPriClassBase; DWORD dwFlags; WCHAR szExeFile[260]; } PROCESSENTRY32W;
typedef struct { DWORD dwSize,th32ModuleID,th32ProcessID,GlblcntUsage,ProccntUsage; BYTE *modBaseAddr; DWORD modBaseSize; HANDLE hModule; WCHAR szModule[256],szExePath[260]; } MODULEENTRY32W;

extern HANDLE CreateToolhelp32Snapshot(DWORD,DWORD);
extern BOOL Process32FirstW(HANDLE,PROCESSENTRY32W*);
extern BOOL Process32NextW(HANDLE,PROCESSENTRY32W*);
extern BOOL Module32FirstW(HANDLE,MODULEENTRY32W*);
extern HANDLE OpenProcess(DWORD,BOOL,DWORD);
extern BOOL QueryFullProcessImageNameW(HANDLE,DWORD,LPWSTR,DWORD*);
extern BOOL ReadProcessMemory(HANDLE,const void*,void*,UINT_PTR,UINT_PTR*);
extern BOOL CloseHandle(HANDLE);
extern HANDLE CreateFileW(LPCWSTR,DWORD,DWORD,void*,DWORD,DWORD,HANDLE);
extern DWORD GetFileSize(HANDLE,DWORD*);
extern BOOL ReadFile(HANDLE,void*,DWORD,DWORD*,void*);
extern BOOL CryptAcquireContextW(UINT_PTR*,LPCWSTR,LPCWSTR,DWORD,DWORD);
extern BOOL CryptCreateHash(UINT_PTR,DWORD,UINT_PTR,DWORD,UINT_PTR*);
extern BOOL CryptHashData(UINT_PTR,const BYTE*,DWORD,DWORD);
extern BOOL CryptGetHashParam(UINT_PTR,DWORD,BYTE*,DWORD*,DWORD);
extern BOOL CryptDestroyHash(UINT_PTR);
extern BOOL CryptReleaseContext(UINT_PTR,DWORD);
extern BOOL PostMessageW(HWND,unsigned int,UINT_PTR,INT_PTR);
extern void *memset(void*,int,UINT_PTR);

#define PROBE_MESSAGE 0x8003U
#define INVALID_HANDLE ((HANDLE)(INT_PTR)-1)
#define PROBE_OK 1U
#define PROBE_NONE 2U
#define PROBE_MULTIPLE 3U
#define PROBE_OPEN 4U
#define PROBE_PATH 5U
#define PROBE_FILE 6U
#define PROBE_VERSION 7U
#define PROBE_MODULE 8U
#define PROBE_MEMORY 9U
#define PROBE_TABLE 10U
#define PROBE_CODE 11U
#define PROBE_CRYPTO 12U
#define PROBE_DISCOVERY 13U

static const BYTE probe_exe_sha[32]={0xa5,0xa1,0x3a,0x9e,0x4f,0x57,0x8f,0xce,0x06,0x75,0xe0,0xdf,0xc3,0xed,0xcd,0xaa,0xd6,0x39,0xdc,0xb3,0xe3,0x06,0xba,0xde,0xb9,0xdf,0x59,0x70,0x10,0xca,0x62,0x29};
static const BYTE probe_dll_sha[32]={0xb5,0xe8,0x1e,0x0c,0xf0,0x70,0xef,0xa2,0xee,0x80,0x24,0xbc,0xd1,0x80,0x15,0x6a,0x5b,0xda,0xdd,0xc5,0x6d,0x0d,0x1f,0x4a,0x9b,0xc6,0x20,0xb8,0x75,0x37,0x61,0xde};
static const BYTE probe_table_sha[32]={0x21,0xfd,0xe3,0x7c,0xe0,0x44,0x8c,0x18,0xf5,0x53,0x2f,0x44,0x0b,0x09,0x5b,0x19,0xe0,0xd0,0x41,0x27,0xab,0xbb,0x8b,0x66,0x54,0x0e,0x3c,0x4c,0xd8,0x9f,0xa8,0xf3};
static const DWORD probe_rvas[4]={0x41d0080U,0x262fb30U,0x265b4d0U,0x5996a10U};
static const BYTE probe_code[4][16]={
 {0x48,0x83,0xec,0x38,0x8b,0x81,0x48,0x16,0x00,0x00,0x90,0x83,0xf8,0x03,0x7d,0x25},
 {0x48,0x89,0x4c,0x24,0x08,0x55,0x56,0x41,0x57,0x48,0x8d,0xac,0x24,0x00,0xfd,0xff},
 {0x48,0x89,0x54,0x24,0x10,0x48,0x89,0x4c,0x24,0x08,0x55,0x53,0x56,0x57,0x41,0x54},
 {0x48,0x89,0x5c,0x24,0x18,0x48,0x89,0x74,0x24,0x20,0x57,0x48,0x83,0xec,0x20,0x0f}
};

static int probe_equal(const BYTE *a,const BYTE *b,DWORD n){DWORD i;for(i=0;i<n;i++)if(a[i]!=b[i])return 0;return 1;}
static int probe_name(LPCWSTR a,LPCWSTR b){while(*a&&*b){WCHAR x=*a++,y=*b++;if(x>='A'&&x<='Z')x+=32;if(y>='A'&&y<='Z')y+=32;if(x!=y)return 0;}return !*a&&!*b;}
static int probe_hash_start(UINT_PTR *provider,UINT_PTR *hash){
    *provider=0;*hash=0;
    if(!CryptAcquireContextW(provider,0,0,24U,0xf0000000U))return 0;
    if(!CryptCreateHash(*provider,0x800cU,0,0,hash)){CryptReleaseContext(*provider,0);*provider=0;return 0;}
    return 1;
}
static int probe_hash_finish(UINT_PTR provider,UINT_PTR hash,BYTE out[32]){
    DWORD n=32;int ok=CryptGetHashParam(hash,2U,out,&n,0)&&n==32;
    CryptDestroyHash(hash);CryptReleaseContext(provider,0);return ok;
}
static int probe_hash_file(LPCWSTR path,DWORD expectedSize,BYTE out[32]){
    HANDLE f;UINT_PTR provider=0,hash=0,total=0;DWORD high=0,size,got;BYTE buf[65536];int result=-1;
    f=CreateFileW(path,0x80000000U,7U,0,3U,0x80U,0);if(f==INVALID_HANDLE)return -2;
    size=GetFileSize(f,&high);if(high||size!=expectedSize){CloseHandle(f);return 0;}
    if(!probe_hash_start(&provider,&hash)){CloseHandle(f);return -3;}
    do {
        got=0;
        if(!ReadFile(f,buf,sizeof(buf),&got,0)||got>sizeof(buf)||total+got>expectedSize)goto done;
        if(got&&!CryptHashData(hash,buf,got,0)){result=-3;goto done;}
        total+=got;
    }while(got);
    if(total!=expectedSize)goto done;
    result=probe_hash_finish(provider,hash,out)?1:-3;provider=0;hash=0;
done:
    if(hash)CryptDestroyHash(hash);
    if(provider)CryptReleaseContext(provider,0);
    CloseHandle(f);return result;
}
static int probe_hash_buffer(const BYTE *buffer,DWORD length,BYTE out[32]){
    UINT_PTR provider=0,hash=0;
    if(!probe_hash_start(&provider,&hash))return 0;
    if(!CryptHashData(hash,buffer,length,0)){CryptDestroyHash(hash);CryptReleaseContext(provider,0);return 0;}
    return probe_hash_finish(provider,hash,out);
}
/* Shared with the isolated client manager. 1=exact image, 0=different,
   -1/-2=file error, -3=crypto unavailable. */
__attribute__((visibility("hidden"))) int axiom_hash_known_client(LPCWSTR path){
    BYTE digest[32];int result=probe_hash_file(path,142680528U,digest);
    return result==1?(probe_equal(digest,probe_exe_sha,32)?1:0):result;
}
__attribute__((visibility("hidden"))) int axiom_hash_known_library(LPCWSTR path){
    BYTE digest[32];int result=probe_hash_file(path,17669616U,digest);
    return result==1?(probe_equal(digest,probe_dll_sha,32)?1:0):result;
}
static int probe_read(HANDLE process,UINT_PTR address,void *buffer,UINT_PTR size){
    UINT_PTR read=0;
    return address>=0x10000ULL&&address<0x0000800000000000ULL&&size<=0x100000ULL&&
        address<=0x00007fffffffffffULL-size&&
        ReadProcessMemory(process,(const void*)address,buffer,size,&read)&&read==size;
}
static int probe_pointer(HANDLE process,UINT_PTR address,UINT_PTR *out){*out=0;return probe_read(process,address,out,sizeof(*out))&&*out>=0x10000ULL&&*out<0x0000800000000000ULL;}

__attribute__((visibility("hidden"))) DWORD probe_worker(void *target){
    HANDLE processes=INVALID_HANDLE,process=0,modules=INVALID_HANDLE;PROCESSENTRY32W p;MODULEENTRY32W m;
    WCHAR path[32768];DWORD pathlen=32768,count=0,pid=0,result=PROBE_DISCOVERY,details=0,i;UINT_PTR base=0,fake=0,datamodel=0,context=0,vtable=0;
    BYTE digest[32],buffer[256];int file_result;
    processes=CreateToolhelp32Snapshot(2U,0);
    if(processes==INVALID_HANDLE)goto done;
    memset(&p,0,sizeof(p));p.dwSize=sizeof(p);
    if(Process32FirstW(processes,&p))do{if(probe_name(p.szExeFile,L"RobloxPlayerBeta.exe")){pid=p.th32ProcessID;++count;}}while(Process32NextW(processes,&p));
    if(!count){result=PROBE_NONE;goto done;}if(count!=1){result=PROBE_MULTIPLE;goto done;}
    process=OpenProcess(0x1010U,0,pid);if(!process){result=PROBE_OPEN;goto done;}
    if(!QueryFullProcessImageNameW(process,0,path,&pathlen)||!pathlen){result=PROBE_PATH;goto done;}
    file_result=axiom_hash_known_client(path);
    if(file_result==-3){result=PROBE_CRYPTO;goto done;}
    if(file_result<0){result=PROBE_FILE;goto done;}
    if(!file_result){result=PROBE_VERSION;goto done;}
    modules=CreateToolhelp32Snapshot(0x18U,pid);
    if(modules==INVALID_HANDLE){result=PROBE_MODULE;goto done;}
    memset(&m,0,sizeof(m));m.dwSize=sizeof(m);
    if(!Module32FirstW(modules,&m)||!probe_name(m.szModule,L"RobloxPlayerBeta.exe")||m.modBaseSize<0x8d06608U){result=PROBE_MODULE;goto done;}
    base=(UINT_PTR)m.modBaseAddr;if(!base){result=PROBE_MODULE;goto done;}
    if(!probe_read(process,base+0x71cfba0U,buffer,256)){result=PROBE_MEMORY;goto done;}
    if(!probe_hash_buffer(buffer,256,digest)){result=PROBE_CRYPTO;goto done;}
    if(!probe_equal(digest,probe_table_sha,32)){result=PROBE_TABLE;goto done;}
    for(i=0;i<4;i++){
        if(!probe_read(process,base+probe_rvas[i],buffer,16)){result=PROBE_MEMORY;goto done;}
        if(!probe_equal(buffer,probe_code[i],16)){result=PROBE_CODE;goto done;}
    }
    /* Candidate pointers are read only; readable is not a type assertion. */
    if(probe_pointer(process,base+0x8d06600U,&fake)){
        details|=1U;
        if(probe_pointer(process,fake+0x1f8U,&datamodel)){
            details|=2U;
            if(probe_pointer(process,datamodel+0x440U,&context)&&probe_read(process,context,&vtable,sizeof(vtable)))details|=4U;
        }
    }
    result=PROBE_OK;
done:
    if(modules!=INVALID_HANDLE)CloseHandle(modules);
    if(process)CloseHandle(process);
    if(processes!=INVALID_HANDLE)CloseHandle(processes);
    PostMessageW((HWND)target,PROBE_MESSAGE,result,(INT_PTR)details);
    return 0;
}
