/* Runs the bundled, standalone Luau CLI through redirected standard I/O.
   This does not access or connect to the Roblox client. */
typedef unsigned short WCHAR;
typedef unsigned int DWORD;
typedef unsigned int UINT;
typedef int BOOL;
typedef unsigned long long UINT_PTR;
typedef long long INT_PTR;
typedef void *HANDLE;
typedef HANDLE HWND;
typedef const WCHAR *LPCWSTR;
typedef WCHAR *LPWSTR;
typedef struct { DWORD length; void *descriptor; BOOL inherit; } SECURITY_ATTRIBUTES;
typedef struct {
    DWORD size; LPWSTR reserved,desktop,title;
    DWORD x,y,xsize,ysize,xchars,ychars,fill,flags;
    unsigned short show,reserved2size; unsigned char *reserved2;
    HANDLE input,output,error;
} STARTUPINFO;
typedef struct { HANDLE process,thread; DWORD process_id,thread_id; } PROCESS_INFO;
typedef struct { DWORD truncated; WCHAR text[6001]; } LOCAL_RESULT;
typedef struct { HWND owner; char *source; DWORD length; int check; } LOCAL_WORK;
typedef struct { HANDLE process; volatile DWORD timed_out,failed; } WATCH;

extern void *memset(void *,int,UINT_PTR);
extern HANDLE GetProcessHeap(void);
extern void *HeapAlloc(HANDLE,DWORD,UINT_PTR);
extern BOOL HeapFree(HANDLE,DWORD,void *);
extern HANDLE CreateThread(void *,UINT_PTR,DWORD (*)(void *),void *,DWORD,DWORD *);
extern BOOL CloseHandle(HANDLE);
extern DWORD GetModuleFileNameW(HANDLE,LPWSTR,DWORD);
extern DWORD GetFileAttributesW(LPCWSTR);
extern BOOL CreatePipe(HANDLE *,HANDLE *,SECURITY_ATTRIBUTES *,DWORD);
extern BOOL SetHandleInformation(HANDLE,DWORD,DWORD);
extern BOOL CreateProcessW(LPCWSTR,LPWSTR,void *,void *,BOOL,DWORD,void *,LPCWSTR,STARTUPINFO *,PROCESS_INFO *);
extern BOOL WriteFile(HANDLE,const void *,DWORD,DWORD *,void *);
extern BOOL ReadFile(HANDLE,void *,DWORD,DWORD *,void *);
extern DWORD WaitForSingleObject(HANDLE,DWORD);
extern BOOL TerminateProcess(HANDLE,UINT);
extern BOOL GetExitCodeProcess(HANDLE,DWORD *);
extern int GetWindowTextLengthW(HWND);
extern int GetWindowTextW(HWND,LPWSTR,int);
extern int WideCharToMultiByte(UINT,DWORD,LPCWSTR,int,char *,int,const char *,BOOL *);
extern int MultiByteToWideChar(UINT,DWORD,const char *,int,LPWSTR,int);
extern BOOL PostMessageW(HWND,UINT,UINT_PTR,INT_PTR);

#define NULL ((void *)0)
#define TRUE 1
#define FALSE 0
#define CP_UTF8 65001U
#define WC_ERR_INVALID_CHARS 0x80U
#define WM_LOCAL_EVENT 0x8005U
#define INVALID_ATTRIBUTES 0xffffffffU
#define FILE_ATTRIBUTE_DIRECTORY 0x10U
#define HANDLE_FLAG_INHERIT 1U
#define STARTF_USESTDHANDLES 0x100U
#define CREATE_NO_WINDOW 0x08000000U
#define WAIT_OBJECT_0 0U
#define WAIT_TIMEOUT 258U
#define INFINITE 0xffffffffU
#define MAX_SCRIPT_CHARS 524288

static void *local_alloc(UINT_PTR n){return HeapAlloc(GetProcessHeap(),8,n);}
static void local_free(void *p){if(p)HeapFree(GetProcessHeap(),0,p);}
static void close_handle(HANDLE *p){if(*p){CloseHandle(*p);*p=NULL;}}
static unsigned int local_append(WCHAR *d,unsigned int p,unsigned int cap,LPCWSTR s){while(*s&&p+1<cap)d[p++]=*s++;d[p]=0;return p;}

static DWORD watchdog(void *arg){
    WATCH *w=(WATCH *)arg;DWORD r=WaitForSingleObject(w->process,15000);
    if(r==WAIT_TIMEOUT){w->timed_out=1;TerminateProcess(w->process,124);}
    else if(r!=WAIT_OBJECT_0){w->failed=1;TerminateProcess(w->process,125);}
    return 0;
}

