/* Downloads and launches Roblox's official installer, after signature validation. */
typedef unsigned short WCHAR;
typedef const WCHAR *LPCWSTR;
typedef unsigned int DWORD;
typedef unsigned int UINT;
typedef int BOOL;
typedef unsigned long long UINT_PTR;
typedef long long INT_PTR;
typedef UINT_PTR WPARAM;
typedef INT_PTR LPARAM;
typedef void *HANDLE;
typedef HANDLE HWND;
typedef HANDLE HINTERNET;
typedef struct { DWORD d1; unsigned short d2,d3; unsigned char d4[8]; } GUID;
typedef struct { DWORD cbStruct; LPCWSTR pcwszFilePath; HANDLE hFile; GUID *pgKnownSubject; } WINTRUST_FILE_INFO;
typedef struct { DWORD cbStruct; void *pCert; } CRYPT_PROVIDER_CERT_PREFIX;
typedef struct { DWORD cbStruct; void *pPolicyCallbackData,*pSIPClientData; DWORD dwUIChoice,fdwRevocationChecks,dwUnionChoice; WINTRUST_FILE_INFO *pFile; DWORD dwStateAction; HANDLE hWVTStateData; LPCWSTR pwszURLReference; DWORD dwProvFlags,dwUIContext; void *pSignatureSettings; } WINTRUST_DATA;
typedef struct { DWORD cbSize,fMask; HWND hwnd; LPCWSTR lpVerb,lpFile,lpParameters,lpDirectory; int nShow; HANDLE hInstApp; void *lpIDList; LPCWSTR lpClass; HANDLE hkeyClass; DWORD dwHotKey; HANDLE hIcon,hProcess; } SHELLEXECUTEINFOW;
extern void *memset(void*,int,UINT_PTR);
extern DWORD GetTempPathW(DWORD,WCHAR*);
extern DWORD GetCurrentProcessId(void);
extern HANDLE LoadLibraryW(LPCWSTR);
extern void *GetProcAddress(HANDLE,const char*);
extern BOOL FreeLibrary(HANDLE);
extern HANDLE CreateFileW(LPCWSTR,DWORD,DWORD,void*,DWORD,DWORD,HANDLE);
extern BOOL WriteFile(HANDLE,const void*,DWORD,DWORD*,void*);
extern BOOL FlushFileBuffers(HANDLE);
extern BOOL CloseHandle(HANDLE);
extern BOOL DeleteFileW(LPCWSTR);
extern DWORD WaitForSingleObject(HANDLE,DWORD);
extern BOOL GetExitCodeProcess(HANDLE,DWORD*);
extern BOOL PostMessageW(HWND,UINT,WPARAM,LPARAM);
extern HINTERNET WinHttpOpen(LPCWSTR,DWORD,LPCWSTR,LPCWSTR,DWORD);
extern HINTERNET WinHttpConnect(HINTERNET,LPCWSTR,unsigned short,DWORD);
extern HINTERNET WinHttpOpenRequest(HINTERNET,LPCWSTR,LPCWSTR,LPCWSTR,LPCWSTR,LPCWSTR*,DWORD);
extern BOOL WinHttpSetTimeouts(HINTERNET,int,int,int,int);
extern BOOL WinHttpSetOption(HINTERNET,DWORD,void*,DWORD);
extern BOOL WinHttpSendRequest(HINTERNET,LPCWSTR,DWORD,void*,DWORD,DWORD,UINT_PTR);
extern BOOL WinHttpReceiveResponse(HINTERNET,void*);
extern BOOL WinHttpQueryHeaders(HINTERNET,DWORD,LPCWSTR,void*,DWORD*,DWORD*);
extern BOOL WinHttpReadData(HINTERNET,void*,DWORD,DWORD*);
extern BOOL WinHttpCloseHandle(HINTERNET);
extern int WinVerifyTrust(HWND,GUID*,WINTRUST_DATA*);
extern DWORD CertGetNameStringW(void*,DWORD,DWORD,void*,WCHAR*,DWORD);
extern BOOL ShellExecuteExW(SHELLEXECUTEINFOW*);
#define NULL ((void*)0)
#define INVALID_HANDLE ((HANDLE)(INT_PTR)-1)
#define WM_INSTALL_EVENT 0x8002U
#define GENERIC_WRITE 0x40000000U
#define GENERIC_READ 0x80000000U
#define FILE_SHARE_READ 1U
#define OPEN_EXISTING 3U
#define CREATE_NEW 1U
#define FILE_ATTRIBUTE_NORMAL 0x80U
#define WINHTTP_FLAG_SECURE 0x00800000U
#define WINHTTP_OPTION_DISABLE_FEATURE 63U
#define WINHTTP_DISABLE_REDIRECTS 2U
#define HTTP_STATUS_CODE (19U|0x20000000U)
#define MAX_INSTALLER (64U*1024U*1024U)
#define INSTALL_STARTED 1U
#define INSTALL_DONE 2U
#define INSTALL_DOWNLOAD_ERROR 3U
#define INSTALL_VERIFY_ERROR 4U
#define INSTALL_START_ERROR 5U
#define INSTALL_TIMEOUT 6U
#define INSTALL_FAILED 7U

