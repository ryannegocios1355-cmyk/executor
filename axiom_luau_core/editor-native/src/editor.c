/* Axiom native editor. Roblox execution is intentionally unavailable. */
typedef unsigned short WCHAR;
typedef const WCHAR *LPCWSTR;
typedef WCHAR *LPWSTR;
typedef unsigned int DWORD;
typedef unsigned short WORD;
typedef unsigned int UINT;
typedef int BOOL;
typedef unsigned long long UINT_PTR;
typedef long long INT_PTR;
typedef UINT_PTR WPARAM;
typedef INT_PTR LPARAM;
typedef INT_PTR LRESULT;
typedef void *HANDLE;
typedef HANDLE HWND;
typedef HANDLE HINSTANCE;
typedef HANDLE HICON;
typedef HANDLE HCURSOR;
typedef HANDLE HBRUSH;
typedef HANDLE HMENU;
typedef HANDLE HFONT;
typedef HANDLE HDC;
typedef HANDLE HGDIOBJ;
typedef struct { int x,y; } POINT;
typedef struct { POINT reserved,maxSize,maxPosition,minTrackSize,maxTrackSize; } MINMAXINFO;
typedef struct { int left,top,right,bottom; } RECT;
typedef struct { HWND hwnd; UINT message; WPARAM wParam; LPARAM lParam; DWORD time; POINT pt; DWORD private_field; } MSG;
typedef LRESULT (*WNDPROC)(HWND, UINT, WPARAM, LPARAM);
typedef struct { UINT style; WNDPROC lpfnWndProc; int cbClsExtra, cbWndExtra; HINSTANCE hInstance; HICON hIcon; HCURSOR hCursor; HBRUSH hbrBackground; LPCWSTR lpszMenuName; LPCWSTR lpszClassName; } WNDCLASSW;
typedef struct { UINT CtlType,CtlID,itemID,itemAction,itemState; HWND hwndItem; HDC hDC; RECT rcItem; UINT_PTR itemData; } DRAWITEMSTRUCT;
typedef struct { DWORD lStructSize; HWND hwndOwner; HINSTANCE hInstance; LPCWSTR lpstrFilter; LPWSTR lpstrCustomFilter; DWORD nMaxCustFilter,nFilterIndex; LPWSTR lpstrFile; DWORD nMaxFile; LPWSTR lpstrFileTitle; DWORD nMaxFileTitle; LPCWSTR lpstrInitialDir,lpstrTitle; DWORD Flags; WORD nFileOffset,nFileExtension; LPCWSTR lpstrDefExt; LPARAM lCustData; void *lpfnHook; LPCWSTR lpTemplateName; void *pvReserved; DWORD dwReserved,FlagsEx; } OPENFILENAMEW;
typedef struct { DWORD dwSize,cntUsage,th32ProcessID; UINT_PTR th32DefaultHeapID; DWORD th32ModuleID,cntThreads,th32ParentProcessID; int pcPriClassBase; DWORD dwFlags; WCHAR szExeFile[260]; } PROCESSENTRY32W;

void start(void);
void (*axiom_relocation_anchor)(void) = start;
extern HANDLE GetProcessHeap(void);
extern void *HeapAlloc(HANDLE,DWORD,UINT_PTR);
extern BOOL HeapFree(HANDLE,DWORD,void*);
extern HINSTANCE GetModuleHandleW(LPCWSTR);
extern HINSTANCE LoadLibraryW(LPCWSTR);
extern void *GetProcAddress(HINSTANCE,const char*);
extern void ExitProcess(UINT);
extern HANDLE CreateThread(void*,UINT_PTR,DWORD (*)(void*),void*,DWORD,DWORD*);
extern BOOL CloseHandle(HANDLE);
extern DWORD GetCurrentProcessId(void);
extern int WideCharToMultiByte(UINT,DWORD,LPCWSTR,int,char*,int,const char*,BOOL*);
extern int MultiByteToWideChar(UINT,DWORD,const char*,int,LPWSTR,int);
extern HANDLE CreateFileW(LPCWSTR,DWORD,DWORD,void*,DWORD,DWORD,HANDLE);
extern DWORD GetFileSize(HANDLE,DWORD*);
extern BOOL ReadFile(HANDLE,void*,DWORD,DWORD*,void*);
extern BOOL WriteFile(HANDLE,const void*,DWORD,DWORD*,void*);
extern BOOL FlushFileBuffers(HANDLE);
extern BOOL DeleteFileW(LPCWSTR);
extern BOOL MoveFileExW(LPCWSTR,LPCWSTR,DWORD);
extern HANDLE CreateToolhelp32Snapshot(DWORD,DWORD);
extern BOOL Process32FirstW(HANDLE,PROCESSENTRY32W*);
extern BOOL Process32NextW(HANDLE,PROCESSENTRY32W*);
extern unsigned short RegisterClassW(const WNDCLASSW*);
extern HWND CreateWindowExW(DWORD,LPCWSTR,LPCWSTR,DWORD,int,int,int,int,HWND,HMENU,HINSTANCE,void*);
extern LRESULT DefWindowProcW(HWND,UINT,WPARAM,LPARAM);
extern BOOL ShowWindow(HWND,int);
extern BOOL UpdateWindow(HWND);
extern int GetMessageW(MSG*,HWND,UINT,UINT);
extern BOOL TranslateMessage(const MSG*);
extern LRESULT DispatchMessageW(const MSG*);
extern void PostQuitMessage(int);
extern BOOL DestroyWindow(HWND);
extern BOOL GetClientRect(HWND,RECT*);
extern BOOL MoveWindow(HWND,int,int,int,int,BOOL);
extern LRESULT SendMessageW(HWND,UINT,WPARAM,LPARAM);
extern BOOL SetWindowTextW(HWND,LPCWSTR);
extern int GetWindowTextW(HWND,LPWSTR,int);
extern int GetWindowTextLengthW(HWND);
extern BOOL EnableWindow(HWND,BOOL);
extern HCURSOR LoadCursorW(HINSTANCE,LPCWSTR);
extern int MessageBoxW(HWND,LPCWSTR,LPCWSTR,UINT);
extern int FillRect(HDC,const RECT*,HBRUSH);
extern int DrawTextW(HDC,LPCWSTR,int,RECT*,UINT);
extern UINT_PTR SetTimer(HWND,UINT_PTR,UINT,void*);
extern BOOL KillTimer(HWND,UINT_PTR);
extern HGDIOBJ GetStockObject(int);
extern HFONT CreateFontW(int,int,int,int,int,DWORD,DWORD,DWORD,DWORD,DWORD,DWORD,DWORD,DWORD,LPCWSTR);
extern HBRUSH CreateSolidBrush(DWORD);
extern BOOL DeleteObject(HGDIOBJ);
extern HGDIOBJ SelectObject(HDC,HGDIOBJ);
extern DWORD SetTextColor(HDC,DWORD);
extern DWORD SetBkColor(HDC,DWORD);
extern int SetBkMode(HDC,int);
extern BOOL GetOpenFileNameW(OPENFILENAMEW*);
extern BOOL GetSaveFileNameW(OPENFILENAMEW*);

