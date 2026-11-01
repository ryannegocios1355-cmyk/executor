.globl probe_table_sha
.globl probe_hash_file
.globl axiom_hash_known_client
.globl probe_equal
.globl probe_hash_start
.globl axiom_hash_known_library
.globl probe_pointer
.globl probe_exe_sha
.globl probe_name
.globl probe_dll_sha
.globl probe_code
.globl probe_worker
.globl probe_hash_finish
.globl probe_rvas
.globl probe_read
.globl __const_probe_LC0
	.file	"probe.c"
	.text
	.type	probe_equal, @function
probe_equal:
	testl	%r8d, %r8d
	je	.L4
	movl	%r8d, %r8d
	movl	$0, %eax
.L3:
	movzbl	(%rdx,%rax), %r9d
	cmpb	%r9b, (%rcx,%rax)
	jne	.L5
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L3
	movl	$1, %eax
	ret
.L4:
	movl	$1, %eax
	ret
.L5:
	movl	$0, %eax
	ret
	.size	probe_equal, .-probe_equal
	.type	probe_name, @function
probe_name:
.L8:
	movzwl	(%rcx), %eax
	testw	%ax, %ax
	je	.L12
	movzwl	(%rdx), %r8d
	testw	%r8w, %r8w
	je	.L15
	addq	$2, %rcx
	addq	$2, %rdx
	leal	-65(%rax), %r10d
	leal	32(%rax), %r9d
	cmpw	$26, %r10w
	cmovb	%r9d, %eax
	leal	-65(%r8), %r10d
	leal	32(%r8), %r9d
	cmpw	$26, %r10w
	cmovb	%r9d, %r8d
	cmpw	%r8w, %ax
	je	.L8
	movl	$0, %eax
	ret
.L15:
	movl	$0, %eax
	ret
.L12:
	cmpw	$0, (%rdx)
	sete	%al
	movzbl	%al, %eax
	ret
	.size	probe_name, .-probe_name
	.type	probe_hash_start, @function
probe_hash_start:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$48, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	$0, (%rcx)
	movq	$0, (%rdx)
	movl	$-268435456, 32(%rsp)
	movl	$24, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	CryptAcquireContextW@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L20
.L16:
	movl	%ebx, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L20:
	movq	(%rsi), %rcx
	movq	%rdi, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$32780, %edx
	call	CryptCreateHash@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L21
	movl	$1, %ebx
	jmp	.L16
.L21:
	movq	(%rsi), %rcx
	movl	$0, %edx
	call	CryptReleaseContext@PLT
	movq	$0, (%rsi)
	jmp	.L16
	.size	probe_hash_start, .-probe_hash_start
	.type	probe_hash_finish, @function
probe_hash_finish:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$64, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movl	$32, 60(%rsp)
	movl	$0, 32(%rsp)
	leaq	60(%rsp), %r9
	movl	$2, %edx
	movq	%rsi, %rcx
	call	CryptGetHashParam@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L23
	cmpl	$32, 60(%rsp)
	sete	%bl
	movzbl	%bl, %ebx
.L23:
	movq	%rsi, %rcx
	call	CryptDestroyHash@PLT
	movl	$0, %edx
	movq	%rdi, %rcx
	call	CryptReleaseContext@PLT
	movl	%ebx, %eax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.size	probe_hash_finish, .-probe_hash_finish
	.type	probe_hash_file, @function
