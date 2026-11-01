.globl watchdog
.globl localrun_start
.globl local_worker
.globl close_handle
.globl local_alloc
.globl local_append
.globl local_free
.globl __const_localrun_LC4
.globl __const_localrun_LC0
.globl __const_localrun_LC3
.globl __const_localrun_LC1
.globl __const_localrun_LC2
	.file	"localrun.c"
	.text
	.type	local_append, @function
local_append:
	movzwl	(%r9), %r10d
	testw	%r10w, %r10w
	je	.L4
	leal	1(%rdx), %eax
	cmpl	%r8d, %eax
	jb	.L3
	movl	%edx, %eax
	jmp	.L2
.L6:
	movl	%edx, %eax
.L3:
	addq	$2, %r9
	leal	-1(%rax), %edx
	movw	%r10w, (%rcx,%rdx,2)
	movzwl	(%r9), %r10d
	testw	%r10w, %r10w
	je	.L2
	leal	1(%rax), %edx
	cmpl	%r8d, %edx
	jb	.L6
.L2:
	movl	%eax, %edx
	movw	$0, (%rcx,%rdx,2)
	ret
.L4:
	movl	%edx, %eax
	jmp	.L2
	.size	local_append, .-local_append
	.type	close_handle, @function
close_handle:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	je	.L7
	call	CloseHandle@PLT
	movq	$0, (%rbx)
.L7:
	addq	$32, %rsp
	popq	%rbx
	ret
	.size	close_handle, .-close_handle
	.type	watchdog, @function
watchdog:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movl	$15000, %edx
	call	WaitForSingleObject@PLT
	cmpl	$258, %eax
	je	.L14
	testl	%eax, %eax
	jne	.L15
.L12:
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
.L14:
	movl	$1, 8(%rbx)
	movq	(%rbx), %rcx
	movl	$124, %edx
	call	TerminateProcess@PLT
	jmp	.L12
.L15:
	movl	$1, 12(%rbx)
	movq	(%rbx), %rcx
	movl	$125, %edx
	call	TerminateProcess@PLT
	jmp	.L12
	.size	watchdog, .-watchdog
	.type	local_alloc, @function
local_alloc:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	call	GetProcessHeap@PLT
	movq	%rax, %rcx
	movq	%rbx, %r8
	movl	$8, %edx
	call	HeapAlloc@PLT
	addq	$32, %rsp
	popq	%rbx
	ret
	.size	local_alloc, .-local_alloc
	.type	local_free, @function
local_free:
	testq	%rcx, %rcx
	je	.L21
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	call	GetProcessHeap@PLT
	movq	%rax, %rcx
	movq	%rbx, %r8
	movl	$0, %edx
	call	HeapFree@PLT
	addq	$32, %rsp
	popq	%rbx
	ret
.L21:
	ret
	.size	local_free, .-local_free
	.section	.rodata.str2.2,"aMS",@progbits,2
	.align 2
__const_localrun_LC0:
	.string	"c"
	.string	"h"
	.string	"e"
	.string	"c"
	.string	"k"
	.string	" "
	.string	"-"
	.string	""
	.string	""
	.section	.rodata.str2.8,"aMS",@progbits,2
	.align 8
__const_localrun_LC1:
	.string	"r"
	.string	"u"
	.string	"n"
	.string	" "
	.string	"-"
	.string	" "
	.string	"-"
	.string	"-"
	.string	"t"
	.string	"i"
	.string	"m"
	.string	"e"
	.string	"o"
	.string	"u"
	.string	"t"
	.string	"-"
	.string	"m"
	.string	"s"
	.string	" "
	.string	"5"
	.string	"0"
	.string	"0"
	.string	"0"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_localrun_LC2:
	.string	"a"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"-"
	.string	"l"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	"."
	.string	"e"
	.string	"x"
	.string	"e"
	.string	""
	.string	""
	.align 2
__const_localrun_LC3:
	.string	"\""
	.string	""
	.string	""
	.align 2
__const_localrun_LC4:
	.string	"\""
	.string	" "
	.string	""
	.string	""
	.text
	.type	local_worker, @function
