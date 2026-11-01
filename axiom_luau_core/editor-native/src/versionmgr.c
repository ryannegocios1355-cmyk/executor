/* Creates a private, version-pinned copy of the already installed desktop
   client. It never edits the source installation or the Roblox process. */
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
typedef struct { DWORD low,high; } FILETIME;
typedef struct { DWORD attributes; FILETIME created,accessed,written; DWORD sizeHigh,sizeLow,reserved0,reserved1; WCHAR name[260],shortName[14]; } FINDDATAW;
typedef struct { DWORD cbSize,fMask; HWND hwnd; LPCWSTR verb,file,params,dir; int show; HANDLE inst; void *idlist; LPCWSTR cls; HANDLE key; DWORD hotkey; HANDLE icon,process; } SHELLINFO;
extern HANDLE CreateToolhelp32Snapshot(DWORD,DWORD);
extern BOOL Process32FirstW(HANDLE,PROCESSENTRY32W*);
extern BOOL Process32NextW(HANDLE,PROCESSENTRY32W*);
extern HANDLE OpenProcess(DWORD,BOOL,DWORD);
extern BOOL QueryFullProcessImageNameW(HANDLE,DWORD,LPWSTR,DWORD*);
extern BOOL CloseHandle(HANDLE);
extern DWORD GetEnvironmentVariableW(LPCWSTR,LPWSTR,DWORD);
extern DWORD GetCurrentProcessId(void);
extern DWORD GetFileAttributesW(LPCWSTR);
extern BOOL SetFileAttributesW(LPCWSTR,DWORD);
extern DWORD GetLastError(void);
extern BOOL CreateDirectoryW(LPCWSTR,void*);
extern BOOL RemoveDirectoryW(LPCWSTR);
extern BOOL DeleteFileW(LPCWSTR);
extern HANDLE FindFirstFileW(LPCWSTR,FINDDATAW*);
extern BOOL FindNextFileW(HANDLE,FINDDATAW*);
extern BOOL FindClose(HANDLE);
extern BOOL CopyFileW(LPCWSTR,LPCWSTR,BOOL);
extern BOOL MoveFileW(LPCWSTR,LPCWSTR);
extern HANDLE CreateFileW(LPCWSTR,DWORD,DWORD,void*,DWORD,DWORD,HANDLE);
extern BOOL ReadFile(HANDLE,void*,DWORD,DWORD*,void*);
extern BOOL WriteFile(HANDLE,const void*,DWORD,DWORD*,void*);
extern BOOL FlushFileBuffers(HANDLE);
extern BOOL ShellExecuteExW(SHELLINFO*);
extern BOOL PostMessageW(HWND,unsigned int,UINT_PTR,INT_PTR);
extern void *memset(void*,int,UINT_PTR);
extern __attribute__((visibility("hidden"))) int axiom_hash_known_client(LPCWSTR);
extern __attribute__((visibility("hidden"))) int axiom_hash_known_library(LPCWSTR);

#define VM_MESSAGE 0x8004U
#define INVALID_HANDLE ((HANDLE)(INT_PTR)-1)
#define INVALID_ATTRIBUTES 0xffffffffU
#define DIR_ATTRIBUTE 0x10U
#define REPARSE_ATTRIBUTE 0x400U
#define VM_PATH 1024U
#define VM_PATH_SAFE 248U
#define VM_MAX_DEPTH 32U
#define VM_MAX_FILES 50000U
#define VM_MAX_BYTES (8ULL*1024ULL*1024ULL*1024ULL)
#define VM_OK_COPIED 1U
#define VM_OK_EXISTS 2U
#define VM_OK_LAUNCH 3U
#define VM_NO_PROCESS 4U
#define VM_MULTIPLE 5U
#define VM_OPEN 6U
#define VM_VERSION 7U
#define VM_SOURCE 8U
#define VM_PATH_ERROR 9U
#define VM_IO 10U
#define VM_LINK 11U
#define VM_LIMIT 12U
#define VM_CONFLICT 13U
#define VM_NOT_INSTALLED 14U
#define VM_LAUNCH 15U
#define VM_CRYPTO 16U

static const WCHAR vm_version[]=L"version-5a21b87bbc2641cf";
static const WCHAR vm_exe[]=L"RobloxPlayerBeta.exe";
static const WCHAR vm_dll[]=L"RobloxPlayerBeta.dll";
static const WCHAR vm_marker[]=L".axiom-client-complete";
static const char vm_marker_data[]="AXIOM-CLIENT-COPY-1\nversion-5a21b87bbc2641cf\n";
typedef struct { unsigned int files; unsigned long long bytes; DWORD error; } VMCOPY;