probe_hash_file:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	leaq	-65536(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$104, %rsp
	movl	%edx, %edi
	movq	%r8, %r13
	movq	$0, 65624(%rsp)
	movq	$0, 65616(%rsp)
	movl	$0, 65612(%rsp)
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$3, 32(%rsp)
	movl	$0, %r9d
	movl	$7, %r8d
	movl	$-2147483648, %edx
	call	CreateFileW@PLT
	cmpq	$-1, %rax
	je	.L35
	movq	%rax, %rbx
	leaq	65612(%rsp), %rdx
	movq	%rax, %rcx
	call	GetFileSize@PLT
	cmpl	$0, 65612(%rsp)
	jne	.L43
	cmpl	%edi, %eax
	je	.L27
.L43:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	movl	$0, %ebp
.L25:
	movl	%ebp, %eax
	addq	$65640, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L27:
	leaq	65616(%rsp), %rdx
	leaq	65624(%rsp), %rcx
	call	probe_hash_start
	testl	%eax, %eax
	je	.L46
	movl	$0, %esi
	leaq	65608(%rsp), %r12
	leaq	64(%rsp), %rbp
	movl	%edi, %edi
	jmp	.L29
.L46:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	movl	$-3, %ebp
	jmp	.L25
.L47:
	movl	$0, %r9d
	movq	%rbp, %rdx
	movq	65616(%rsp), %rcx
	call	CryptHashData@PLT
	testl	%eax, %eax
	je	.L40
	movl	65608(%rsp), %eax
	movl	%eax, %edx
	addq	%rdx, %rsi
	testl	%eax, %eax
	je	.L31
.L29:
	movl	$0, 65608(%rsp)
	movq	$0, 32(%rsp)
	movq	%r12, %r9
	movl	$65536, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	ReadFile@PLT
	testl	%eax, %eax
	je	.L37
	movl	65608(%rsp), %r8d
	cmpl	$65536, %r8d
	ja	.L38
	movl	%r8d, %eax
	addq	%rsi, %rax
	cmpq	%rax, %rdi
	jb	.L39
	testl	%r8d, %r8d
	jne	.L47
.L31:
	movl	$-1, %ebp
	cmpq	%rsi, %rdi
	jne	.L30
	movq	%r13, %r8
	movq	65616(%rsp), %rdx
	movq	65624(%rsp), %rcx
	call	probe_hash_finish
	cmpl	$1, %eax
	sbbl	%ebp, %ebp
	andl	$-4, %ebp
	addl	$1, %ebp
	movq	$0, 65624(%rsp)
	movq	$0, 65616(%rsp)
	jmp	.L33
.L37:
	movl	$-1, %ebp
.L30:
	movq	65616(%rsp), %rcx
	testq	%rcx, %rcx
	jne	.L48
.L34:
	movq	65624(%rsp), %rcx
	testq	%rcx, %rcx
	jne	.L49
.L33:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	jmp	.L25
.L38:
	movl	$-1, %ebp
	jmp	.L30
.L39:
	movl	$-1, %ebp
	jmp	.L30
.L40:
	movl	$-3, %ebp
	jmp	.L30
.L48:
	call	CryptDestroyHash@PLT
	jmp	.L34
.L49:
	movl	$0, %edx
	call	CryptReleaseContext@PLT
	jmp	.L33
.L35:
	movl	$-2, %ebp
	jmp	.L25
	.size	probe_hash_file, .-probe_hash_file
	.type	probe_read, @function
probe_read:
	pushq	%rbx
	subq	$64, %rsp
	movq	%rcx, %r10
	movq	$0, 56(%rsp)
	leaq	-65536(%rdx), %rax
	movabsq	$140737488289791, %rcx
	cmpq	%rax, %rcx
	jb	.L52
	movq	%r9, %rbx
	cmpq	$1048576, %r9
	jbe	.L55
.L52:
	movl	$0, %eax
.L50:
	addq	$64, %rsp
	popq	%rbx
	ret
.L55:
	leaq	65536(%rcx), %rcx
	subq	%r9, %rcx
	movl	$0, %eax
	cmpq	%rdx, %rcx
	jb	.L50
	leaq	56(%rsp), %rax
	movq	%rax, 32(%rsp)
	movq	%r10, %rcx
	call	ReadProcessMemory@PLT
	testl	%eax, %eax
	je	.L50
	cmpq	%rbx, 56(%rsp)
	sete	%al
	movzbl	%al, %eax
	jmp	.L50
	.size	probe_read, .-probe_read
	.type	probe_pointer, @function
probe_pointer:
	pushq	%rbx
	subq	$32, %rsp
	movq	%r8, %rbx
	movq	$0, (%r8)
	movl	$8, %r9d
	call	probe_read
	testl	%eax, %eax
	je	.L56
	movq	(%rbx), %rax
	subq	$65536, %rax
	movabsq	$140737488289791, %rdx
	cmpq	%rax, %rdx
	setnb	%al
	movzbl	%al, %eax
.L56:
	addq	$32, %rsp
	popq	%rbx
	ret
	.size	probe_pointer, .-probe_pointer
	.globl	axiom_hash_known_client
	.hidden	axiom_hash_known_client
	.type	axiom_hash_known_client, @function
axiom_hash_known_client:
	subq	$72, %rsp
	leaq	32(%rsp), %r8
	movl	$142680528, %edx
	call	probe_hash_file
	cmpl	$1, %eax
	je	.L62
.L59:
	addq	$72, %rsp
	ret
.L62:
	leaq	32(%rsp), %rcx
	movl	$32, %r8d
	leaq	probe_exe_sha(%rip), %rdx
	call	probe_equal
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L59
	.size	axiom_hash_known_client, .-axiom_hash_known_client
	.globl	axiom_hash_known_library
	.hidden	axiom_hash_known_library
	.type	axiom_hash_known_library, @function
axiom_hash_known_library:
	subq	$72, %rsp
	leaq	32(%rsp), %r8
	movl	$17669616, %edx
	call	probe_hash_file
	cmpl	$1, %eax
	je	.L66
.L63:
	addq	$72, %rsp
	ret
.L66:
	leaq	32(%rsp), %rcx
	movl	$32, %r8d
	leaq	probe_dll_sha(%rip), %rdx
	call	probe_equal
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L63
	.size	axiom_hash_known_library, .-axiom_hash_known_library
	.section	.rodata.str2.8,"aMS",@progbits,2
	.align 8
__const_probe_LC0:
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"P"
	.string	"l"
	.string	"a"
	.string	"y"
	.string	"e"
	.string	"r"
	.string	"B"
	.string	"e"
	.string	"t"
	.string	"a"
	.string	"."
	.string	"e"
	.string	"x"
	.string	"e"
	.string	""
	.string	""
	.text
	.globl	probe_worker
	.hidden	probe_worker
	.type	probe_worker, @function
probe_worker:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	leaq	-65536(%rsp), %r11
.LPSRL1:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL1
	subq	$2072, %rsp
	movq	%rcx, %rdi
	movl	$32768, 396(%rsp)
	movq	$0, 384(%rsp)
	movq	$0, 376(%rsp)
	movq	$0, 368(%rsp)
	movq	$0, 360(%rsp)
	movl	$0, %edx
	movl	$2, %ecx
	call	CreateToolhelp32Snapshot@PLT
	movq	%rax, %rbx
	cmpq	$-1, %rax
	je	.L81
	leaq	67024(%rsp), %rsi
	movl	$568, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	memset@PLT
	movl	$568, 67024(%rsp)
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	Process32FirstW@PLT
	testl	%eax, %eax
	je	.L82
	movl	$0, %r13d
	movl	$0, %esi
	leaq	67068(%rsp), %r14
	leaq	__const_probe_LC0(%rip), %r12
	leaq	67024(%rsp), %rbp
	jmp	.L70
.L110:
	movl	67032(%rsp), %r13d
	addl	$1, %esi
.L69:
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	Process32NextW@PLT
	testl	%eax, %eax
	je	.L109
.L70:
	movq	%r12, %rdx
	movq	%r14, %rcx
	call	probe_name
	testl	%eax, %eax
	je	.L69
	jmp	.L110
.L109:
	testl	%esi, %esi
	je	.L83
	cmpl	$1, %esi
	je	.L111
	movl	$3, %esi
	jmp	.L68
.L111:
	movl	%r13d, %r8d
	movl	$0, %edx
	movl	$4112, %ecx
	call	OpenProcess@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L85
	leaq	396(%rsp), %r9
	leaq	400(%rsp), %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	QueryFullProcessImageNameW@PLT
	testl	%eax, %eax
	je	.L86
	cmpl	$0, 396(%rsp)
	jne	.L112
	movl	$5, %esi
	jmp	.L71
.L112:
	leaq	400(%rsp), %rcx
	call	axiom_hash_known_client
	cmpl	$-3, %eax
	je	.L88
	testl	%eax, %eax
	js	.L89
	jne	.L113
	movl	$7, %esi
	jmp	.L71
.L113:
	movl	%r13d, %edx
	movl	$24, %ecx
	call	CreateToolhelp32Snapshot@PLT
	movq	%rax, %r12
	cmpq	$-1, %rax
	je	.L91
	leaq	65936(%rsp), %r13
	movl	$1080, %r8d
	movl	$0, %edx
	movq	%r13, %rcx
	call	memset@PLT
	movl	$1080, 65936(%rsp)
	movq	%r13, %rdx
	movq	%r12, %rcx
	call	Module32FirstW@PLT
	testl	%eax, %eax
	jne	.L114
	movl	$0, %r13d
	movl	$8, %esi
	jmp	.L78
.L114:
	leaq	65984(%rsp), %rcx
	leaq	__const_probe_LC0(%rip), %rdx
	call	probe_name
	testl	%eax, %eax
	je	.L93
	cmpl	$147875335, 65968(%rsp)
	jbe	.L94
	movq	65960(%rsp), %r13
	testq	%r13, %r13
	je	.L95
	leaq	119339936(%r13), %rdx
	movl	$256, %r9d
	leaq	64(%rsp), %r8
	movq	%rbp, %rcx
	call	probe_read
	testl	%eax, %eax
	jne	.L115
	movl	$0, %r13d
	movl	$9, %esi
	jmp	.L78
.L115:
	movq	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	leaq	56(%rsp), %rdx
	leaq	48(%rsp), %rcx
	call	probe_hash_start
	testl	%eax, %eax
	jne	.L116
.L73:
	movl	$0, %r13d
	movl	$12, %esi
	jmp	.L78
.L116:
	leaq	64(%rsp), %rdx
	movl	$0, %r9d
	movl	$256, %r8d
	movq	56(%rsp), %rcx
	call	CryptHashData@PLT
	testl	%eax, %eax
	je	.L117
	leaq	320(%rsp), %r8
	movq	56(%rsp), %rdx
	movq	48(%rsp), %rcx
	call	probe_hash_finish
	testl	%eax, %eax
	je	.L97
	leaq	320(%rsp), %rcx
	movl	$32, %r8d
	leaq	probe_table_sha(%rip), %rdx
	call	probe_equal
	testl	%eax, %eax
	je	.L98
	leaq	probe_rvas(%rip), %r14
	leaq	probe_code(%rip), %r15
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
.L76:
	movl	(%r14), %edx
	addq	%r13, %rdx
	movl	$16, %r9d
	movq	40(%rsp), %r8
	movq	%rbp, %rcx
	call	probe_read
	testl	%eax, %eax
	je	.L99
	movl	$16, %r8d
	movq	%r15, %rdx
	movq	40(%rsp), %rcx
	call	probe_equal
	testl	%eax, %eax
	je	.L100
	addq	$4, %r14
	addq	$16, %r15
	leaq	16+probe_rvas(%rip), %rax
	cmpq	%rax, %r14
	jne	.L76
	leaq	147875328(%r13), %rdx
	leaq	384(%rsp), %r8
	movq	%rbp, %rcx
	call	probe_pointer
	movl	$0, %r13d
	testl	%eax, %eax
	je	.L78
	movq	384(%rsp), %rax
	leaq	504(%rax), %rdx
	leaq	376(%rsp), %r8
	movq	%rbp, %rcx
	call	probe_pointer
	movl	%esi, %r13d
	testl	%eax, %eax
	je	.L78
	movq	376(%rsp), %rax
	leaq	1088(%rax), %rdx
	leaq	368(%rsp), %r8
	movq	%rbp, %rcx
	call	probe_pointer
	movl	$3, %r13d
	testl	%eax, %eax
	je	.L78
	movl	$8, %r9d
	leaq	360(%rsp), %r8
	movq	368(%rsp), %rdx
	movq	%rbp, %rcx
	call	probe_read
	cmpl	$1, %eax
	sbbl	%r13d, %r13d
	andl	$-4, %r13d
	addl	$7, %r13d
	jmp	.L78
.L117:
	movq	56(%rsp), %rcx
	call	CryptDestroyHash@PLT
	movl	$0, %edx
	movq	48(%rsp), %rcx
	call	CryptReleaseContext@PLT
	jmp	.L73
.L99:
	movl	$9, %esi
.L75:
	movl	$0, %r13d
.L78:
	movq	%r12, %rcx
	call	CloseHandle@PLT
.L79:
	movq	%rbp, %rcx
	call	CloseHandle@PLT
.L80:
	cmpq	$-1, %rbx
	je	.L77
	movq	%rbx, %rcx
	call	CloseHandle@PLT
.L77:
	movl	%r13d, %r9d
	movl	%esi, %r8d
	movl	$32771, %edx
	movq	%rdi, %rcx
	call	PostMessageW@PLT
	movl	$0, %eax
	addq	$67608, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L100:
	movl	$11, %esi
	jmp	.L75
.L93:
	movl	$0, %r13d
	movl	$8, %esi
	jmp	.L78
.L94:
	movl	$0, %r13d
	movl	$8, %esi
	jmp	.L78
.L95:
	movl	$0, %r13d
	movl	$8, %esi
	jmp	.L78
.L97:
	movl	$0, %r13d
	movl	$12, %esi
	jmp	.L78
.L98:
	movl	$0, %r13d
	movl	$10, %esi
	jmp	.L78
.L86:
	movl	$5, %esi
.L71:
	movl	$0, %r13d
	jmp	.L79
.L88:
	movl	$12, %esi
	jmp	.L71
.L89:
	movl	$6, %esi
	jmp	.L71
.L91:
	movl	$8, %esi
	jmp	.L71
.L81:
	movl	$13, %esi
.L68:
	movl	$0, %r13d
	jmp	.L80
.L82:
	movl	$2, %esi
	jmp	.L68
.L83:
	movl	$2, %esi
	jmp	.L68
.L85:
	movl	$4, %esi
	jmp	.L68
	.size	probe_worker, .-probe_worker
	.section	.rodata
	.align 32
	.type	probe_code, @object
	.size	probe_code, 64
probe_code:
	.string	"H\203\3548\213\201H\026"
	.string	""
	.ascii	"\220\203\370\003}%"
	.string	"H\211L$\bUVAWH\215\254$"
	.ascii	"\375\377"
	.ascii	"H\211T$\020H\211L$\bUSVWAT"
	.ascii	"H\211\\$\030H\211t$ WH\203\354 \017"
	.align 16
	.type	probe_rvas, @object
	.size	probe_rvas, 16
probe_rvas:
	.long	69009536
	.long	40041264
	.long	40219856
	.long	93940240
	.align 32
	.type	probe_table_sha, @object
	.size	probe_table_sha, 32
probe_table_sha:
	.ascii	"!\375\343|\340D\214\030\365S/D\013\t[\031\340\320A'\253\273\213"
	.ascii	"fT\016<L\330\237\250\363"
	.align 32
	.type	probe_dll_sha, @object
	.size	probe_dll_sha, 32
probe_dll_sha:
	.ascii	"\265\350\036\f\360p\357\242\356\200$\274\321\200\025j[\332\335"
	.ascii	"\305m\r\037J\233\306 \270u7a\336"
	.align 32
	.type	probe_exe_sha, @object
	.size	probe_exe_sha, 32
probe_exe_sha:
	.ascii	"\245\241:\236OW\217\316\006u\340\337\303\355\315\252\3269\334"
	.ascii	"\263\343\006\272\336\271\337Yp\020\312b)"
	.section	.note.GNU-stack,"",@progbits
