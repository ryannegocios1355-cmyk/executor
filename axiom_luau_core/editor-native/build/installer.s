.globl num
.globl append
.globl installer_worker
.globl __const_installer_LC4
.globl __const_installer_LC0
.globl __const_installer_LC7
.globl __const_installer_LC3
.globl __const_installer_LC9
.globl __const_installer_LC8
.globl __const_installer_LC6
.globl __const_installer_LC1
.globl __const_installer_LC5
.globl __const_installer_LC2
.globl __const_installer_LC10
.globl __const_installer_LC11
.globl __const_installer_LC12
	.file	"installer.c"
	.text
	.type	append, @function
append:
	movq	%rcx, %r11
	movzwl	(%r9), %ecx
	testw	%cx, %cx
	je	.L4
	leal	1(%rdx), %eax
	cmpl	%r8d, %eax
	jnb	.L5
	movl	$0, %edx
	jmp	.L3
.L6:
	movl	%r10d, %eax
.L3:
	addl	$1, %edx
	leal	-1(%rax), %r10d
	movw	%cx, (%r11,%r10,2)
	movl	%edx, %ecx
	movzwl	(%r9,%rcx,2), %ecx
	testw	%cx, %cx
	je	.L2
	leal	1(%rax), %r10d
	cmpl	%r8d, %r10d
	jb	.L6
.L2:
	movl	%eax, %edx
	movw	$0, (%r11,%rdx,2)
	ret
.L4:
	movl	%edx, %eax
	jmp	.L2
.L5:
	movl	%edx, %eax
	jmp	.L2
	.size	append, .-append
	.type	num, @function
num:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %r11
	movl	%edx, %ebx
	movl	$1, %edx
	movl	$3435973837, %edi
.L8:
	movl	%edx, %esi
	movl	%r9d, %eax
	imulq	%rdi, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %r10d
	addl	%r10d, %r10d
	movl	%r9d, %ecx
	subl	%r10d, %ecx
	addl	$48, %ecx
	movw	%cx, -2(%rsp,%rdx,2)
	movl	%r9d, %ecx
	movl	%eax, %r9d
	addq	$1, %rdx
	cmpl	$9, %ecx
	jbe	.L14
	cmpl	$15, %esi
	jbe	.L8
.L14:
	leal	1(%rbx), %ecx
	cmpl	%r8d, %ecx
	jnb	.L12
	movq	%rsp, %r10
	leal	-1(%rsi), %eax
	leaq	(%r10,%rax,2), %rdx
	jmp	.L11
.L13:
	movl	%eax, %ecx
.L11:
	leal	-1(%rcx), %eax
	movzwl	(%rdx), %r9d
	movw	%r9w, (%r11,%rax,2)
	cmpq	%r10, %rdx
	je	.L10
	leal	1(%rcx), %eax
	subq	$2, %rdx
	cmpl	%r8d, %eax
	jb	.L13
.L10:
	movl	%ecx, %eax
	movw	$0, (%r11,%rax,2)
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L12:
	movl	%ebx, %ecx
	jmp	.L10
	.size	num, .-num
	.section	.rodata.str2.8,"aMS",@progbits,2
	.align 8
__const_installer_LC0:
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"C"
	.string	"o"
	.string	"r"
	.string	"p"
	.string	"o"
	.string	"r"
	.string	"a"
	.string	"t"
	.string	"i"
	.string	"o"
	.string	"n"
	.string	""
	.string	""
	.align 8
__const_installer_LC1:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"-"
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"l"
	.string	"e"
	.string	"r"
	.string	"-"
	.string	""
	.string	""
	.section	.rodata.str2.2,"aMS",@progbits,2
	.align 2
__const_installer_LC2:
	.string	"-"
	.string	""
	.string	""
	.align 2