static unsigned int append(WCHAR *out,unsigned int pos,unsigned int cap,LPCWSTR in){unsigned int i=0;while(in[i]&&pos+1<cap)out[pos++]=in[i++];out[pos]=0;return pos;}
static unsigned int num(WCHAR *out,unsigned int pos,unsigned int cap,unsigned int v){WCHAR tmp[16];unsigned int n=0;do{tmp[n++]=(WCHAR)('0'+v%10);v/=10;}while(v&&n<16);while(n&&pos+1<cap)out[pos++]=tmp[--n];out[pos]=0;return pos;}
static void notice(HWND h,DWORD result,DWORD details){PostMessageW(h,WM_INSTALL_EVENT,result,(LPARAM)details);}

static int same_name(LPCWSTR a,LPCWSTR b){while(*a&&*b){unsigned int x=*a++,y=*b++;if(x>='A'&&x<='Z')x+=32;if(y>='A'&&y<='Z')y+=32;if(x!=y)return 0;}return *a==*b;}
static int verify_signature(LPCWSTR path,HANDLE guard){
    GUID action={0x00aac56b,0xcd44,0x11d0,{0x8c,0xc2,0x00,0xc0,0x4f,0xc2,0x95,0xee}};
    typedef void *(*ProviderDataFn)(HANDLE);
    typedef void *(*SignerFn)(void*,DWORD,BOOL,DWORD);
    typedef CRYPT_PROVIDER_CERT_PREFIX *(*CertFn)(void*,DWORD);
    WINTRUST_FILE_INFO file;WINTRUST_DATA data;int result,good=0;HANDLE lib;ProviderDataFn getData;SignerFn getSigner;CertFn getCert;void *provider,*signer;CRYPT_PROVIDER_CERT_PREFIX *cert;WCHAR subject[256];
    memset(&file,0,sizeof(file));file.cbStruct=sizeof(file);file.pcwszFilePath=path;file.hFile=guard;
    memset(&data,0,sizeof(data));data.cbStruct=sizeof(data);data.dwUIChoice=2;data.dwUnionChoice=1;data.pFile=&file;data.dwStateAction=1;
    result=WinVerifyTrust((HWND)(INT_PTR)-1,&action,&data);
    if(result==0&&data.hWVTStateData){
        lib=LoadLibraryW(L"wintrust.dll");
        if(lib){
            getData=(ProviderDataFn)GetProcAddress(lib,"WTHelperProvDataFromStateData");
            getSigner=(SignerFn)GetProcAddress(lib,"WTHelperGetProvSignerFromChain");
            getCert=(CertFn)GetProcAddress(lib,"WTHelperGetProvCertFromChain");
            if(getData&&getSigner&&getCert){
                provider=getData(data.hWVTStateData);signer=provider?getSigner(provider,0,0,0):NULL;cert=signer?getCert(signer,0):NULL;
                if(cert&&cert->pCert&&CertGetNameStringW(cert->pCert,4,0,NULL,subject,256)>1)
                    good=same_name(subject,L"Roblox Corporation");
            }
            FreeLibrary(lib);
        }
    }
    data.dwStateAction=2;WinVerifyTrust((HWND)(INT_PTR)-1,&action,&data);return good;
}