#define NULL ((void*)0)
#define TRUE 1
#define FALSE 0
#define INVALID_HANDLE ((HANDLE)(INT_PTR)-1)
#define RGB_(r,g,b) ((DWORD)(r)|((DWORD)(g)<<8)|((DWORD)(b)<<16))
#define WS_OVERLAPPEDWINDOW 0x00CF0000U
#define WS_CHILD 0x40000000U
#define WS_VISIBLE 0x10000000U
#define WS_TABSTOP 0x00010000U
#define WS_VSCROLL 0x00200000U
#define WS_HSCROLL 0x00100000U
#define BS_OWNERDRAW 0x0000000BU
#define ES_MULTILINE 0x0004U
#define ES_AUTOVSCROLL 0x0040U
#define ES_AUTOHSCROLL 0x0080U
#define ES_READONLY 0x0800U
#define ES_WANTRETURN 0x1000U
#define WM_DESTROY 0x0002U
#define WM_SIZE 0x0005U
#define WM_CLOSE 0x0010U
#define WM_GETMINMAXINFO 0x0024U
#define WM_SETFONT 0x0030U
#define WM_DRAWITEM 0x002BU
#define WM_COMMAND 0x0111U
#define WM_TIMER 0x0113U
#define WM_INSTALL_EVENT 0x8002U
#define WM_PROBE_EVENT 0x8003U
#define WM_VERSION_EVENT 0x8004U
#define WM_LOCAL_EVENT 0x8005U
#define WM_CTLCOLOREDIT 0x0133U
#define WM_CTLCOLORSTATIC 0x0138U
#define WM_COPY 0x0301U
#define EN_CHANGE 0x0300U
#define EM_SETSEL 0x00B1U
#define EM_GETSEL 0x00B0U
#define EM_GETLINECOUNT 0x00BAU
#define EM_GETFIRSTVISIBLELINE 0x00CEU
#define EM_SETLIMITTEXT 0x00C5U
#define EM_SCROLLCARET 0x00B7U
#define ODS_SELECTED 0x0001U
#define ODS_DISABLED 0x0004U
#define DT_CENTER 0x00000001U
#define DT_VCENTER 0x00000004U
#define DT_SINGLELINE 0x00000020U
#define SW_SHOW 5
#define CP_UTF8 65001U
#define MB_ERR_INVALID_CHARS 8U
#define GENERIC_READ 0x80000000U
#define GENERIC_WRITE 0x40000000U
#define FILE_SHARE_READ 1U
#define OPEN_EXISTING 3U
#define CREATE_NEW 1U
#define FILE_ATTRIBUTE_NORMAL 0x80U
#define MOVEFILE_REPLACE_EXISTING 1U
#define MOVEFILE_WRITE_THROUGH 8U
#define TH32CS_SNAPPROCESS 2U
#define OFN_OVERWRITEPROMPT 2U
#define OFN_HIDEREADONLY 4U
#define OFN_NOCHANGEDIR 8U
#define OFN_PATHMUSTEXIST 0x800U
#define OFN_FILEMUSTEXIST 0x1000U
#define MAX_SCRIPT_BYTES (2U*1024U*1024U)
#define MAX_SCRIPT_CHARS 524288
#define PATH_CAP 1024
#define IDC_EDITOR 101
#define IDC_OPEN 102
#define IDC_SAVE 103
#define IDC_NEW 104
#define IDC_COPY 105
#define IDC_CLEAR 106
#define IDC_CLIENTS 107
#define IDC_CONNECT 108
#define IDC_EXECUTE 109
#define IDC_INSTALL 110
#define IDC_PROBE 111
#define IDC_PREPARE_CLIENT 112
#define IDC_LAUNCH_CLIENT 113
#define IDC_CHECK_LOCAL 114
#define IDC_RUN_LOCAL 115

extern __attribute__((visibility("hidden"))) DWORD installer_worker(void *target);
extern __attribute__((visibility("hidden"))) DWORD probe_worker(void *target);
extern __attribute__((visibility("hidden"))) DWORD version_worker_prepare(void *target);
extern __attribute__((visibility("hidden"))) DWORD version_worker_launch(void *target);
extern __attribute__((visibility("hidden"))) int localrun_start(HWND owner,HWND editor,int check);
typedef struct { DWORD truncated; WCHAR text[6001]; } LOCAL_RESULT;