static DWORD local_worker(void *arg){
    LOCAL_WORK *w=(LOCAL_WORK *)arg;LOCAL_RESULT *result=NULL;
    SECURITY_ATTRIBUTES sa;STARTUPINFO si;PROCESS_INFO pi;WATCH watch;
    HANDLE in_read=NULL,in_write=NULL,out_read=NULL,out_write=NULL,timer=NULL;
    WCHAR exe[2048],cmd[2200];char chunk[1024],captured[6000];
    DWORD n,p,attributes,total=0,got,wrote,exit_code=1,status=6;int chars,input_failed=0;unsigned int i;
    memset(&sa,0,sizeof(sa));sa.length=sizeof(sa);sa.inherit=TRUE;
    memset(&si,0,sizeof(si));si.size=sizeof(si);si.flags=STARTF_USESTDHANDLES;
    memset(&pi,0,sizeof(pi));memset(&watch,0,sizeof(watch));
    n=GetModuleFileNameW(NULL,exe,2048);
    if(!n||n>=2048){status=3;goto done;}
    while(n&&exe[n-1]!=L'\\'&&exe[n-1]!=L'/')--n;
    if(!n||n+16>=2048){status=3;goto done;}
    local_append(exe,n,2048,L"axiom-luau.exe");
    attributes=GetFileAttributesW(exe);
    if(attributes==INVALID_ATTRIBUTES||(attributes&FILE_ATTRIBUTE_DIRECTORY)){status=3;goto done;}
    p=local_append(cmd,0,2200,L"\"");p=local_append(cmd,p,2200,exe);p=local_append(cmd,p,2200,L"\" ");
    local_append(cmd,p,2200,w->check?L"check -":L"run - --timeout-ms 5000");
    if(!CreatePipe(&in_read,&in_write,&sa,0)||!CreatePipe(&out_read,&out_write,&sa,0))goto done;
    if(!SetHandleInformation(in_write,HANDLE_FLAG_INHERIT,0)||!SetHandleInformation(out_read,HANDLE_FLAG_INHERIT,0))goto done;
    si.input=in_read;si.output=out_write;si.error=out_write;
    if(!CreateProcessW(exe,cmd,NULL,NULL,TRUE,CREATE_NO_WINDOW,NULL,NULL,&si,&pi)){status=4;goto done;}
    close_handle(&in_read);close_handle(&out_write);close_handle(&pi.thread);
    watch.process=pi.process;
    timer=CreateThread(NULL,0,watchdog,&watch,0,NULL);
    if(!timer){TerminateProcess(pi.process,125);WaitForSingleObject(pi.process,15000);goto done;}
    while(total<w->length){wrote=0;if(!WriteFile(in_write,w->source+total,w->length-total,&wrote,NULL)||!wrote)break;total+=wrote;}
    if(total!=w->length)input_failed=1;
    close_handle(&in_write);
    total=0;
    result=(LOCAL_RESULT *)local_alloc(sizeof(*result));
    for(;;){
        got=0;if(!ReadFile(out_read,chunk,sizeof(chunk),&got,NULL)||!got)break;
        for(i=0;i<got;i++){if(total<sizeof(captured))captured[total++]=chunk[i];else if(result)result->truncated=1;}
    }
    WaitForSingleObject(timer,INFINITE);close_handle(&timer);
    if(watch.timed_out)status=5;
    else if(watch.failed||input_failed||!GetExitCodeProcess(pi.process,&exit_code))status=6;
    else status=exit_code?2:1;
    if(result){
        chars=total?MultiByteToWideChar(CP_UTF8,0,captured,(int)total,result->text,6000):0;
        if(chars<0||chars>6000)chars=0;
        for(i=0;i<(unsigned int)chars;i++)if(!result->text[i])result->text[i]=L' ';
        result->text[chars]=0;
    }
done:
    close_handle(&timer);close_handle(&in_read);close_handle(&in_write);
    close_handle(&out_read);close_handle(&out_write);close_handle(&pi.thread);close_handle(&pi.process);
    local_free(w->source);
    if(!PostMessageW(w->owner,WM_LOCAL_EVENT,(UINT_PTR)status,(INT_PTR)result))local_free(result);
    local_free(w);return 0;
}

int localrun_start(HWND owner,HWND editor,int check){
    LOCAL_WORK *w;WCHAR *wide;HANDLE thread;int chars,bytes;
    chars=GetWindowTextLengthW(editor);if(chars<0||chars>MAX_SCRIPT_CHARS)return 0;
    wide=(WCHAR *)local_alloc(((UINT_PTR)chars+1)*sizeof(WCHAR));if(!wide)return 0;
    chars=GetWindowTextW(editor,wide,chars+1);
    bytes=chars?WideCharToMultiByte(CP_UTF8,WC_ERR_INVALID_CHARS,wide,chars,NULL,0,NULL,NULL):0;
    if(chars&&bytes<=0){local_free(wide);return 0;}
    w=(LOCAL_WORK *)local_alloc(sizeof(*w));if(!w){local_free(wide);return 0;}
    w->source=(char *)local_alloc((UINT_PTR)bytes+1);
    if(!w->source){local_free(wide);local_free(w);return 0;}
    if(bytes&&WideCharToMultiByte(CP_UTF8,WC_ERR_INVALID_CHARS,wide,chars,w->source,bytes,NULL,NULL)!=bytes){local_free(wide);local_free(w->source);local_free(w);return 0;}
    local_free(wide);w->owner=owner;w->length=(DWORD)bytes;w->check=check;
    thread=CreateThread(NULL,0,local_worker,w,0,NULL);
    if(!thread){local_free(w->source);local_free(w);return 0;}
    CloseHandle(thread);return 1;
}