__const_installer_LC3:
	.string	"."
	.string	"e"
	.string	"x"
	.string	"e"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_installer_LC4:
	.string	"s"
	.string	"e"
	.string	"t"
	.string	"u"
	.string	"p"
	.string	"."
	.string	"r"
	.string	"b"
	.string	"x"
	.string	"c"
	.string	"d"
	.string	"n"
	.string	"."
	.string	"c"
	.string	"o"
	.string	"m"
	.string	""
	.string	""
	.align 8
__const_installer_LC5:
	.string	"/"
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
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"l"
	.string	"e"
	.string	"r"
	.string	"."
	.string	"e"
	.string	"x"
	.string	"e"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_installer_LC6:
	.string	"G"
	.string	"E"
	.string	"T"
	.string	""
	.string	""
	.align 2
__const_installer_LC7:
	.string	"w"
	.string	"i"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"u"
	.string	"s"
	.string	"t"
	.string	"."
	.string	"d"
	.string	"l"
	.string	"l"
	.string	""
	.string	""
	.section	.rodata.str1.1,"aMS",@progbits,1
__const_installer_LC8:
	.string	"WTHelperProvDataFromStateData"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
__const_installer_LC9:
	.string	"WTHelperGetProvSignerFromChain"
	.section	.rodata.str1.1
__const_installer_LC10:
	.string	"WTHelperGetProvCertFromChain"
	.section	.rodata.str2.2
	.align 2
__const_installer_LC11:
	.string	"o"
	.string	"p"
	.string	"e"
	.string	"n"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_installer_LC12:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"l"
	.string	"e"
	.string	"r"
	.string	"/"
	.string	"1"
	.string	"."
	.string	"0"
	.string	""
	.string	""
	.text
	.globl	installer_worker
	.type	installer_worker, @function