void *memset(void *p,int c,UINT_PTR n) { unsigned char *d=(unsigned char*)p; while(n--) *d++=(unsigned char)c; return p; }
void *memcpy(void *p,const void *q,UINT_PTR n) { unsigned char *d=(unsigned char*)p; const unsigned char *s=(const unsigned char*)q; while(n--) *d++=*s++; return p; }
static HINSTANCE module;
static HWND editor,gutter,output,statusText,sidebar,titleLabel,explorerLabel,scriptLabel,tabLabel,outputLabel,disabledLabel;
static HWND bopen,bsave,bnew,bcopy,bclear,bclients,bconnect,bexecute,binstall,bprobe,bprepare,blaunch,bcheck,brun;
static HFONT uiFont,headingFont,codeFont;
static HBRUSH bgBrush,sideBrush,editorBrush,barBrush,buttonBrush,hotBrush;
static WCHAR currentPath[PATH_CAP];
static int dirty, ignoreChange, editorHeight, versionBusy, localBusy, localCheck, probeConnection;
static int lastFirst=-1,lastCount=-1,lastVisible=-1;
static int maxint(int a,int b){return a>b?a:b;}
static void *alloc(UINT_PTR n){return HeapAlloc(GetProcessHeap(),8,n);}
static void release(void *p){if(p) HeapFree(GetProcessHeap(),0,p);}
static unsigned int wcopy(WCHAR *out,const WCHAR *in,unsigned int cap){unsigned int i=0; if(!cap)return 0; while(in[i] && i+1<cap){out[i]=in[i];++i;} out[i]=0;return i;}
static unsigned int wappend(WCHAR *out,unsigned int pos,unsigned int cap,LPCWSTR in){unsigned int i=0;while(in[i]&&pos+1<cap)out[pos++]=in[i++];out[pos]=0;return pos;}
static unsigned int append_num(WCHAR *s,unsigned int pos,unsigned int cap,unsigned int v){WCHAR tmp[16];unsigned int n=0;do{tmp[n++]=(WCHAR)('0'+v%10);v/=10;}while(v&&n<16);while(n&&pos+1<cap)s[pos++]=tmp[--n];s[pos]=0;return pos;}
static unsigned int lower_ascii(unsigned int c){return c>='A'&&c<='Z'?c+32:c;}
static int eq_ascii(LPCWSTR a,LPCWSTR b){while(*a&&*b){if(lower_ascii(*a)!=lower_ascii(*b))return 0;++a;++b;}return *a==*b;}
static void set_status(LPCWSTR t){SetWindowTextW(statusText,t);}
static void log_line(LPCWSTR text){
    WCHAR buf[8192];int len=GetWindowTextW(output,buf,8192);unsigned int p=(unsigned int)(len<0?0:len);
    if(p>7000){buf[0]=0;p=0;}p=wappend(buf,p,8192,text);p=wappend(buf,p,8192,L"\r\n");
    SetWindowTextW(output,buf);SendMessageW(output,EM_SETSEL,p,p);SendMessageW(output,EM_SCROLLCARET,0,0);
}
static HWND control(HWND parent,LPCWSTR cls,LPCWSTR text,DWORD style,int id){
    HWND h=CreateWindowExW(0,cls,text,WS_CHILD|WS_VISIBLE|style,0,0,1,1,parent,(HMENU)(UINT_PTR)id,module,NULL);
    if(h) SendMessageW(h,WM_SETFONT,(WPARAM)(uiFont?uiFont:GetStockObject(17)),TRUE);
    return h;
}
static void layout(HWND h){
    RECT r;int w,ht,x,space,edtop,edbottom,logtop;
    if(!editor||!GetClientRect(h,&r))return;
    w=r.right;ht=r.bottom;x=194;space=maxint(220,w-x-18);edtop=133;edbottom=maxint(edtop+80,ht-160);logtop=edbottom+12;
    MoveWindow(sidebar,0,0,180,ht,TRUE);
    MoveWindow(titleLabel,16,12,162,29,TRUE);MoveWindow(explorerLabel,16,66,160,26,TRUE);
    MoveWindow(scriptLabel,16,104,160,27,TRUE);MoveWindow(disabledLabel,16,140,162,75,TRUE);
    MoveWindow(binstall,16,230,148,32,TRUE);
    MoveWindow(bprobe,16,270,148,32,TRUE);
    MoveWindow(bprepare,16,310,148,32,TRUE);MoveWindow(blaunch,16,350,148,32,TRUE);
    MoveWindow(bcheck,16,390,148,32,TRUE);MoveWindow(brun,16,430,148,32,TRUE);
    MoveWindow(tabLabel,x,16,space,27,TRUE);
    MoveWindow(bnew,x,55,57,29,TRUE);MoveWindow(bopen,x+60,55,66,29,TRUE);MoveWindow(bsave,x+129,55,67,29,TRUE);
    MoveWindow(bcopy,x+199,55,73,29,TRUE);MoveWindow(bclear,x+275,55,75,29,TRUE);MoveWindow(bclients,x+353,55,76,29,TRUE);
    MoveWindow(bconnect,maxint(x+432,w-203),55,88,29,TRUE);MoveWindow(bexecute,maxint(x+522,w-110),55,92,29,TRUE);
    MoveWindow(gutter,x,edtop,48,edbottom-edtop,TRUE);MoveWindow(editor,x+48,edtop,space-48,edbottom-edtop,TRUE);editorHeight=edbottom-edtop;
    MoveWindow(outputLabel,x,logtop,space,20,TRUE);MoveWindow(output,x,logtop+20,space,maxint(35,ht-logtop-53),TRUE);
    MoveWindow(statusText,12,maxint(0,ht-28),maxint(300,w-24),23,TRUE);
}
static void update_gutter(void){
    WCHAR buf[4096];unsigned int p=0,i;int first,count,visible;
    if(!editor||!gutter)return;
    first=(int)SendMessageW(editor,EM_GETFIRSTVISIBLELINE,0,0);count=(int)SendMessageW(editor,EM_GETLINECOUNT,0,0);visible=editorHeight/19+2;
    if(first==lastFirst&&count==lastCount&&visible==lastVisible)return;
    lastFirst=first;lastCount=count;lastVisible=visible;buf[0]=0;
    for(i=0;i<(unsigned int)visible&&i<100;i++){unsigned int line=(unsigned int)first+i+1;if(line>(unsigned int)count)break;p=append_num(buf,p,4096,line);p=wappend(buf,p,4096,L"\r\n");}
    SetWindowTextW(gutter,buf);
}
static int draw_button(const DRAWITEMSTRUCT *d){
    WCHAR name[80];DWORD color;HBRUSH brush;RECT r;HGDIOBJ old;
    if(!d || !d->hwndItem)return 0;
    r=d->rcItem;brush=(d->itemState&ODS_SELECTED)?hotBrush:buttonBrush;
    FillRect(d->hDC,&r,brush);SetBkMode(d->hDC,1);color=(d->itemState&ODS_DISABLED)?RGB_(93,93,98):RGB_(211,211,215);
    SetTextColor(d->hDC,color);old=SelectObject(d->hDC,uiFont?uiFont:GetStockObject(17));
    GetWindowTextW(d->hwndItem,name,80);DrawTextW(d->hDC,name,-1,&r,DT_CENTER|DT_VCENTER|DT_SINGLELINE);SelectObject(d->hDC,old);return 1;
}
static int make_dialog(HWND owner,WCHAR *path,int save){
    OPENFILENAMEW o;memset(&o,0,sizeof(o));o.lStructSize=sizeof(o);o.hwndOwner=owner;
    o.lpstrFilter=L"Scripts Luau (*.luau;*.lua)\0*.luau;*.lua\0Todos os arquivos (*.*)\0*.*\0\0";
    o.lpstrFile=path;o.nMaxFile=PATH_CAP;o.nFilterIndex=1;o.lpstrDefExt=L"luau";
    o.Flags=OFN_NOCHANGEDIR|OFN_PATHMUSTEXIST|OFN_HIDEREADONLY|(save?OFN_OVERWRITEPROMPT:OFN_FILEMUSTEXIST);
    return save?GetSaveFileNameW(&o):GetOpenFileNameW(&o);
}
static int read_source(LPCWSTR path){
    HANDLE f;DWORD len,got,total=0;char *bytes;WCHAR *wide;int nchars;unsigned int off=0,i;
    f=CreateFileW(path,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
    if(f==INVALID_HANDLE){log_line(L"Erro: nao foi possivel abrir o arquivo.");return 0;}
    len=GetFileSize(f,NULL);if(len==0xffffffffU||len>MAX_SCRIPT_BYTES){CloseHandle(f);log_line(L"Erro: arquivo inacessivel ou maior que 2 MiB.");return 0;}
    bytes=(char*)alloc((UINT_PTR)len+1);if(!bytes){CloseHandle(f);return 0;}
    while(total<len){got=0;if(!ReadFile(f,bytes+total,len-total,&got,NULL)||!got){release(bytes);CloseHandle(f);log_line(L"Erro ao ler o arquivo.");return 0;}total+=got;}
    CloseHandle(f);bytes[len]=0;if(len>=3&&(unsigned char)bytes[0]==0xef&&(unsigned char)bytes[1]==0xbb&&(unsigned char)bytes[2]==0xbf)off=3;
    nchars=len==off?0:MultiByteToWideChar(CP_UTF8,MB_ERR_INVALID_CHARS,bytes+off,(int)(len-off),NULL,0);
    if((len>off&&nchars<=0)||nchars>MAX_SCRIPT_CHARS){release(bytes);log_line(L"Erro: use arquivo UTF-8 dentro do limite.");return 0;}
    wide=(WCHAR*)alloc(((UINT_PTR)nchars+1)*sizeof(WCHAR));if(!wide){release(bytes);return 0;}
    if(nchars&&MultiByteToWideChar(CP_UTF8,MB_ERR_INVALID_CHARS,bytes+off,(int)(len-off),wide,nchars)!=nchars){release(bytes);release(wide);return 0;}
    for(i=0;i<(unsigned int)nchars;i++)if(!wide[i]){release(bytes);release(wide);log_line(L"Erro: arquivo contem caractere NUL.");return 0;}
    wide[nchars]=0;ignoreChange=1;SetWindowTextW(editor,wide);ignoreChange=0;dirty=0;lastCount=-1;
    wcopy(currentPath,path,PATH_CAP);SetWindowTextW(tabLabel,L"  SCRIPT ABERTO  |  UTF-8");set_status(L"Arquivo aberto. Mecanismo Roblox indisponivel.");
    log_line(L"Arquivo aberto no editor.");release(bytes);release(wide);return 1;
}
static int write_source(LPCWSTR path){
    int chars,bytes;WCHAR *wide;char *raw;HANDLE f=INVALID_HANDLE;DWORD wrote,total=0;WCHAR tmp[PATH_CAP+48];unsigned int p,attempt;
    chars=GetWindowTextLengthW(editor);if(chars<0||chars>MAX_SCRIPT_CHARS)return 0;
    wide=(WCHAR*)alloc(((UINT_PTR)chars+1)*sizeof(WCHAR));if(!wide)return 0;
    chars=GetWindowTextW(editor,wide,chars+1);bytes=chars?WideCharToMultiByte(CP_UTF8,0,wide,chars,NULL,0,NULL,NULL):0;
    if(chars&&bytes<=0){release(wide);return 0;}raw=(char*)alloc((UINT_PTR)bytes+1);if(!raw){release(wide);return 0;}
    if(bytes&&WideCharToMultiByte(CP_UTF8,0,wide,chars,raw,bytes,NULL,NULL)!=bytes){release(wide);release(raw);return 0;}
    for(attempt=0;attempt<32;attempt++){p=wcopy(tmp,path,PATH_CAP+48);p=wappend(tmp,p,PATH_CAP+48,L".axiom-tmp-");p=append_num(tmp,p,PATH_CAP+48,GetCurrentProcessId());p=wappend(tmp,p,PATH_CAP+48,L"-");append_num(tmp,p,PATH_CAP+48,attempt);
      f=CreateFileW(tmp,GENERIC_WRITE,0,NULL,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,NULL);if(f!=INVALID_HANDLE)break;}
    if(f==INVALID_HANDLE){release(wide);release(raw);log_line(L"Erro: nao foi possivel criar arquivo temporario.");return 0;}
    while(total<(DWORD)bytes){wrote=0;if(!WriteFile(f,raw+total,(DWORD)bytes-total,&wrote,NULL)||!wrote){CloseHandle(f);DeleteFileW(tmp);release(wide);release(raw);log_line(L"Erro ao gravar; arquivo original preservado.");return 0;}total+=wrote;}
    if(!FlushFileBuffers(f)){CloseHandle(f);DeleteFileW(tmp);release(wide);release(raw);log_line(L"Erro ao finalizar gravacao.");return 0;}
    CloseHandle(f);release(wide);release(raw);
    if(!MoveFileExW(tmp,path,MOVEFILE_REPLACE_EXISTING|MOVEFILE_WRITE_THROUGH)){DeleteFileW(tmp);log_line(L"Erro ao substituir o arquivo; original preservado.");return 0;}
    dirty=0;log_line(L"Arquivo salvo em UTF-8.");set_status(L"Arquivo salvo. Mecanismo Roblox indisponivel.");return 1;
}
static int save_current(HWND h){WCHAR path[PATH_CAP];if(currentPath[0])return write_source(currentPath);path[0]=0;if(!make_dialog(h,path,1))return 0;if(!write_source(path))return 0;wcopy(currentPath,path,PATH_CAP);return 1;}
static int can_discard(HWND h){int r;if(!dirty)return 1;r=MessageBoxW(h,L"Salvar as alteracoes antes de continuar?",L"Axiom - arquivo alterado",3U|0x20U);if(r==2)return 0;if(r==6)return save_current(h);return r==7;}
static void open_file(HWND h){WCHAR path[PATH_CAP];if(!can_discard(h))return;path[0]=0;if(make_dialog(h,path,0))read_source(path);}
static void new_file(HWND h){if(!can_discard(h))return;ignoreChange=1;SetWindowTextW(editor,L"");ignoreChange=0;currentPath[0]=0;dirty=0;lastCount=-1;SetWindowTextW(tabLabel,L"  NOVO SCRIPT  |  UTF-8");set_status(L"Novo script. Mecanismo Roblox indisponivel.");}
static void scan_clients(void){
    HANDLE snap;PROCESSENTRY32W p;unsigned int count=0,first=0,n;WCHAR line[160];
    snap=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);if(snap==INVALID_HANDLE){log_line(L"Falha ao listar processos do Windows.");return;}
    memset(&p,0,sizeof(p));p.dwSize=sizeof(p);
    if(Process32FirstW(snap,&p))do{if(eq_ascii(p.szExeFile,L"RobloxPlayerBeta.exe")){if(!count)first=p.th32ProcessID;++count;}}while(Process32NextW(snap,&p));
    CloseHandle(snap);n=wcopy(line,L"Clientes Roblox detectados: ",160);n=append_num(line,n,160,count);
    if(count){n=wappend(line,n,160,L" | primeiro PID: ");n=append_num(line,n,160,first);}log_line(line);
    set_status(count?L"Roblox detectado. Mecanismo de execucao indisponivel.":L"Nenhum cliente Roblox detectado.");
}
static void install_roblox(HWND h){
    HANDLE thread;
    EnableWindow(binstall,FALSE);set_status(L"Baixando instalador oficial do Roblox...");
    log_line(L"Baixando instalador oficial. Versao e destino sao definidos pelo Roblox.");
    thread=CreateThread(NULL,0,installer_worker,h,0,NULL);
    if(!thread){EnableWindow(binstall,TRUE);set_status(L"Nao foi possivel iniciar o download.");log_line(L"Falha ao iniciar o download.");return;}
    CloseHandle(thread);
}
static void install_event(DWORD result,DWORD details){
    WCHAR text[128];unsigned int n;
    if(result==1){set_status(L"Instalador oficial aberto. Aguardando conclusao...");log_line(L"Instalador verificado e iniciado.");return;}
    EnableWindow(binstall,TRUE);
    if(result==2){set_status(L"Instalador finalizado. Verifique o Roblox no Windows.");log_line(L"Instalador retornou codigo zero; versao nao verificada.");}
    else if(result==3){set_status(L"Falha ao baixar o instalador oficial.");log_line(L"Falha no download do instalador oficial.");}
    else if(result==4){set_status(L"Assinatura do instalador nao validada.");log_line(L"Instalador descartado: assinatura nao validada pelo Windows.");}
    else if(result==5){set_status(L"Nao foi possivel abrir o instalador.");log_line(L"Falha ao iniciar o instalador oficial.");}
    else if(result==6){set_status(L"Instalador iniciado; conclusao nao confirmada.");log_line(L"Aguardou-se o instalador, mas a conclusao nao foi confirmada.");}
    else {n=wcopy(text,L"Instalador retornou erro: ",128);append_num(text,n,128,details);set_status(L"Instalador nao concluiu com sucesso.");log_line(text);}
}
static void start_probe(HWND h){
    HANDLE thread;
    probeConnection=0;
    EnableWindow(bprobe,FALSE);set_status(L"Verificando cliente Roblox (somente leitura)...");
    log_line(L"Verificando arquivo e memoria do cliente, sem alterar o processo.");
    thread=CreateThread(NULL,0,probe_worker,h,0,NULL);
    if(!thread){EnableWindow(bprobe,TRUE);set_status(L"Nao foi possivel iniciar a verificacao.");log_line(L"Falha ao iniciar verificacao do cliente.");return;}
    CloseHandle(thread);
}
static void start_connect(HWND h){
    HANDLE thread;
    if(probeConnection)return;
    probeConnection=1;EnableWindow(bconnect,FALSE);
    set_status(L"Conectando em modo de leitura...");
    log_line(L"Conexao solicitada: somente leitura; nenhum codigo sera injetado no cliente.");
    thread=CreateThread(NULL,0,probe_worker,h,0,NULL);
    if(!thread){probeConnection=0;EnableWindow(bconnect,TRUE);set_status(L"Nao foi possivel iniciar a conexao.");log_line(L"Falha ao iniciar a verificacao do cliente.");return;}
    CloseHandle(thread);
}
static void probe_event(DWORD result,DWORD details){
    int connected=probeConnection;
    EnableWindow(bprobe,TRUE);
    EnableWindow(bconnect,TRUE);probeConnection=0;
    if(result==1){
        set_status(connected?L"Cliente conectado em modo de leitura.":L"Cliente analisado. Mecanismo de execucao ainda indisponivel.");
        log_line(L"SHA-256 do cliente e da tabela conferidos; 16 bytes de quatro trechos conferidos.");
        if(details&4U)log_line(L"Possivel contexto legivel; tipo e funcao ainda nao verificados.");
        else log_line(L"Possivel contexto nao localizado; enderecos ainda nao confirmados.");
        log_line(L"Verificacao de leitura nao confirma execucao dentro do Roblox.");
    } else if(result==2){set_status(L"Nenhum cliente Roblox detectado.");log_line(L"Abra o Roblox dentro de um jogo e tente novamente.");}
    else if(result==3){set_status(L"Mais de um cliente encontrado.");log_line(L"Deixe apenas um cliente Roblox aberto para verificar.");}
    else if(result==4){set_status(L"Acesso de leitura ao cliente negado.");log_line(L"Nao foi possivel abrir o processo para leitura.");}
    else if(result==5){set_status(L"Caminho do cliente indisponivel.");log_line(L"Nao foi possivel consultar o caminho do processo.");}
    else if(result==6){set_status(L"Arquivo do cliente inacessivel.");log_line(L"Nao foi possivel ler o executavel para verificar SHA-256.");}
    else if(result==7){set_status(L"Versao diferente da analisada.");log_line(L"Arquivo diferente do cliente desktop analisado; offsets nao consultados.");}
    else if(result==8){set_status(L"Modulo do cliente nao localizado.");log_line(L"Falha ao identificar o modulo principal do processo.");}
    else if(result==9){set_status(L"Falha de leitura da memoria.");log_line(L"Nao foi possivel ler todos os dados esperados do cliente.");}
    else if(result==10){set_status(L"Tabela de opcodes diferente.");log_line(L"A tabela completa na memoria difere da versao analisada.");}
    else if(result==11){set_status(L"Trecho de codigo diferente.");log_line(L"Um dos quatro trechos na memoria difere da amostra analisada.");}
    else if(result==12){set_status(L"Erro na verificacao criptografica.");log_line(L"O Windows nao conseguiu calcular SHA-256.");}
    else {set_status(L"Falha ao procurar clientes.");log_line(L"Nao foi possivel listar os processos do Windows.");}
}
static void start_version_worker(HWND h,int launch){
    HANDLE thread;if(versionBusy)return;versionBusy=1;EnableWindow(bprepare,FALSE);EnableWindow(blaunch,FALSE);
    if(launch){set_status(L"Verificando a copia do cliente...");log_line(L"Verificando a copia antes de abri-la.");}
    else{set_status(L"Preparando copia do cliente Roblox...");log_line(L"Copiando o cliente desktop aberto para a pasta do Axiom.");}
    thread=CreateThread(NULL,0,launch?version_worker_launch:version_worker_prepare,h,0,NULL);
    if(!thread){versionBusy=0;EnableWindow(bprepare,TRUE);EnableWindow(blaunch,TRUE);set_status(L"Nao foi possivel iniciar a operacao.");log_line(L"Falha ao iniciar o gerenciador do cliente.");return;}
    CloseHandle(thread);
}
static void version_event(DWORD result){
    versionBusy=0;EnableWindow(bprepare,TRUE);EnableWindow(blaunch,TRUE);
    if(result==1){set_status(L"Copia do cliente preparada.");log_line(L"Copia criada em LocalAppData\\Axiom\\Versions. Use Abrir copia.");}
    else if(result==2){set_status(L"Copia do cliente ja esta preparada.");log_line(L"A copia existente foi conferida. Use Abrir copia.");}
    else if(result==3){set_status(L"Abertura da copia solicitada.");log_line(L"Solicitacao de abertura enviada ao Windows; carregamento nao confirmado.");}
    else if(result==4){set_status(L"Nenhum cliente Roblox aberto.");log_line(L"Abra o Roblox desktop analisado antes de preparar a copia.");}
    else if(result==5){set_status(L"Mais de um cliente aberto.");log_line(L"Deixe apenas um cliente Roblox aberto durante a copia.");}
    else if(result==6){set_status(L"Cliente inacessivel.");log_line(L"Nao foi possivel consultar o processo Roblox.");}
    else if(result==7){set_status(L"Versao diferente da analisada.");log_line(L"O executavel aberto nao corresponde ao cliente verificado.");}
    else if(result==8){set_status(L"Instalacao de origem incompleta.");log_line(L"O diretorio de origem nao contem os arquivos esperados.");}
    else if(result==9){set_status(L"Caminho invalido ou longo demais.");log_line(L"Nao foi possivel usar o caminho da instalacao.");}
    else if(result==10){set_status(L"Falha ao copiar o cliente.");log_line(L"Copia cancelada; a instalacao de origem nao foi alterada.");}
    else if(result==11){set_status(L"A copia contem um link nao suportado.");log_line(L"Copia cancelada por encontrar um link ou ponto de redirecionamento.");}
    else if(result==12){set_status(L"Limite de tamanho ou profundidade atingido.");log_line(L"Copia cancelada por exceder os limites do gerenciador.");}
    else if(result==13){set_status(L"Ja existe uma pasta de destino diferente.");log_line(L"A pasta existente nao foi substituida nem alterada.");}
    else if(result==14){set_status(L"Copia nao encontrada ou nao validada.");log_line(L"Prepare a copia do cliente antes de abri-la.");}
    else if(result==15){set_status(L"Nao foi possivel abrir a copia.");log_line(L"O Windows recusou a abertura do cliente copiado.");}
    else {set_status(L"Falha na verificacao SHA-256.");log_line(L"Nao foi possivel verificar a integridade do executavel.");}
}
static void start_local(HWND h,int check){
    if(localBusy)return;
    localBusy=1;localCheck=check;EnableWindow(bcheck,FALSE);EnableWindow(brun,FALSE);
    set_status(check?L"Verificando sintaxe localmente...":L"Executando na VM Luau local...");
    log_line(check?L"Verificacao local iniciada.":L"Execucao local iniciada (fora do Roblox).");
    if(!localrun_start(h,editor,check)){
        localBusy=0;EnableWindow(bcheck,TRUE);EnableWindow(brun,TRUE);
        set_status(L"Nao foi possivel iniciar a operacao local.");log_line(L"Falha ao preparar o texto para o Luau local.");
    }
}
static void local_event(DWORD status,LOCAL_RESULT *result){
    localBusy=0;EnableWindow(bcheck,TRUE);EnableWindow(brun,TRUE);
    if(result&&result->text[0])log_line(result->text);
    if(result&&result->truncated)log_line(L"Saida limitada aos primeiros 6000 bytes.");
    if(status==1){set_status(localCheck?L"Verificacao local concluida.":L"Execucao local concluida.");log_line(localCheck?L"Sintaxe local verificada.":L"Execucao local finalizada.");}
    else if(status==2){set_status(L"O Luau local retornou um erro.");log_line(L"A operacao local terminou com erro; consulte a saida acima.");}
    else if(status==3){set_status(L"Compilador local nao encontrado.");log_line(L"Extraia o ZIP completo e mantenha axiom-luau.exe ao lado do editor.");}
    else if(status==4){set_status(L"Nao foi possivel iniciar o Luau local.");log_line(L"O Windows nao iniciou axiom-luau.exe.");}
    else if(status==5){set_status(L"Tempo limite da operacao local excedido.");log_line(L"O processo Luau local foi encerrado apos 15 segundos.");}
    else {set_status(L"Falha na operacao local.");log_line(L"Nao foi possivel concluir a comunicacao com o Luau local.");}
    release(result);
}
static LRESULT window_proc(HWND h,UINT m,WPARAM w,LPARAM l){
    DWORD id=(DWORD)w&0xffffU,code=((DWORD)w>>16)&0xffffU;
    switch(m){
    case WM_GETMINMAXINFO:if(l){MINMAXINFO *i=(MINMAXINFO*)l;i->minTrackSize.x=850;i->minTrackSize.y=550;}return 0;
    case WM_SIZE:layout(h);return 0;
    case WM_TIMER:update_gutter();return 0;
    case WM_INSTALL_EVENT:install_event((DWORD)w,(DWORD)l);return 0;
    case WM_PROBE_EVENT:probe_event((DWORD)w,(DWORD)l);return 0;
    case WM_VERSION_EVENT:version_event((DWORD)w);return 0;
    case WM_LOCAL_EVENT:local_event((DWORD)w,(LOCAL_RESULT*)l);return 0;
    case WM_DRAWITEM:return draw_button((const DRAWITEMSTRUCT*)l);
    case WM_CTLCOLOREDIT:SetTextColor((HDC)w,RGB_(211,211,216));SetBkColor((HDC)w,RGB_(15,15,17));return (LRESULT)editorBrush;
    case WM_CTLCOLORSTATIC:
      if((HWND)l==gutter||(HWND)l==output){SetTextColor((HDC)w,RGB_(131,131,139));SetBkColor((HDC)w,RGB_(15,15,17));return (LRESULT)editorBrush;}
      SetTextColor((HDC)w,(HWND)l==disabledLabel?RGB_(112,112,120):RGB_(220,220,224));SetBkColor((HDC)w,RGB_(19,19,21));return (LRESULT)sideBrush;
    case WM_COMMAND:
      if(id==IDC_EDITOR&&code==EN_CHANGE){if(!ignoreChange)dirty=1;lastCount=-1;return 0;}
      switch(id){
      case IDC_NEW:new_file(h);return 0;case IDC_OPEN:open_file(h);return 0;case IDC_SAVE:save_current(h);return 0;
      case IDC_COPY:{DWORD a=0,b=0;SendMessageW(editor,EM_GETSEL,(WPARAM)&a,(LPARAM)&b);if(a==b)SendMessageW(editor,EM_SETSEL,0,(LPARAM)-1);SendMessageW(editor,WM_COPY,0,0);if(a==b)SendMessageW(editor,EM_SETSEL,a,b);log_line(L"Texto copiado.");return 0;}
      case IDC_CLEAR:if(MessageBoxW(h,L"Limpar o texto do editor?",L"Axiom",4U|0x20U)==6)SetWindowTextW(editor,L"");return 0;
      case IDC_CLIENTS:scan_clients();return 0;
      case IDC_INSTALL:install_roblox(h);return 0;
      case IDC_PROBE:start_probe(h);return 0;
      case IDC_CONNECT:start_connect(h);return 0;
      case IDC_EXECUTE:start_local(h,0);return 0;
      case IDC_PREPARE_CLIENT:start_version_worker(h,0);return 0;
      case IDC_LAUNCH_CLIENT:start_version_worker(h,1);return 0;
      case IDC_CHECK_LOCAL:start_local(h,1);return 0;
      case IDC_RUN_LOCAL:start_local(h,0);return 0;
      }break;
    case WM_CLOSE:if(can_discard(h))DestroyWindow(h);return 0;
    case WM_DESTROY:KillTimer(h,1);if(uiFont)DeleteObject(uiFont);if(headingFont)DeleteObject(headingFont);if(codeFont)DeleteObject(codeFont);
      if(bgBrush)DeleteObject(bgBrush);
      if(sideBrush)DeleteObject(sideBrush);
      if(editorBrush)DeleteObject(editorBrush);
      if(barBrush)DeleteObject(barBrush);
      if(buttonBrush)DeleteObject(buttonBrush);
      if(hotBrush)DeleteObject(hotBrush);
      PostQuitMessage(0);return 0;
    }
    return DefWindowProcW(h,m,w,l);
}
void start(void){
    WNDCLASSW wc;MSG msg;HWND h;HINSTANCE dwm;void *proc;int dark=1;
    typedef int (*DwmAttribute)(HWND,DWORD,const void*,DWORD);
    memset(&wc,0,sizeof(wc));module=GetModuleHandleW(NULL);
    bgBrush=CreateSolidBrush(RGB_(12,12,14));sideBrush=CreateSolidBrush(RGB_(19,19,21));editorBrush=CreateSolidBrush(RGB_(15,15,17));
    barBrush=CreateSolidBrush(RGB_(19,19,21));buttonBrush=CreateSolidBrush(RGB_(29,29,32));hotBrush=CreateSolidBrush(RGB_(46,46,50));
    uiFont=CreateFontW(-14,0,0,0,400,0,0,0,1,0,0,0,0,L"Segoe UI");headingFont=CreateFontW(-19,0,0,0,600,0,0,0,1,0,0,0,0,L"Segoe UI");
    codeFont=CreateFontW(-16,0,0,0,400,0,0,0,1,0,0,0,49,L"Consolas");
    wc.lpfnWndProc=window_proc;wc.hInstance=module;wc.hCursor=LoadCursorW(NULL,(LPCWSTR)(UINT_PTR)32512);wc.hbrBackground=bgBrush;wc.lpszClassName=L"AxiomNativeEditor";
    if(!RegisterClassW(&wc))ExitProcess(1);
    h=CreateWindowExW(0,wc.lpszClassName,L"Axiom - Editor Luau",WS_OVERLAPPEDWINDOW,100,100,1120,720,NULL,NULL,module,NULL);if(!h)ExitProcess(1);
    dwm=LoadLibraryW(L"dwmapi.dll");if(dwm){proc=GetProcAddress(dwm,"DwmSetWindowAttribute");if(proc)((DwmAttribute)proc)(h,20,&dark,sizeof(dark));}
    sidebar=control(h,L"STATIC",L"",0,0);
    titleLabel=control(h,L"STATIC",L"AXIOM",0,0);explorerLabel=control(h,L"STATIC",L"EXPLORER",0,0);
    scriptLabel=control(h,L"STATIC",L"  >  Script local",0,0);disabledLabel=control(h,L"STATIC",L"O mecanismo Roblox ainda nao esta disponivel.",0,0);
    binstall=control(h,L"BUTTON",L"Instalar Roblox",WS_TABSTOP|BS_OWNERDRAW,IDC_INSTALL);
    bprobe=control(h,L"BUTTON",L"Verificar cliente",WS_TABSTOP|BS_OWNERDRAW,IDC_PROBE);
    bprepare=control(h,L"BUTTON",L"Preparar cliente",WS_TABSTOP|BS_OWNERDRAW,IDC_PREPARE_CLIENT);
    blaunch=control(h,L"BUTTON",L"Abrir copia",WS_TABSTOP|BS_OWNERDRAW,IDC_LAUNCH_CLIENT);
    bcheck=control(h,L"BUTTON",L"Verificar sintaxe",WS_TABSTOP|BS_OWNERDRAW,IDC_CHECK_LOCAL);
    brun=control(h,L"BUTTON",L"Executar local",WS_TABSTOP|BS_OWNERDRAW,IDC_RUN_LOCAL);
    tabLabel=control(h,L"STATIC",L"  NOVO SCRIPT  |  UTF-8",0,0);outputLabel=control(h,L"STATIC",L"  SAIDA DO AXIOM",0,0);
    bnew=control(h,L"BUTTON",L"Novo",WS_TABSTOP|BS_OWNERDRAW,IDC_NEW);bopen=control(h,L"BUTTON",L"Abrir",WS_TABSTOP|BS_OWNERDRAW,IDC_OPEN);
    bsave=control(h,L"BUTTON",L"Salvar",WS_TABSTOP|BS_OWNERDRAW,IDC_SAVE);bcopy=control(h,L"BUTTON",L"Copiar",WS_TABSTOP|BS_OWNERDRAW,IDC_COPY);
    bclear=control(h,L"BUTTON",L"Limpar",WS_TABSTOP|BS_OWNERDRAW,IDC_CLEAR);bclients=control(h,L"BUTTON",L"Clientes",WS_TABSTOP|BS_OWNERDRAW,IDC_CLIENTS);
    bconnect=control(h,L"BUTTON",L"Conectar",BS_OWNERDRAW,IDC_CONNECT);bexecute=control(h,L"BUTTON",L"Executar local",BS_OWNERDRAW,IDC_EXECUTE);
    gutter=control(h,L"STATIC",L"1",0,0);
    editor=control(h,L"EDIT",L"print(\"Axiom\")",WS_TABSTOP|WS_VSCROLL|WS_HSCROLL|ES_MULTILINE|ES_AUTOVSCROLL|ES_AUTOHSCROLL|ES_WANTRETURN,IDC_EDITOR);
    output=control(h,L"EDIT",L"Editor pronto. Execucao dentro do Roblox ainda nao implementada.\r\n",WS_VSCROLL|ES_MULTILINE|ES_AUTOVSCROLL|ES_READONLY,0);
    statusText=control(h,L"STATIC",L"Desconectado  |  mecanismo Roblox indisponivel",0,0);
    if(!sidebar||!titleLabel||!explorerLabel||!scriptLabel||!disabledLabel||!binstall||!bprobe||!bprepare||!blaunch||!bcheck||!brun||!tabLabel||!outputLabel||!bnew||!bopen||!bsave||!bcopy||!bclear||!bclients||!bconnect||!bexecute||!gutter||!editor||!output||!statusText)ExitProcess(1);
    SendMessageW(titleLabel,WM_SETFONT,(WPARAM)(headingFont?headingFont:GetStockObject(17)),TRUE);
    SendMessageW(editor,WM_SETFONT,(WPARAM)(codeFont?codeFont:GetStockObject(17)),TRUE);SendMessageW(gutter,WM_SETFONT,(WPARAM)(codeFont?codeFont:GetStockObject(17)),TRUE);
    SendMessageW(editor,EM_SETLIMITTEXT,MAX_SCRIPT_CHARS,0);SendMessageW(output,EM_SETLIMITTEXT,8191,0);
    EnableWindow(bconnect,TRUE);EnableWindow(bexecute,TRUE);dirty=0;layout(h);SetTimer(h,1,250,NULL);ShowWindow(h,SW_SHOW);UpdateWindow(h);
    while(GetMessageW(&msg,NULL,0,0)>0){TranslateMessage(&msg);DispatchMessageW(&msg);}ExitProcess(0);
}