DWORD installer_worker(void *target){
    HWND h=(HWND)target;HINTERNET session=NULL,conn=NULL,req=NULL;
    HANDLE file=INVALID_HANDLE,guard=INVALID_HANDLE;WCHAR dir[520],path[600];DWORD dirLen,n,attempt,disabled=WINHTTP_DISABLE_REDIRECTS,code=0,codesz=sizeof(code),got,wrote,total=0,offset,exitcode=0,wait;char buf[16384];
    SHELLEXECUTEINFOW launch;DWORD result=INSTALL_DOWNLOAD_ERROR;int created=0,launched=0;
    dirLen=GetTempPathW(520,dir);if(!dirLen||dirLen>=520)goto done;
    for(attempt=0;attempt<32;attempt++){
        n=append(path,0,600,dir);n=append(path,n,600,L"Axiom-RobloxInstaller-");n=num(path,n,600,GetCurrentProcessId());n=append(path,n,600,L"-");n=num(path,n,600,attempt);append(path,n,600,L".exe");
        file=CreateFileW(path,GENERIC_WRITE,0,NULL,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,NULL);if(file!=INVALID_HANDLE){created=1;break;}
    }
    if(!created)goto done;
    session=WinHttpOpen(L"AxiomInstaller/1.0",1,NULL,NULL,0);if(!session)goto done;
    WinHttpSetTimeouts(session,10000,10000,30000,30000);
    conn=WinHttpConnect(session,L"setup.rbxcdn.com",443,0);if(!conn)goto done;
    req=WinHttpOpenRequest(conn,L"GET",L"/RobloxPlayerInstaller.exe",NULL,NULL,NULL,WINHTTP_FLAG_SECURE);if(!req)goto done;
    if(!WinHttpSetOption(req,WINHTTP_OPTION_DISABLE_FEATURE,&disabled,sizeof(disabled)))goto done;
    if(!WinHttpSendRequest(req,NULL,0,NULL,0,0,0)||!WinHttpReceiveResponse(req,NULL))goto done;
    if(!WinHttpQueryHeaders(req,HTTP_STATUS_CODE,NULL,&code,&codesz,NULL)||code!=200)goto done;
    do{
        got=0;if(!WinHttpReadData(req,buf,sizeof(buf),&got))goto done;
        if(got>MAX_INSTALLER-total)goto done;
        offset=0;while(offset<got){wrote=0;if(!WriteFile(file,buf+offset,got-offset,&wrote,NULL)||!wrote)goto done;offset+=wrote;}
        total+=got;
    }while(got);
    if(!total||!FlushFileBuffers(file))goto done;
    CloseHandle(file);file=INVALID_HANDLE;
    guard=CreateFileW(path,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
    if(guard==INVALID_HANDLE||!verify_signature(path,guard)){result=INSTALL_VERIFY_ERROR;goto done;}
    memset(&launch,0,sizeof(launch));launch.cbSize=sizeof(launch);launch.fMask=0x40U;launch.lpVerb=L"open";launch.lpFile=path;launch.nShow=1;
    if(!ShellExecuteExW(&launch)||!launch.hProcess){result=INSTALL_START_ERROR;goto done;}
    CloseHandle(guard);guard=INVALID_HANDLE;
    launched=1;notice(h,INSTALL_STARTED,0);
    wait=WaitForSingleObject(launch.hProcess,20U*60U*1000U);
    if(wait==0){if(GetExitCodeProcess(launch.hProcess,&exitcode)){result=exitcode==0?INSTALL_DONE:INSTALL_FAILED;}else result=INSTALL_FAILED;}
    else result=INSTALL_TIMEOUT;
    CloseHandle(launch.hProcess);
done:
    if(file!=INVALID_HANDLE)CloseHandle(file);
    if(guard!=INVALID_HANDLE)CloseHandle(guard);
    if(req)WinHttpCloseHandle(req);
    if(conn)WinHttpCloseHandle(conn);
    if(session)WinHttpCloseHandle(session);
    if(created && (!launched || result!=INSTALL_TIMEOUT))DeleteFileW(path);
    notice(h,result,exitcode);return 0;
}