local_worker:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$3592, %rsp
	movq	%rcx, %rbx
	movq	$0, 15672(%rsp)
	movq	$0, 15664(%rsp)
	movq	$0, 15656(%rsp)
	movq	$0, 15648(%rsp)
	movq	$0, 15640(%rsp)
	movl	$1, 100(%rsp)
	leaq	15840(%rsp), %rcx
	movl	$24, %r8d
	movl	$0, %edx
	call	memset@PLT
	movl	$24, 15840(%rsp)
	movl	$1, 15856(%rsp)
	leaq	15728(%rsp), %rcx
	movl	$104, %r8d
	movl	$0, %edx
	call	memset@PLT
	movl	$104, 15728(%rsp)
	movl	$256, 15788(%rsp)
	leaq	15696(%rsp), %rcx
	movl	$24, %r8d
	movl	$0, %edx
	call	memset@PLT
	leaq	15680(%rsp), %rcx
	movl	$16, %r8d
	movl	$0, %edx
	call	memset@PLT
	leaq	11536(%rsp), %rdx
	movl	$2048, %r8d
	movl	$0, %ecx
	call	GetModuleFileNameW@PLT
	leal	-1(%rax), %edx
	cmpl	$2046, %edx
	ja	.L67
.L26:
	movl	%eax, %ecx
	subl	$1, %eax
	movl	%eax, %edx
	movzwl	11536(%rsp,%rdx,2), %edx
	cmpw	$47, %dx
	je	.L60
	cmpw	$92, %dx
	je	.L60
	testl	%eax, %eax
	jne	.L26
	movl	$3, %edi
	movl	$0, %esi
	jmp	.L25
.L60:
	leal	16(%rcx), %eax
	cmpl	$2047, %eax
	ja	.L46
	testl	%ecx, %ecx
	je	.L46
	leaq	11536(%rsp), %rsi
	leaq	__const_localrun_LC2(%rip), %r9
	movl	$2048, %r8d
	movl	%ecx, %edx
	movq	%rsi, %rcx
	call	local_append
	movq	%rsi, %rcx
	call	GetFileAttributesW@PLT
	movl	%eax, %edi
	cmpl	$-1, %eax
	je	.L47
	andl	$16, %edi
	je	.L68
	movl	$3, %edi
	movl	$0, %esi
	jmp	.L25
.L68:
	leaq	7136(%rsp), %rsi
	leaq	__const_localrun_LC3(%rip), %r9
	movl	$2200, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	local_append
	movl	%eax, %edx
	leaq	11536(%rsp), %r9
	movl	$2200, %r8d
	movq	%rsi, %rcx
	call	local_append
	movl	%eax, %edx
	leaq	__const_localrun_LC4(%rip), %r9
	movl	$2200, %r8d
	movq	%rsi, %rcx
	call	local_append
	movl	%eax, %edx
	cmpl	$0, 20(%rbx)
	leaq	__const_localrun_LC1(%rip), %r9
	leaq	__const_localrun_LC0(%rip), %rax
	cmovne	%rax, %r9
	movq	%rsi, %rcx
	movl	$2200, %r8d
	call	local_append
	leaq	15664(%rsp), %rdx
	leaq	15672(%rsp), %rcx
	movl	$0, %r9d
	leaq	15840(%rsp), %r8
	call	CreatePipe@PLT
	testl	%eax, %eax
	jne	.L69
	movl	$6, %edi
	movl	$0, %esi
	jmp	.L25
.L69:
	leaq	15648(%rsp), %rdx
	leaq	15656(%rsp), %rcx
	movl	$0, %r9d
	leaq	15840(%rsp), %r8
	call	CreatePipe@PLT
	testl	%eax, %eax
	jne	.L70
	movl	$6, %edi
	movl	$0, %esi
	jmp	.L25
.L70:
	movl	$0, %r8d
	movl	$1, %edx
	movq	15664(%rsp), %rcx
	call	SetHandleInformation@PLT
	testl	%eax, %eax
	jne	.L71
	movl	$6, %edi
	movl	$0, %esi
	jmp	.L25
.L71:
	movl	$0, %r8d
	movl	$1, %edx
	movq	15656(%rsp), %rcx
	call	SetHandleInformation@PLT
	testl	%eax, %eax
	jne	.L72
	movl	$6, %edi
	movl	$0, %esi
	jmp	.L25
.L72:
	movq	15672(%rsp), %rax
	movq	%rax, 15808(%rsp)
	movq	15648(%rsp), %rax
	movq	%rax, 15816(%rsp)
	movq	%rax, 15824(%rsp)
	movq	%rsi, %rdx
	leaq	11536(%rsp), %rcx
	leaq	15696(%rsp), %rax
	movq	%rax, 72(%rsp)
	leaq	15728(%rsp), %rax
	movq	%rax, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	$134217728, 40(%rsp)
	movl	$1, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	call	CreateProcessW@PLT
	testl	%eax, %eax
	jne	.L73
	movl	$4, %edi
	movl	$0, %esi
	jmp	.L25