installer_worker:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	leaq	-16384(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$3128, %rsp
	movq	%rcx, %rsi
	movl	$2, 17260(%rsp)
	movl	$0, 17256(%rsp)
	movl	$4, 17252(%rsp)
	movl	$0, 17240(%rsp)
	leaq	18464(%rsp), %rdx
	movl	$520, %ecx
	call	GetTempPathW@PLT
	subl	$1, %eax
	cmpl	$518, %eax
	ja	.L44
	movl	$0, %ebp
	leaq	18464(%rsp), %r13
	leaq	17264(%rsp), %rdi
	leaq	__const_installer_LC1(%rip), %r12
.L20:
	movq	%r13, %r9
	movl	$600, %r8d
	movl	$0, %edx
	movq	%rdi, %rcx
	call	append
	movl	%eax, %edx
	movq	%r12, %r9
	movl	$600, %r8d
	movq	%rdi, %rcx
	call	append
	movl	%eax, %ebx
	call	GetCurrentProcessId@PLT
	movl	%eax, %r9d
	movl	$600, %r8d
	movl	%ebx, %edx
	movq	%rdi, %rcx
	call	num
	movl	%eax, %edx
	leaq	__const_installer_LC2(%rip), %r9
	movl	$600, %r8d
	movq	%rdi, %rcx
	call	append
	movl	%eax, %edx
	movl	%ebp, %r9d
	movl	$600, %r8d
	movq	%rdi, %rcx
	call	num
	movl	%eax, %edx
	leaq	__const_installer_LC3(%rip), %r9
	movl	$600, %r8d
	movq	%rdi, %rcx
	call	append
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$1, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1073741824, %edx
	movq	%rdi, %rcx
	call	CreateFileW@PLT
	movq	%rax, %rbx
	cmpq	$-1, %rax
	jne	.L19
	addl	$1, %ebp
	cmpl	$32, %ebp
	jne	.L20
	movl	$0, %r13d
	movl	$0, %r12d
	movl	$0, %ebp
	movl	$0, %edi
.L21:
	cmpq	$-1, %rbx
	je	.L71
.L41:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
.L35:
	movl	$0, %ebx
	movl	$3, %r14d
	jmp	.L42
.L30:
	cmpl	%eax, %r14d
	jne	.L27
.L28:
	movzwl	(%rcx), %r14d
	testw	%r14w, %r14w
	je	.L31
	movzwl	(%rdx), %eax
	testw	%ax, %ax
	je	.L31
	addq	$2, %rcx
	movzwl	%r14w, %r14d
	addq	$2, %rdx
	movzwl	%ax, %eax
	leal	-65(%r14), %r8d
	cmpl	$25, %r8d
	ja	.L29
	addl	$32, %r14d
.L29:
	leal	-65(%rax), %r8d
	cmpl	$25, %r8d
	ja	.L30
	addl	$32, %eax
	jmp	.L30
.L74:
	leaq	__const_installer_LC0(%rip), %rdx
	leaq	224(%rsp), %rcx
	jmp	.L28
.L31:
	movzwl	(%rdx), %r15d
	movq	%r13, %rcx
	call	FreeLibrary@PLT
	movl	$2, 176(%rsp)
	leaq	80(%rsp), %rdx
	leaq	128(%rsp), %r8
	movq	$-1, %rcx
	call	WinVerifyTrust@PLT
	cmpw	%r14w, %r15w
	jne	.L56
	leaq	736(%rsp), %r13
	movl	$112, %r8d
	movl	$0, %edx
	movq	%r13, %rcx
	call	memset@PLT
	movl	$112, 736(%rsp)
	movl	$64, 740(%rsp)
	leaq	__const_installer_LC11(%rip), %rax
	movq	%rax, 752(%rsp)
	leaq	17264(%rsp), %rax
	movq	%rax, 760(%rsp)
	movl	$1, 784(%rsp)
	movq	%r13, %rcx
	call	ShellExecuteExW@PLT
	testl	%eax, %eax
	je	.L57
	cmpq	$0, 840(%rsp)
	je	.L58
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$32770, %edx
	movq	%rsi, %rcx
	call	PostMessageW@PLT
	movl	$1200000, %edx
	movq	840(%rsp), %rcx
	call	WaitForSingleObject@PLT
	movl	$6, %r14d
	testl	%eax, %eax
	je	.L72
.L34:
	movq	840(%rsp), %rcx
	call	CloseHandle@PLT
	movl	$1, %ebx
	movl	$1, %r13d
	jmp	.L42
.L72:
	leaq	17240(%rsp), %rdx
	movq	840(%rsp), %rcx
	call	GetExitCodeProcess@PLT
	movl	$7, %r14d
	testl	%eax, %eax
	je	.L34
	cmpl	$1, 17240(%rsp)
	sbbl	%r14d, %r14d
	andl	$-5, %r14d
	addl	$7, %r14d
	jmp	.L34
.L22:
	cmpq	$-1, %rbx
	je	.L62
	movl	$1, %r13d
	jmp	.L41
.L64:
	leaq	17264(%rsp), %rcx
	call	DeleteFileW@PLT
	jmp	.L39
.L45:
	movq	%rax, %r12
	movl	$1, %r13d
	jmp	.L21
.L46:
	movl	$1, %r13d
	jmp	.L21
.L50:
	movl	$1, %r13d
	jmp	.L21
.L51:
	movl	$1, %r13d
	jmp	.L21
.L73:
	movq	%rdi, %r12
	movq	%rdi, %rbp
	movl	$1, %r13d
	jmp	.L21
.L71:
	movl	$0, %ebx
	movl	$3, %r14d
	jmp	.L42
.L26:
	movl	$2, 176(%rsp)
	leaq	80(%rsp), %rdx
	leaq	128(%rsp), %r8
	movq	$-1, %rcx
	call	WinVerifyTrust@PLT
	movl	$4, %r14d
.L33:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	movl	$0, %ebx
	movl	$1, %r13d
.L42:
	testq	%r12, %r12
	je	.L36
	movq	%r12, %rcx
	call	WinHttpCloseHandle@PLT
.L36:
	testq	%rbp, %rbp
	je	.L37
	movq	%rbp, %rcx
	call	WinHttpCloseHandle@PLT
.L37:
	testq	%rdi, %rdi
	je	.L38
	movq	%rdi, %rcx
	call	WinHttpCloseHandle@PLT
.L38:
	testl	%r13d, %r13d
	je	.L39
	testl	%ebx, %ebx
	je	.L64
	cmpl	$6, %r14d
	jne	.L64
.L39:
	movl	17240(%rsp), %r9d
	movl	%r14d, %r8d
	movl	$32770, %edx
	movq	%rsi, %rcx
	call	PostMessageW@PLT
	movl	$0, %eax
	addq	$19512, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L62:
	movl	$1, %r13d
	jmp	.L35
.L56:
	movl	$4, %r14d
	jmp	.L33
.L57:
	movl	$5, %r14d
	jmp	.L33
.L58:
	movl	$5, %r14d
	jmp	.L33
.L44:
	movl	$0, %ebx
	movl	$0, %r13d
	movl	$3, %r14d
	movl	$0, %r12d
	movl	$0, %ebp
	movl	$0, %edi
	jmp	.L42
.L54:
	movl	$0, %ebx
	movl	$1, %r13d
	movl	$4, %r14d
	jmp	.L42
.L19:
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1, %edx
	leaq	__const_installer_LC12(%rip), %rcx
	call	WinHttpOpen@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L73
	movl	$30000, 32(%rsp)
	movl	$30000, %r9d
	movl	$10000, %r8d
	movl	$10000, %edx
	movq	%rdi, %rcx
	call	WinHttpSetTimeouts@PLT
	movl	$0, %r9d
	movl	$443, %r8d
	leaq	__const_installer_LC4(%rip), %rdx
	movq	%rdi, %rcx
	call	WinHttpConnect@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L45
	movl	$8388608, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_installer_LC5(%rip), %r8
	leaq	__const_installer_LC6(%rip), %rdx
	movq	%rax, %rcx
	call	WinHttpOpenRequest@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L46
	movl	$4, %r9d
	leaq	17260(%rsp), %r8
	movl	$63, %edx
	movq	%rax, %rcx
	call	WinHttpSetOption@PLT
	movl	$1, %r13d
	testl	%eax, %eax
	je	.L21
	movq	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%r12, %rcx
	call	WinHttpSendRequest@PLT
	testl	%eax, %eax
	je	.L21
	movl	$0, %edx
	movq	%r12, %rcx
	call	WinHttpReceiveResponse@PLT
	testl	%eax, %eax
	je	.L21
	movq	$0, 40(%rsp)
	leaq	17252(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	17256(%rsp), %r9
	movl	$0, %r8d
	movl	$536870931, %edx
	movq	%r12, %rcx
	call	WinHttpQueryHeaders@PLT
	testl	%eax, %eax
	je	.L50
	cmpl	$200, 17256(%rsp)
	jne	.L51
	movl	$0, 64(%rsp)
	leaq	17248(%rsp), %rax
	movq	%rax, 72(%rsp)
	leaq	848(%rsp), %r14
.L25:
	movl	$0, 17248(%rsp)
	movq	72(%rsp), %r9
	movl	$16384, %r8d
	movq	%r14, %rdx
	movq	%r12, %rcx
	call	WinHttpReadData@PLT
	testl	%eax, %eax
	je	.L22
	movl	17248(%rsp), %r8d
	movl	$67108864, %eax
	movl	64(%rsp), %ecx
	subl	%ecx, %eax
	cmpl	%r8d, %eax
	jb	.L22
	testl	%r8d, %r8d
	je	.L23
	movl	$0, %r13d
	leaq	17244(%rsp), %r15
.L24:
	movl	$0, 17244(%rsp)
	movl	%r13d, %edx
	addq	%r14, %rdx
	movq	$0, 32(%rsp)
	movq	%r15, %r9
	subl	%r13d, %r8d
	movq	%rbx, %rcx
	call	WriteFile@PLT
	testl	%eax, %eax
	je	.L22
	movl	17244(%rsp), %eax
	testl	%eax, %eax
	je	.L22
	addl	%eax, %r13d
	movl	17248(%rsp), %r8d
	cmpl	%r8d, %r13d
	jb	.L24
	addl	%r8d, 64(%rsp)
	testl	%r8d, %r8d
	jne	.L25
.L23:
	movl	$1, %r13d
	cmpl	$0, 64(%rsp)
	je	.L21
	movq	%rbx, %rcx
	call	FlushFileBuffers@PLT
	testl	%eax, %eax
	je	.L21
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	leaq	17264(%rsp), %rcx
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$3, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$-2147483648, %edx
	call	CreateFileW@PLT
	movq	%rax, %rbx
	cmpq	$-1, %rax
	je	.L54
	movl	$11191659, 80(%rsp)
	movw	$-12988, 84(%rsp)
	movw	$4560, 86(%rsp)
	movabsq	$-1254883273373334900, %rax
	movq	%rax, 88(%rsp)
	leaq	96(%rsp), %r14
	movl	$32, %r8d
	movl	$0, %edx
	movq	%r14, %rcx
	call	memset@PLT
	movl	$32, 96(%rsp)
	leaq	17264(%rsp), %rax
	movq	%rax, 104(%rsp)
	movq	%rbx, 112(%rsp)
	leaq	128(%rsp), %r13
	movl	$88, %r8d
	movl	$0, %edx
	movq	%r13, %rcx
	call	memset@PLT
	movl	$88, 128(%rsp)
	movl	$2, 152(%rsp)
	movl	$1, 160(%rsp)
	movq	%r14, 168(%rsp)
	movl	$1, 176(%rsp)
	leaq	80(%rsp), %rdx
	movq	%r13, %r8
	movq	$-1, %rcx
	call	WinVerifyTrust@PLT
	testl	%eax, %eax
	jne	.L26
	cmpq	$0, 184(%rsp)
	je	.L26
	leaq	__const_installer_LC7(%rip), %rcx
	call	LoadLibraryW@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L26
	leaq	__const_installer_LC8(%rip), %rdx
	movq	%rax, %rcx
	call	GetProcAddress@PLT
	movq	%rax, %r15
	leaq	__const_installer_LC9(%rip), %rdx
	movq	%r13, %rcx
	call	GetProcAddress@PLT
	movq	%rax, %r14
	leaq	__const_installer_LC10(%rip), %rdx
	movq	%r13, %rcx
	call	GetProcAddress@PLT
	movq	%rax, %rcx
	testq	%r15, %r15
	setne	%dl
	testq	%r14, %r14
	setne	%al
	testb	%al, %dl
	je	.L27
	movq	%rcx, 64(%rsp)
	testq	%rcx, %rcx
	je	.L27
	movq	184(%rsp), %rcx
	call	*%r15
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L27
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	call	*%r14
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L27
	movl	$0, %edx
	movq	64(%rsp), %rax
	call	*%rax
	testq	%rax, %rax
	je	.L27
	movq	8(%rax), %rcx
	testq	%rcx, %rcx
	je	.L27
	movl	$256, 40(%rsp)
	leaq	224(%rsp), %rax
	movq	%rax, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$4, %edx
	call	CertGetNameStringW@PLT
	cmpl	$1, %eax
	ja	.L74
.L27:
	movq	%r13, %rcx
	call	FreeLibrary@PLT
	movl	$2, 176(%rsp)
	leaq	80(%rsp), %rdx
	leaq	128(%rsp), %r8
	movq	$-1, %rcx
	call	WinVerifyTrust@PLT
	movl	$4, %r14d
	jmp	.L33
	.size	installer_worker, .-installer_worker
	.section	.note.GNU-stack,"",@progbits