static unsigned int vm_len(LPCWSTR s){unsigned int n=0;while(s[n]&&n<VM_PATH)n++;return n;}
static int vm_copy(WCHAR *out,LPCWSTR in){unsigned int i=0;while(in[i]){if(i+1>=VM_PATH)return 0;out[i]=in[i];i++;}out[i]=0;return 1;}
static int vm_cat(WCHAR *out,LPCWSTR in){unsigned int i=vm_len(out),j=0;if(i>=VM_PATH)return 0;while(in[j]){if(i+1>=VM_PATH)return 0;out[i++]=in[j++];}out[i]=0;return 1;}
static int vm_join(WCHAR *out,LPCWSTR dir,LPCWSTR name){unsigned int n;if(!vm_copy(out,dir))return 0;n=vm_len(out);if(n&&out[n-1]!='\\'&&!vm_cat(out,L"\\"))return 0;if(!vm_cat(out,name))return 0;return vm_len(out)<VM_PATH_SAFE;}
static unsigned int vm_lower(unsigned int c){return c>='A'&&c<='Z'?c+32:c;}
static int vm_equal(LPCWSTR a,LPCWSTR b){while(*a&&*b){if(vm_lower(*a++)!=vm_lower(*b++))return 0;}return !*a&&!*b;}
static int vm_dot(LPCWSTR s){return s[0]=='.'&&(!s[1]||(s[1]=='.'&&!s[2]));}
static unsigned int vm_number(WCHAR *out,unsigned int number){WCHAR tmp[12];unsigned int n=0,i=0;do{tmp[n++]=(WCHAR)('0'+number%10);number/=10;}while(number&&n<12);while(n)out[i++]=tmp[--n];out[i]=0;return i;}
static int vm_regular(LPCWSTR path){DWORD a=GetFileAttributesW(path);return a!=INVALID_ATTRIBUTES&&!(a&(DIR_ATTRIBUTE|REPARSE_ATTRIBUTE));}
static int vm_directory(LPCWSTR path){DWORD a=GetFileAttributesW(path);return a!=INVALID_ATTRIBUTES&&(a&DIR_ATTRIBUTE)&&!(a&REPARSE_ATTRIBUTE);}
static int vm_ensure_directory(LPCWSTR path){if(CreateDirectoryW(path,0))return 1;return GetLastError()==183U&&vm_directory(path);}
static int vm_paths(WCHAR *root,WCHAR *versions,WCHAR *target){
    WCHAR local[VM_PATH];DWORD n=GetEnvironmentVariableW(L"LOCALAPPDATA",local,VM_PATH);
    if(!n||n>=VM_PATH||!vm_directory(local))return 0;
    return vm_join(root,local,L"Axiom")&&vm_join(versions,root,L"Versions")&&vm_join(target,versions,vm_version);
}
static DWORD vm_get_source(WCHAR *path,WCHAR *directory){
    HANDLE snap=INVALID_HANDLE,process=0;PROCESSENTRY32W p;DWORD count=0,pid=0,n=VM_PATH,status=VM_SOURCE;unsigned int i;
    snap=CreateToolhelp32Snapshot(2U,0);if(snap==INVALID_HANDLE)return VM_OPEN;
    memset(&p,0,sizeof(p));p.dwSize=sizeof(p);
    if(Process32FirstW(snap,&p))do{if(vm_equal(p.szExeFile,vm_exe)){pid=p.th32ProcessID;count++;}}while(Process32NextW(snap,&p));
    CloseHandle(snap);if(!count)return VM_NO_PROCESS;if(count!=1)return VM_MULTIPLE;
    process=OpenProcess(0x1000U,0,pid);if(!process)return VM_OPEN;
    if(!QueryFullProcessImageNameW(process,0,path,&n)||!n||n>=VM_PATH_SAFE){status=VM_PATH_ERROR;goto done;}
    i=vm_len(path);while(i&&path[i-1]!='\\'&&path[i-1]!='/')i--;
    if(!i||!vm_equal(path+i,vm_exe)||!vm_copy(directory,path)){status=VM_SOURCE;goto done;}
    if(i==3&&directory[1]==':')directory[i]=0;else directory[i-1]=0;
    if(!vm_directory(directory)||!vm_regular(path)){status=VM_SOURCE;goto done;}
    {int hash=axiom_hash_known_client(path);if(hash==-3){status=VM_CRYPTO;goto done;}if(hash<0){status=VM_IO;goto done;}if(!hash){status=VM_VERSION;goto done;}}
    status=0;
done:CloseHandle(process);return status;
}
static int vm_valid_install(LPCWSTR target){
    WCHAR path[VM_PATH];HANDLE f;char marker[sizeof(vm_marker_data)];DWORD got=0;unsigned int i;
    if(!vm_directory(target)||!vm_join(path,target,vm_marker)||!vm_regular(path))return 0;
    f=CreateFileW(path,0x80000000U,1U,0,3U,0x80U,0);if(f==INVALID_HANDLE)return 0;
    if(!ReadFile(f,marker,sizeof(marker),&got,0)){CloseHandle(f);return 0;}CloseHandle(f);
    if(got!=sizeof(vm_marker_data)-1)return 0;
    for(i=0;i<got;i++)if(marker[i]!=vm_marker_data[i])return 0;
    if(!vm_join(path,target,vm_dll)||!vm_regular(path)||axiom_hash_known_library(path)!=1||!vm_join(path,target,vm_exe)||!vm_regular(path))return 0;
    return axiom_hash_known_client(path)==1;
}
/* Remove only our newly created staging tree; never follow reparse points. */
static void vm_remove_tree(LPCWSTR root,unsigned int depth){
    WCHAR pattern[VM_PATH],child[VM_PATH];FINDDATAW data;HANDLE h;DWORD a;
    if(depth>VM_MAX_DEPTH)return;
    a=GetFileAttributesW(root);if(a==INVALID_ATTRIBUTES)return;
    if(a&REPARSE_ATTRIBUTE){if(a&DIR_ATTRIBUTE)RemoveDirectoryW(root);else DeleteFileW(root);return;}
    if(!(a&DIR_ATTRIBUTE)||!vm_join(pattern,root,L"*"))return;
    h=FindFirstFileW(pattern,&data);
    if(h!=INVALID_HANDLE){do{
        if(vm_dot(data.name)||!vm_join(child,root,data.name))continue;
        a=GetFileAttributesW(child);if(a==INVALID_ATTRIBUTES)continue;
        if((a&DIR_ATTRIBUTE)&&!(a&REPARSE_ATTRIBUTE))vm_remove_tree(child,depth+1);
        else if(a&DIR_ATTRIBUTE)RemoveDirectoryW(child);
        else{if(!(a&REPARSE_ATTRIBUTE)&&(a&1U)){DWORD clean=a&~1U;SetFileAttributesW(child,clean?clean:0x80U);}DeleteFileW(child);}
    }while(FindNextFileW(h,&data));FindClose(h);}
    RemoveDirectoryW(root);
}
static int vm_copy_tree(LPCWSTR source,LPCWSTR dest,unsigned int depth,VMCOPY *copy){
    WCHAR pattern[VM_PATH],from[VM_PATH],to[VM_PATH];FINDDATAW data;HANDLE h;DWORD a,last;unsigned long long length;
    if(depth>VM_MAX_DEPTH){copy->error=VM_LIMIT;return 0;}
    if(!vm_join(pattern,source,L"*")){copy->error=VM_PATH_ERROR;return 0;}
    h=FindFirstFileW(pattern,&data);
    if(h==INVALID_HANDLE){if(GetLastError()==2U)return 1;copy->error=VM_IO;return 0;}
    do{
        if(vm_dot(data.name))continue;
        if(!vm_join(from,source,data.name)||!vm_join(to,dest,data.name)){copy->error=VM_PATH_ERROR;goto fail;}
        a=GetFileAttributesW(from);if(a==INVALID_ATTRIBUTES){copy->error=VM_IO;goto fail;}
        if(a&REPARSE_ATTRIBUTE){copy->error=VM_LINK;goto fail;}
        if(a&DIR_ATTRIBUTE){
            if(!CreateDirectoryW(to,0)){copy->error=VM_IO;goto fail;}
            if(!vm_copy_tree(from,to,depth+1,copy))goto fail;
        }else{
            length=((unsigned long long)data.sizeHigh<<32)|data.sizeLow;
            if(++copy->files>VM_MAX_FILES||length>VM_MAX_BYTES-copy->bytes){copy->error=VM_LIMIT;goto fail;}
            if(!CopyFileW(from,to,1)){copy->error=VM_IO;goto fail;}
            copy->bytes+=length;
        }
    }while(FindNextFileW(h,&data));
    last=GetLastError();FindClose(h);if(last!=18U){copy->error=VM_IO;return 0;}return 1;
fail:FindClose(h);return 0;
}
static int vm_write_marker(LPCWSTR target){
    WCHAR path[VM_PATH];HANDLE f;DWORD wrote=0;int ok;
    if(!vm_join(path,target,vm_marker))return 0;
    f=CreateFileW(path,0x40000000U,0,0,1U,0x80U,0);if(f==INVALID_HANDLE)return 0;
    ok=WriteFile(f,vm_marker_data,sizeof(vm_marker_data)-1,&wrote,0)&&wrote==sizeof(vm_marker_data)-1&&FlushFileBuffers(f);
    CloseHandle(f);if(!ok)DeleteFileW(path);return ok;
}
__attribute__((visibility("hidden"))) DWORD version_worker_prepare(void *targetWindow){
    WCHAR root[VM_PATH],versions[VM_PATH],target[VM_PATH],stage[VM_PATH],source[VM_PATH],exe[VM_PATH],name[64],suffix[16],required[VM_PATH];
    DWORD result=VM_IO;unsigned int i;int stage_created=0;VMCOPY copy;
    memset(&copy,0,sizeof(copy));
    if(!vm_paths(root,versions,target)){result=VM_PATH_ERROR;goto done;}
    if(!vm_ensure_directory(root)||!vm_ensure_directory(versions)){result=VM_IO;goto done;}
    if(GetFileAttributesW(target)!=INVALID_ATTRIBUTES){result=vm_valid_install(target)?VM_OK_EXISTS:VM_CONFLICT;goto done;}
    result=vm_get_source(exe,source);if(result)goto done;
    if(!vm_join(required,source,vm_dll)||!vm_regular(required)){result=VM_SOURCE;goto done;}
    {int hash=axiom_hash_known_library(required);if(hash==-3){result=VM_CRYPTO;goto done;}if(hash<0){result=VM_IO;goto done;}if(!hash){result=VM_VERSION;goto done;}}
    for(i=0;i<32;i++){
        vm_copy(name,L"Axiom-staging-");vm_number(suffix,GetCurrentProcessId());vm_cat(name,suffix);vm_cat(name,L"-");vm_number(suffix,i);vm_cat(name,suffix);
        if(!vm_join(stage,versions,name)){result=VM_PATH_ERROR;goto done;}
        if(CreateDirectoryW(stage,0)){stage_created=1;break;}
        if(GetLastError()!=183U){result=VM_IO;goto done;}
    }
    if(!stage_created){result=VM_IO;goto done;}
    if(!vm_copy_tree(source,stage,0,&copy)){result=copy.error;goto done;}
    if(!vm_join(required,stage,vm_exe)||axiom_hash_known_client(required)!=1||!vm_join(required,stage,vm_dll)||!vm_regular(required)||axiom_hash_known_library(required)!=1){result=VM_IO;goto done;}
    if(!vm_write_marker(stage)){result=VM_IO;goto done;}
    if(!MoveFileW(stage,target)){result=VM_CONFLICT;goto done;}
    stage_created=0;result=VM_OK_COPIED;
done:
    if(stage_created)vm_remove_tree(stage,0);
    PostMessageW((HWND)targetWindow,VM_MESSAGE,result,0);return 0;
}
__attribute__((visibility("hidden"))) DWORD version_worker_launch(void *targetWindow){
    WCHAR root[VM_PATH],versions[VM_PATH],target[VM_PATH],exe[VM_PATH];SHELLINFO shell;DWORD result=VM_LAUNCH;
    if(!vm_paths(root,versions,target)){result=VM_PATH_ERROR;goto done;}
    if(!vm_directory(root)||!vm_directory(versions)||!vm_valid_install(target)){result=VM_NOT_INSTALLED;goto done;}
    if(!vm_join(exe,target,vm_exe)){result=VM_PATH_ERROR;goto done;}
    memset(&shell,0,sizeof(shell));shell.cbSize=sizeof(shell);shell.fMask=0x40U;shell.hwnd=(HWND)targetWindow;shell.file=exe;shell.dir=target;shell.show=1;
    if(!ShellExecuteExW(&shell))goto done;
    if(shell.process)CloseHandle(shell.process);
    result=VM_OK_LAUNCH;
done:PostMessageW((HWND)targetWindow,VM_MESSAGE,result,0);return 0;
}