.L73:
	leaq	15672(%rsp), %rcx
	call	close_handle
	leaq	15648(%rsp), %rcx
	call	close_handle
	leaq	15704(%rsp), %rcx
	call	close_handle
	movq	15696(%rsp), %rax
	movq	%rax, 15680(%rsp)
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	leaq	15680(%rsp), %r9
	leaq	watchdog(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	CreateThread@PLT
	movq	%rax, %r13
	movq	%rax, 15640(%rsp)
	testq	%rax, %rax
	je	.L30
	movl	16(%rbx), %r8d
	movl	%edi, %r12d
	leaq	104(%rsp), %rsi
	testl	%r8d, %r8d
	je	.L74
.L31:
	movl	$0, 104(%rsp)
	movl	%r12d, %edx
	addq	8(%rbx), %rdx
	movq	$0, 32(%rsp)
	movq	%rsi, %r9
	subl	%r12d, %r8d
	movq	15664(%rsp), %rcx
	call	WriteFile@PLT
	testl	%eax, %eax
	je	.L32
	movl	104(%rsp), %eax
	testl	%eax, %eax
	je	.L32
	addl	%eax, %r12d
	movl	16(%rbx), %r8d
	cmpl	%r8d, %r12d
	jb	.L31
.L32:
	movl	16(%rbx), %eax
	movl	%eax, 92(%rsp)
	leaq	15664(%rsp), %rcx
	call	close_handle
	movl	$12008, %ecx
	call	local_alloc
	movq	%rax, %rsi
	movl	%edi, %ebp
	leaq	108(%rsp), %r15
	leaq	6112(%rsp), %r14
.L37:
	movl	$0, 108(%rsp)
	movq	$0, 32(%rsp)
	movq	%r15, %r9
	movl	$1024, %r8d
	movq	%r14, %rdx
	movq	15656(%rsp), %rcx
	call	ReadFile@PLT
	testl	%eax, %eax
	je	.L33
	cmpl	$0, 108(%rsp)
	je	.L33
	movl	%edi, %eax
	jmp	.L36
.L74:
	movl	%r8d, %r12d
	jmp	.L32
.L30:
	movl	$125, %edx
	movq	15696(%rsp), %rcx
	call	TerminateProcess@PLT
	movl	$15000, %edx
	movq	15696(%rsp), %rcx
	call	WaitForSingleObject@PLT
	movq	%r13, %rsi
	movl	$6, %edi
	jmp	.L25
.L34:
	testq	%rsi, %rsi
	je	.L35
	movl	$1, (%rsi)
.L35:
	addl	$1, %eax
	cmpl	108(%rsp), %eax
	jnb	.L37
.L36:
	cmpl	$5999, %ebp
	ja	.L34
	movl	%ebp, %edx
	movl	%eax, %ecx
	movzbl	6112(%rsp,%rcx), %ecx
	movb	%cl, 112(%rsp,%rdx)
	leal	1(%rbp), %ebp
	jmp	.L35
.L33:
	movl	$-1, %edx
	movq	%r13, %rcx
	call	WaitForSingleObject@PLT
	leaq	15640(%rsp), %rcx
	call	close_handle
	movl	15688(%rsp), %eax
	movl	$5, %edi
	testl	%eax, %eax
	jne	.L38
	movl	15692(%rsp), %eax
	cmpl	%r12d, 92(%rsp)
	jne	.L57
	testl	%eax, %eax
	je	.L75
.L57:
	movl	$6, %edi
.L38:
	testq	%rsi, %rsi
	je	.L25
	testl	%ebp, %ebp
	jne	.L76
.L39:
	movl	$0, %eax
.L40:
	cltq
	movw	$0, 4(%rsi,%rax,2)
	jmp	.L25
.L75:
	leaq	100(%rsp), %rdx
	movq	15696(%rsp), %rcx
	call	GetExitCodeProcess@PLT
	movl	$6, %edi
	testl	%eax, %eax
	je	.L38
	cmpl	$1, 100(%rsp)
	sbbl	%edi, %edi
	addl	$2, %edi
	jmp	.L38
.L76:
	movl	$6000, 40(%rsp)
	leaq	4(%rsi), %rax
	movq	%rax, 32(%rsp)
	movl	%ebp, %r9d
	leaq	112(%rsp), %r8
	movl	$0, %edx
	movl	$65001, %ecx
	call	MultiByteToWideChar@PLT
	cmpl	$6000, %eax
	ja	.L39
	testl	%eax, %eax
	je	.L40
	leaq	4(%rsi), %rdx
	leal	-1(%rax), %ecx
	leaq	6(%rsi,%rcx,2), %rcx
	jmp	.L42
.L41:
	addq	$2, %rdx
	cmpq	%rcx, %rdx
	je	.L40
.L42:
	cmpw	$0, (%rdx)
	jne	.L41
	movw	$32, (%rdx)
	jmp	.L41
.L67:
	movl	$3, %edi
	movl	$0, %esi
.L25:
	leaq	15640(%rsp), %rcx
	call	close_handle
	leaq	15672(%rsp), %rcx
	call	close_handle
	leaq	15664(%rsp), %rcx
	call	close_handle
	leaq	15656(%rsp), %rcx
	call	close_handle
	leaq	15648(%rsp), %rcx
	call	close_handle
	leaq	15696(%rsp), %rbp
	leaq	15704(%rsp), %rcx
	call	close_handle
	movq	%rbp, %rcx
	call	close_handle
	movq	8(%rbx), %rcx
	call	local_free
	movq	(%rbx), %rcx
	movq	%rsi, %r9
	movl	%edi, %r8d
	movl	$32773, %edx
	call	PostMessageW@PLT
	testl	%eax, %eax
	je	.L77
.L43:
	movq	%rbx, %rcx
	call	local_free
	movl	$0, %eax
	addq	$15880, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L46:
	movl	$3, %edi
	movl	$0, %esi
	jmp	.L25
.L47:
	movl	$3, %edi
	movl	$0, %esi
	jmp	.L25
.L77:
	movq	%rsi, %rcx
	call	local_free
	jmp	.L43
	.size	local_worker, .-local_worker
	.globl	localrun_start
	.type	localrun_start, @function
localrun_start:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	movq	%rcx, %rbp
	movq	%rdx, %rsi
	movl	%r8d, %edi
	movq	%rdx, %rcx
	call	GetWindowTextLengthW@PLT
	movl	%eax, %ebx
	movl	$0, %eax
	cmpl	$524288, %ebx
	jbe	.L89
.L78:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L89:
	movslq	%ebx, %rax
	leaq	2(%rax,%rax), %rcx
	call	local_alloc
	movq	%rax, %r12
	movl	$0, %eax
	testq	%r12, %r12
	je	.L78
	leal	1(%rbx), %r8d
	movq	%r12, %rdx
	movq	%rsi, %rcx
	call	GetWindowTextW@PLT
	movl	%eax, %ebx
	movl	%eax, %r13d
	testl	%eax, %eax
	jne	.L90
.L80:
	movl	$24, %ecx
	call	local_alloc
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L91
	movslq	%r13d, %rcx
	addq	$1, %rcx
	call	local_alloc
	movq	%rax, 8(%rsi)
	testq	%rax, %rax
	je	.L92
	testl	%r13d, %r13d
	je	.L83
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	%r13d, 40(%rsp)
	movq	%rax, 32(%rsp)
	movl	%ebx, %r9d
	movq	%r12, %r8
	movl	$128, %edx
	movl	$65001, %ecx
	call	WideCharToMultiByte@PLT
	cmpl	%r13d, %eax
	jne	.L93
.L83:
	movq	%r12, %rcx
	call	local_free
	movq	%rbp, (%rsi)
	movl	%r13d, 16(%rsi)
	movl	%edi, 20(%rsi)
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movq	%rsi, %r9
	leaq	local_worker(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	CreateThread@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L94
	call	CloseHandle@PLT
	movl	$1, %eax
	jmp	.L78
.L90:
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	%eax, %r9d
	movq	%r12, %r8
	movl	$128, %edx
	movl	$65001, %ecx
	call	WideCharToMultiByte@PLT
	movl	%eax, %r13d
	testl	%eax, %eax
	jg	.L80
	movq	%r12, %rcx
	call	local_free
	movl	$0, %eax
	jmp	.L78
.L91:
	movq	%r12, %rcx
	call	local_free
	movl	$0, %eax
	jmp	.L78
.L92:
	movq	%r12, %rcx
	call	local_free
	movq	%rsi, %rcx
	call	local_free
	movl	$0, %eax
	jmp	.L78
.L93:
	movq	%r12, %rcx
	call	local_free
	movq	8(%rsi), %rcx
	call	local_free
	movq	%rsi, %rcx
	call	local_free
	movl	$0, %eax
	jmp	.L78
.L94:
	movq	8(%rsi), %rcx
	call	local_free
	movq	%rsi, %rcx
	call	local_free
	movl	$0, %eax
	jmp	.L78
	.size	localrun_start, .-localrun_start
	.section	.note.GNU-stack,"",@progbits
