.globl vm_join
.globl vm_copy_tree
.globl vm_directory
.globl vm_marker
.globl vm_exe
.globl version_worker_prepare
.globl vm_equal
.globl vm_dll
.globl vm_ensure_directory
.globl vm_len
.globl vm_copy
.globl vm_version
.globl vm_remove_tree
.globl vm_number
.globl vm_marker_data
.globl vm_cat
.globl version_worker_launch
.globl vm_valid_install
.globl vm_regular
.globl vm_paths
.globl __const_versionmgr_LC4
.globl __const_versionmgr_LC0
.globl __const_versionmgr_LC3
.globl __const_versionmgr_LC6
.globl __const_versionmgr_LC1
.globl __const_versionmgr_LC5
.globl __const_versionmgr_LC2
	.file	"versionmgr.c"
	.text
	.type	vm_len, @function
vm_len:
	cmpw	$0, (%rcx)
	je	.L4
	movl	$1, %eax
.L3:
	movl	%eax, %r9d
	cmpw	$0, (%rcx,%rax,2)
	setne	%r8b
	cmpl	$1023, %eax
	setbe	%dl
	addq	$1, %rax
	testb	%dl, %r8b
	jne	.L3
.L1:
	movl	%r9d, %eax
	ret
.L4:
	movl	$0, %r9d
	jmp	.L1
	.size	vm_len, .-vm_len
	.type	vm_copy, @function
vm_copy:
	movzwl	(%rdx), %r8d
	movl	$0, %eax
	testw	%r8w, %r8w
	je	.L8
.L7:
	movw	%r8w, (%rcx,%rax)
	addq	$2, %rax
	movzwl	(%rdx,%rax), %r8d
	testw	%r8w, %r8w
	je	.L8
	cmpq	$2046, %rax
	jne	.L7
	movl	$0, %eax
	ret
.L8:
	movw	$0, (%rcx,%rax)
	movl	$1, %eax
	ret
	.size	vm_copy, .-vm_copy
	.type	vm_cat, @function
vm_cat:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movq	%rdx, %rbx
	call	vm_len
	movl	$0, %edx
	cmpl	$1023, %eax
	ja	.L14
	movzwl	(%rbx), %ecx
	testw	%cx, %cx
	je	.L16
	leal	1(%rax), %edx
	cmpl	$1023, %edx
	ja	.L20
	movl	$1024, %r8d
	subl	%eax, %r8d
	movl	%eax, %edx
	leaq	(%rsi,%rdx,2), %r9
	movl	$1, %edx
.L17:
	movw	%cx, -2(%r9,%rdx,2)
	movzwl	(%rbx,%rdx,2), %ecx
	testw	%cx, %cx
	je	.L23
	addq	$1, %rdx
	cmpq	%r8, %rdx
	jne	.L17
	movl	$0, %edx
	jmp	.L14
.L23:
	addl	%edx, %eax
.L16:
	movl	%eax, %eax
	movw	$0, (%rsi,%rax,2)
	movl	$1, %edx
.L14:
	movl	%edx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L20:
	movl	$0, %edx
	jmp	.L14
	.size	vm_cat, .-vm_cat
	.section	.rodata.str2.2,"aMS",@progbits,2
	.align 2
__const_versionmgr_LC0:
	.string	"\\"
	.string	""
	.string	""
	.text
	.type	vm_join, @function
vm_join:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rbx
	movq	%r8, %rsi
	call	vm_copy
	testl	%eax, %eax
	je	.L24
	movq	%rbx, %rcx
	call	vm_len
	testl	%eax, %eax
	je	.L26
	leal	-1(%rax), %eax
	cmpw	$92, (%rbx,%rax,2)
	jne	.L28
.L26:
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	vm_cat
	testl	%eax, %eax
	je	.L24
	movq	%rbx, %rcx
	call	vm_len
	cmpl	$247, %eax
	setbe	%al
	movzbl	%al, %eax
.L24:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L28:
	leaq	__const_versionmgr_LC0(%rip), %rdx
	movq	%rbx, %rcx
	call	vm_cat
	testl	%eax, %eax
	jne	.L26
	jmp	.L24
	.size	vm_join, .-vm_join
	.type	vm_number, @function
vm_number:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %r11
	movl	$1, %ecx
	movl	$3435973837, %ebx
.L30:
	movl	%ecx, %r10d
	movl	%edx, %eax
	imulq	%rbx, %rax
	shrq	$35, %rax
	leal	(%rax,%rax,4), %r9d
	addl	%r9d, %r9d
	movl	%edx, %r8d
	subl	%r9d, %r8d
	addl	$48, %r8d
	movw	%r8w, -2(%rsp,%rcx,2)
	movl	%edx, %r8d
	movl	%eax, %edx
	movq	%rcx, %r9
	addq	$1, %rcx
	cmpl	$9, %r8d
	jbe	.L33
	cmpl	$11, %r10d
	jbe	.L30
.L33:
	movq	%rsp, %r8
	leal	-1(%r10), %eax
	leaq	(%r8,%rax,2), %rax
	movq	%r11, %rdx
.L32:
	movzwl	(%rax), %ecx
	movw	%cx, (%rdx)
	movq	%rax, %rcx
	subq	$2, %rax
	addq	$2, %rdx
	cmpq	%r8, %rcx
	jne	.L32
	movl	%r9d, %r9d
	movw	$0, (%r11,%r9,2)
	movl	%r10d, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.size	vm_number, .-vm_number
	.type	vm_directory, @function
vm_directory:
	subq	$40, %rsp
	call	GetFileAttributesW@PLT
	movl	$0, %edx
	cmpl	$-1, %eax
	je	.L37
	andl	$1040, %eax
	cmpl	$16, %eax
	sete	%dl
	movzbl	%dl, %edx
.L37:
	movl	%edx, %eax
	addq	$40, %rsp
	ret
	.size	vm_directory, .-vm_directory
	.type	vm_regular, @function
vm_regular:
	subq	$40, %rsp
	call	GetFileAttributesW@PLT
	movl	$0, %edx
	cmpl	$-1, %eax
	je	.L41
	testl	$1040, %eax
	sete	%dl
	movzbl	%dl, %edx
.L41:
	movl	%edx, %eax
	addq	$40, %rsp
	ret
	.size	vm_regular, .-vm_regular
	.type	vm_ensure_directory, @function
vm_ensure_directory:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	$0, %edx
	call	CreateDirectoryW@PLT
	movl	$1, %ebx
	testl	%eax, %eax
	je	.L49
.L45:
	movl	%ebx, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L49:
	movl	%eax, %ebx
	call	GetLastError@PLT
	cmpl	$183, %eax
	jne	.L45
	movq	%rsi, %rcx
	call	vm_directory
	testl	%eax, %eax
	setne	%bl
	movzbl	%bl, %ebx
	jmp	.L45
	.size	vm_ensure_directory, .-vm_ensure_directory
	.section	.rodata.str2.2
	.align 2
__const_versionmgr_LC1:
	.string	"L"
	.string	"O"
	.string	"C"
	.string	"A"
	.string	"L"
	.string	"A"
	.string	"P"
	.string	"P"
	.string	"D"
	.string	"A"
	.string	"T"
	.string	"A"
	.string	""
	.string	""
	.align 2
__const_versionmgr_LC2:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	""
	.string	""
	.align 2
__const_versionmgr_LC3:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"i"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	""
	.string	""
	.text
	.type	vm_paths, @function
vm_paths:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$2080, %rsp
	movq	%rcx, %rdi
	movq	%rdx, %rbx
	movq	%r8, %rsi
	leaq	32(%rsp), %rdx
	movl	$1024, %r8d
	leaq	__const_versionmgr_LC1(%rip), %rcx
	call	GetEnvironmentVariableW@PLT
	leal	-1(%rax), %edx
	movl	$0, %eax
	cmpl	$1022, %edx
	jbe	.L54
.L50:
	addq	$2080, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L54:
	leaq	32(%rsp), %rcx
	call	vm_directory
	testl	%eax, %eax
	je	.L50
	leaq	32(%rsp), %rdx
	leaq	__const_versionmgr_LC2(%rip), %r8
	movq	%rdi, %rcx
	call	vm_join
	testl	%eax, %eax
	je	.L50
	leaq	__const_versionmgr_LC3(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	vm_join
	testl	%eax, %eax
	je	.L50
	leaq	vm_version(%rip), %r8
	movq	%rbx, %rdx
	movq	%rsi, %rcx
	call	vm_join
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L50
	.size	vm_paths, .-vm_paths
	.type	vm_valid_install, @function
vm_valid_install:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$2176, %rsp
	movq	%rcx, %rsi
	movl	$0, 76(%rsp)
	call	vm_directory
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L65
.L55:
	movl	%ebx, %eax
	addq	$2176, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L65:
	leaq	128(%rsp), %rcx
	leaq	vm_marker(%rip), %r8
	movq	%rsi, %rdx
	call	vm_join
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L55
	leaq	128(%rsp), %rcx
	call	vm_regular
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L55
	leaq	128(%rsp), %rcx
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$3, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$-2147483648, %edx
	call	CreateFileW@PLT
	movq	%rax, %rdi
	movl	$0, %ebx
	cmpq	$-1, %rax
	je	.L55
	leaq	80(%rsp), %rdx
	movq	$0, 32(%rsp)
	leaq	76(%rsp), %r9
	movl	$46, %r8d
	movq	%rax, %rcx
	call	ReadFile@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L66
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	movl	$0, %ebx
	cmpl	$45, 76(%rsp)
	jne	.L55
	movl	$0, %eax
	leaq	vm_marker_data(%rip), %rdx
.L58:
	movzbl	(%rdx,%rax), %edi
	cmpb	%dil, 80(%rsp,%rax)
	jne	.L61
	addq	$1, %rax
	cmpq	$45, %rax
	jne	.L58
	leaq	128(%rsp), %rcx
	leaq	vm_dll(%rip), %r8
	movq	%rsi, %rdx
	call	vm_join
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L55
	leaq	128(%rsp), %rcx
	call	vm_regular
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L55
	leaq	128(%rsp), %rcx
	call	axiom_hash_known_library
	movl	$0, %ebx
	cmpl	$1, %eax
	jne	.L55
	leaq	128(%rsp), %rcx
	leaq	vm_exe(%rip), %r8
	movq	%rsi, %rdx
	call	vm_join
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L55
	leaq	128(%rsp), %rcx
	call	vm_regular
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L55
	leaq	128(%rsp), %rcx
	call	axiom_hash_known_client
	cmpl	$1, %eax
	sete	%bl
	movzbl	%bl, %ebx
	jmp	.L55
.L66:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	jmp	.L55
.L61:
	movl	$0, %ebx
	jmp	.L55
	.size	vm_valid_install, .-vm_valid_install
	.section	.rodata.str2.2
	.align 2
__const_versionmgr_LC4:
	.string	"*"
	.string	""
	.string	""
	.text
	.type	vm_copy_tree, @function
vm_copy_tree:
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
	subq	$2680, %rsp
	movq	%r9, %rsi
	cmpl	$32, %r8d
	jbe	.L68
	movl	$12, 16(%r9)
	movl	$0, %ebx
.L67:
	movl	%ebx, %eax
	addq	$6776, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L68:
	movq	%rcx, %rdi
	movq	%rdx, %r12
	movl	%r8d, %ebp
	leaq	4720(%rsp), %rcx
	leaq	__const_versionmgr_LC4(%rip), %r8
	movq	%rdi, %rdx
	call	vm_join
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L70
	movl	$9, 16(%rsi)
	jmp	.L67
.L70:
	leaq	32(%rsp), %rdx
	leaq	4720(%rsp), %rcx
	call	FindFirstFileW@PLT
	movq	%rax, %r14
	leaq	76(%rsp), %r15
	leaq	2672(%rsp), %r13
	cmpq	$-1, %rax
	jne	.L71
	call	GetLastError@PLT
	movl	$1, %ebx
	cmpl	$2, %eax
	je	.L67
	movl	$10, 16(%rsi)
	movl	$0, %ebx
	jmp	.L67
.L91:
	movzwl	78(%rsp), %eax
	testw	%ax, %ax
	je	.L73
	cmpw	$46, %ax
	jne	.L72
	cmpw	$0, 80(%rsp)
	je	.L73
	jmp	.L72
.L74:
	movl	$9, 16(%rsi)
.L76:
	movq	%r14, %rcx
	call	FindClose@PLT
	movl	$0, %ebx
	jmp	.L67
.L92:
	movl	$10, 16(%rsi)
	jmp	.L76
.L93:
	movl	$11, 16(%rsi)
	jmp	.L76
.L94:
	leaq	624(%rsp), %rcx
	movl	$0, %edx
	call	CreateDirectoryW@PLT
	testl	%eax, %eax
	je	.L89
	leaq	624(%rsp), %rdx
	movq	%rsi, %r9
	leal	1(%rbp), %r8d
	movq	%r13, %rcx
	call	vm_copy_tree
	testl	%eax, %eax
	je	.L76
.L73:
	leaq	32(%rsp), %rdx
	movq	%r14, %rcx
	call	FindNextFileW@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.L90
.L71:
	cmpw	$46, 76(%rsp)
	je	.L91
.L72:
	movq	%r15, %r8
	movq	%rdi, %rdx
	movq	%r13, %rcx
	call	vm_join
	testl	%eax, %eax
	je	.L74
	leaq	624(%rsp), %rcx
	movq	%r15, %r8
	movq	%r12, %rdx
	call	vm_join
	testl	%eax, %eax
	je	.L74
	movq	%r13, %rcx
	call	GetFileAttributesW@PLT
	cmpl	$-1, %eax
	je	.L92
	testb	$4, %ah
	jne	.L93
	testb	$16, %al
	jne	.L94
	movl	60(%rsp), %ebx
	salq	$32, %rbx
	movl	64(%rsp), %eax
	orq	%rax, %rbx
	movl	(%rsi), %eax
	addl	$1, %eax
	movl	%eax, (%rsi)
	cmpl	$50000, %eax
	ja	.L81
	movabsq	$8589934592, %rax
	subq	8(%rsi), %rax
	cmpq	%rbx, %rax
	jb	.L81
	leaq	624(%rsp), %rdx
	movl	$1, %r8d
	movq	%r13, %rcx
	call	CopyFileW@PLT
	testl	%eax, %eax
	je	.L95
	addq	%rbx, 8(%rsi)
	jmp	.L73
.L89:
	movl	$10, 16(%rsi)
	jmp	.L76
.L81:
	movl	$12, 16(%rsi)
	jmp	.L76
.L95:
	movl	$10, 16(%rsi)
	jmp	.L76
.L90:
	call	GetLastError@PLT
	movl	%eax, %edi
	movq	%r14, %rcx
	call	FindClose@PLT
	cmpl	$18, %edi
	je	.L85
	movl	$10, 16(%rsi)
	jmp	.L67
.L85:
	movl	$1, %ebx
	jmp	.L67
	.size	vm_copy_tree, .-vm_copy_tree
	.type	vm_remove_tree, @function
vm_remove_tree:
	cmpl	$32, %edx
	jbe	.L114
	ret
.L114:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$632, %rsp
	movq	%rcx, %rsi
	movl	%edx, %ebx
	call	GetFileAttributesW@PLT
	cmpl	$-1, %eax
	je	.L96
	testb	$4, %ah
	jne	.L115
	testb	$16, %al
	jne	.L116
.L96:
	addq	$4728, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L115:
	testb	$16, %al
	je	.L99
	movq	%rsi, %rcx
	call	RemoveDirectoryW@PLT
	jmp	.L96
.L99:
	movq	%rsi, %rcx
	call	DeleteFileW@PLT
	jmp	.L96
.L116:
	leaq	2672(%rsp), %rcx
	leaq	__const_versionmgr_LC4(%rip), %r8
	movq	%rsi, %rdx
	call	vm_join
	testl	%eax, %eax
	je	.L96
	leaq	32(%rsp), %rdx
	leaq	2672(%rsp), %rcx
	call	FindFirstFileW@PLT
	movq	%rax, %rdi
	cmpq	$-1, %rax
	je	.L100
	leaq	76(%rsp), %r13
	leaq	624(%rsp), %r12
	leaq	32(%rsp), %rbp
	jmp	.L107
.L118:
	movzwl	78(%rsp), %eax
	testw	%ax, %ax
	je	.L102
	cmpw	$46, %ax
	jne	.L101
	cmpw	$0, 80(%rsp)
	je	.L102
	jmp	.L101
.L119:
	leal	1(%rbx), %edx
	leaq	624(%rsp), %rcx
	call	vm_remove_tree
	jmp	.L102
.L120:
	leaq	624(%rsp), %rcx
	call	RemoveDirectoryW@PLT
	jmp	.L102
.L105:
	leaq	624(%rsp), %rcx
	call	DeleteFileW@PLT
.L102:
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	FindNextFileW@PLT
	testl	%eax, %eax
	je	.L117
.L107:
	cmpw	$46, 76(%rsp)
	je	.L118
.L101:
	movq	%r13, %r8
	movq	%rsi, %rdx
	movq	%r12, %rcx
	call	vm_join
	testl	%eax, %eax
	je	.L102
	movq	%r12, %rcx
	call	GetFileAttributesW@PLT
	cmpl	$-1, %eax
	je	.L102
	movl	%eax, %edx
	andl	$1040, %edx
	cmpl	$16, %edx
	je	.L119
	testb	$16, %al
	jne	.L120
	movl	%eax, %edx
	andl	$1025, %edx
	cmpl	$1, %edx
	jne	.L105
	andl	$-2, %eax
	movl	%eax, %edx
	movl	$128, %eax
	cmove	%eax, %edx
	leaq	624(%rsp), %rcx
	call	SetFileAttributesW@PLT
	jmp	.L105
.L117:
	movq	%rdi, %rcx
	call	FindClose@PLT
.L100:
	movq	%rsi, %rcx
	call	RemoveDirectoryW@PLT
	jmp	.L96
	.size	vm_remove_tree, .-vm_remove_tree
	.type	vm_equal, @function
vm_equal:
.L122:
	movzwl	(%rcx), %eax
	testw	%ax, %ax
	je	.L126
	movzwl	(%rdx), %r8d
	testw	%r8w, %r8w
	je	.L129
	addq	$2, %rcx
	movzwl	%ax, %eax
	leal	-65(%rax), %r10d
	leal	32(%rax), %r9d
	cmpl	$26, %r10d
	cmovb	%r9d, %eax
	addq	$2, %rdx
	movzwl	%r8w, %r8d
	leal	-65(%r8), %r10d
	leal	32(%r8), %r9d
	cmpl	$26, %r10d
	cmovb	%r9d, %r8d
	cmpl	%eax, %r8d
	je	.L122
	movl	$0, %eax
	ret
.L129:
	movl	$0, %eax
	ret
.L126:
	cmpw	$0, (%rdx)
	sete	%al
	movzbl	%al, %eax
	ret
	.size	vm_equal, .-vm_equal
	.section	.rodata.str2.2
	.align 2
__const_versionmgr_LC5:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"-"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"g"
	.string	"i"
	.string	"n"
	.string	"g"
	.string	"-"
	.string	""
	.string	""
	.align 2
__const_versionmgr_LC6:
	.string	"-"
	.string	""
	.string	""
	.text
	.globl	version_worker_prepare
	.hidden	version_worker_prepare
	.type	version_worker_prepare, @function
version_worker_prepare:
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
	subq	$272, %rsp
	movq	%rcx, %rbx
	leaq	2128(%rsp), %rcx
	movl	$24, %r8d
	movl	$0, %edx
	call	memset@PLT
	leaq	12560(%rsp), %rdx
	leaq	14608(%rsp), %rcx
	leaq	10512(%rsp), %r8
	call	vm_paths
	movl	$9, %esi
	testl	%eax, %eax
	jne	.L195
.L131:
	movl	$0, %r9d
	movl	%esi, %r8d
	movl	$32772, %edx
	movq	%rbx, %rcx
	call	PostMessageW@PLT
	movl	$0, %eax
	addq	$16656, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
.L195:
	leaq	14608(%rsp), %rcx
	call	vm_ensure_directory
	movl	$10, %esi
	testl	%eax, %eax
	je	.L131
	leaq	12560(%rsp), %rcx
	call	vm_ensure_directory
	testl	%eax, %eax
	je	.L131
	leaq	10512(%rsp), %rcx
	call	GetFileAttributesW@PLT
	cmpl	$-1, %eax
	je	.L132
	leaq	10512(%rsp), %rcx
	call	vm_valid_install
	cmpl	$1, %eax
	sbbl	%esi, %esi
	andl	$11, %esi
	addl	$2, %esi
	jmp	.L131
.L132:
	movl	$1024, 76(%rsp)
	movl	$0, %edx
	movl	$2, %ecx
	call	CreateToolhelp32Snapshot@PLT
	movq	%rax, %rdi
	cmpq	$-1, %rax
	je	.L159
	leaq	80(%rsp), %rsi
	movl	$568, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	memset@PLT
	movl	$568, 80(%rsp)
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	Process32FirstW@PLT
	testl	%eax, %eax
	je	.L134
	movl	$0, %r14d
	movl	$0, %esi
	leaq	124(%rsp), %r13
	leaq	vm_exe(%rip), %r12
	leaq	80(%rsp), %rbp
	jmp	.L136
.L135:
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	Process32NextW@PLT
	testl	%eax, %eax
	je	.L196
.L136:
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	vm_equal
	testl	%eax, %eax
	je	.L135
	movl	88(%rsp), %r14d
	addl	$1, %esi
	jmp	.L135
.L196:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	testl	%esi, %esi
	je	.L160
	cmpl	$1, %esi
	je	.L197
	movl	$5, %esi
	jmp	.L131
.L197:
	movl	%r14d, %r8d
	movl	$0, %edx
	movl	$4096, %ecx
	call	OpenProcess@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L162
	leaq	76(%rsp), %r9
	leaq	4368(%rsp), %r8
	movl	$0, %edx
	movq	%rax, %rcx
	call	QueryFullProcessImageNameW@PLT
	testl	%eax, %eax
	je	.L163
	movl	76(%rsp), %eax
	subl	$1, %eax
	cmpl	$246, %eax
	jbe	.L198
	movl	$9, %esi
.L137:
	movq	%rbp, %rcx
	call	CloseHandle@PLT
	jmp	.L131
.L198:
	leaq	4368(%rsp), %rcx
	call	vm_len
	movl	%eax, %edi
	jmp	.L138
.L166:
	movl	%edx, %edi
.L138:
	testl	%edi, %edi
	je	.L165
	leal	-1(%rdi), %edx
	movl	%edx, %eax
	movzwl	4368(%rsp,%rax,2), %eax
	cmpw	$47, %ax
	je	.L140
	cmpw	$92, %ax
	jne	.L166
.L140:
	movl	%edi, %eax
	leaq	4368(%rsp,%rax,2), %rcx
	leaq	vm_exe(%rip), %rdx
	call	vm_equal
	testl	%eax, %eax
	jne	.L199
	movl	$8, %esi
	jmp	.L137
.L199:
	leaq	4368(%rsp), %rdx
	leaq	6416(%rsp), %rcx
	call	vm_copy
	testl	%eax, %eax
	je	.L167
	cmpl	$3, %edi
	je	.L200
.L141:
	leal	-1(%rdi), %eax
	movw	$0, 6416(%rsp,%rax,2)
.L142:
	leaq	6416(%rsp), %rcx
	call	vm_directory
	testl	%eax, %eax
	jne	.L201
	movl	$8, %esi
	jmp	.L137
.L200:
	cmpw	$58, 6418(%rsp)
	jne	.L141
	movw	$0, 6422(%rsp)
	jmp	.L142
.L201:
	leaq	4368(%rsp), %rcx
	call	vm_regular
	testl	%eax, %eax
	jne	.L202
	movl	$8, %esi
	jmp	.L137
.L202:
	leaq	4368(%rsp), %rcx
	call	axiom_hash_known_client
	cmpl	$-3, %eax
	je	.L170
	testl	%eax, %eax
	js	.L171
	je	.L203
	movq	%rbp, %rcx
	call	CloseHandle@PLT
	leaq	6416(%rsp), %rdx
	leaq	2160(%rsp), %rcx
	leaq	vm_dll(%rip), %r8
	call	vm_join
	testl	%eax, %eax
	jne	.L204
	movl	$8, %esi
	jmp	.L131
.L204:
	leaq	2160(%rsp), %rcx
	call	vm_regular
	testl	%eax, %eax
	jne	.L205
	movl	$8, %esi
	jmp	.L131
.L205:
	leaq	2160(%rsp), %rcx
	call	axiom_hash_known_library
	cmpl	$-3, %eax
	je	.L174
	testl	%eax, %eax
	js	.L175
	je	.L176
	movl	$0, %r12d
	leaq	4240(%rsp), %rdi
	leaq	__const_versionmgr_LC5(%rip), %r14
	leaq	__const_versionmgr_LC6(%rip), %r13
.L145:
	movq	%r14, %rdx
	movq	%rdi, %rcx
	call	vm_copy
	call	GetCurrentProcessId@PLT
	movl	%eax, %edx
	leaq	4208(%rsp), %rbp
	movq	%rbp, %rcx
	call	vm_number
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	vm_cat
	movq	%r13, %rdx
	movq	%rdi, %rcx
	call	vm_cat
	movl	%r12d, %edx
	movq	%rbp, %rcx
	call	vm_number
	movq	%rbp, %rdx
	movq	%rdi, %rcx
	call	vm_cat
	leaq	12560(%rsp), %rdx
	leaq	8464(%rsp), %rcx
	movq	%rdi, %r8
	call	vm_join
	testl	%eax, %eax
	je	.L177
	leaq	8464(%rsp), %rcx
	movl	$0, %edx
	call	CreateDirectoryW@PLT
	testl	%eax, %eax
	jne	.L144
	call	GetLastError@PLT
	cmpl	$183, %eax
	jne	.L178
	addl	$1, %r12d
	cmpl	$32, %r12d
	jne	.L145
	movl	$10, %esi
	jmp	.L131
.L213:
	leaq	8464(%rsp), %rdx
	leaq	2160(%rsp), %rcx
	leaq	vm_exe(%rip), %r8
	call	vm_join
	testl	%eax, %eax
	jne	.L206
	movl	$10, %esi
	jmp	.L146
.L206:
	leaq	2160(%rsp), %rcx
	call	axiom_hash_known_client
	cmpl	$1, %eax
	je	.L207
	movl	$10, %esi
	jmp	.L146
.L207:
	leaq	8464(%rsp), %rdx
	leaq	2160(%rsp), %rcx
	leaq	vm_dll(%rip), %r8
	call	vm_join
	testl	%eax, %eax
	jne	.L208
	movl	$10, %esi
	jmp	.L146
.L208:
	leaq	2160(%rsp), %rcx
	call	vm_regular
	testl	%eax, %eax
	jne	.L209
	movl	$10, %esi
	jmp	.L146
.L209:
	leaq	2160(%rsp), %rcx
	call	axiom_hash_known_library
	cmpl	$1, %eax
	je	.L210
	movl	$10, %esi
	jmp	.L146
.L210:
	movl	$0, 76(%rsp)
	leaq	8464(%rsp), %rdx
	leaq	80(%rsp), %rcx
	leaq	vm_marker(%rip), %r8
	call	vm_join
	testl	%eax, %eax
	jne	.L211
.L147:
	movl	$10, %esi
	jmp	.L146
.L211:
	leaq	80(%rsp), %rcx
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$1, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1073741824, %edx
	call	CreateFileW@PLT
	movq	%rax, %rdi
	cmpq	$-1, %rax
	je	.L147
	movq	$0, 32(%rsp)
	leaq	76(%rsp), %r9
	movl	$45, %r8d
	leaq	vm_marker_data(%rip), %rdx
	movq	%rax, %rcx
	call	WriteFile@PLT
	testl	%eax, %eax
	je	.L148
	cmpl	$45, 76(%rsp)
	je	.L212
.L148:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
.L150:
	leaq	80(%rsp), %rcx
	call	DeleteFileW@PLT
	jmp	.L147
.L212:
	movq	%rdi, %rcx
	call	FlushFileBuffers@PLT
	movl	%eax, %ebp
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	testl	%ebp, %ebp
	je	.L150
	leaq	10512(%rsp), %rdx
	leaq	8464(%rsp), %rcx
	call	MoveFileW@PLT
	testl	%eax, %eax
	jne	.L131
	movl	$13, %esi
	jmp	.L146
.L174:
	movl	$16, %esi
	jmp	.L131
.L175:
	movl	$10, %esi
	jmp	.L131
.L176:
	movl	$7, %esi
	jmp	.L131
.L177:
	movl	$9, %esi
	jmp	.L131
.L178:
	movl	$10, %esi
	jmp	.L131
.L159:
	movl	$6, %esi
	jmp	.L131
.L160:
	movl	$4, %esi
	jmp	.L131
.L162:
	movl	$6, %esi
	jmp	.L131
.L134:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	movl	$4, %esi
	jmp	.L131
.L144:
	leaq	8464(%rsp), %rdx
	leaq	6416(%rsp), %rcx
	leaq	2128(%rsp), %r9
	movl	$0, %r8d
	call	vm_copy_tree
	testl	%eax, %eax
	jne	.L213
	movl	2144(%rsp), %esi
.L146:
	leaq	8464(%rsp), %rcx
	movl	$0, %edx
	call	vm_remove_tree
	jmp	.L131
.L163:
	movl	$9, %esi
	jmp	.L137
.L165:
	movl	$8, %esi
	jmp	.L137
.L167:
	movl	$8, %esi
	jmp	.L137
.L170:
	movl	$16, %esi
	jmp	.L137
.L171:
	movl	$10, %esi
	jmp	.L137
.L203:
	movl	$7, %esi
	jmp	.L137
	.size	version_worker_prepare, .-version_worker_prepare
	.globl	version_worker_launch
	.hidden	version_worker_launch
	.type	version_worker_launch, @function
version_worker_launch:
	pushq	%rsi
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$152, %rsp
	movq	%rcx, %rbx
	leaq	4240(%rsp), %rdx
	leaq	6288(%rsp), %rcx
	leaq	2192(%rsp), %r8
	call	vm_paths
	movl	$9, %r8d
	testl	%eax, %eax
	jne	.L224
.L215:
	movl	$0, %r9d
	andl	$15, %r8d
	movl	$32772, %edx
	movq	%rbx, %rcx
	call	PostMessageW@PLT
	movl	$0, %eax
	addq	$8344, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L224:
	leaq	6288(%rsp), %rcx
	call	vm_directory
	movl	$14, %r8d
	testl	%eax, %eax
	je	.L215
	leaq	4240(%rsp), %rcx
	call	vm_directory
	movl	$14, %r8d
	testl	%eax, %eax
	je	.L215
	leaq	2192(%rsp), %rcx
	call	vm_valid_install
	movl	$14, %r8d
	testl	%eax, %eax
	je	.L215
	leaq	2192(%rsp), %rdx
	leaq	144(%rsp), %rcx
	leaq	vm_exe(%rip), %r8
	call	vm_join
	movl	$9, %r8d
	testl	%eax, %eax
	je	.L215
	leaq	32(%rsp), %rsi
	movl	$112, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	memset@PLT
	movl	$112, 32(%rsp)
	movl	$64, 36(%rsp)
	movq	%rbx, 40(%rsp)
	leaq	144(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	2192(%rsp), %rax
	movq	%rax, 72(%rsp)
	movl	$1, 80(%rsp)
	movq	%rsi, %rcx
	call	ShellExecuteExW@PLT
	movl	$15, %r8d
	testl	%eax, %eax
	je	.L215
	movq	136(%rsp), %rcx
	movl	$3, %r8d
	testq	%rcx, %rcx
	je	.L215
	call	CloseHandle@PLT
	movl	$3, %r8d
	jmp	.L215
	.size	version_worker_launch, .-version_worker_launch
	.section	.rodata
	.align 32
	.type	vm_marker_data, @object
	.size	vm_marker_data, 46
vm_marker_data:
	.string	"AXIOM-CLIENT-COPY-1\nversion-5a21b87bbc2641cf\n"
	.align 32
	.type	vm_marker, @object
	.size	vm_marker, 46
vm_marker:
	.string	"."
	.string	"a"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"-"
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"-"
	.string	"c"
	.string	"o"
	.string	"m"
	.string	"p"
	.string	"l"
	.string	"e"
	.string	"t"
	.string	"e"
	.string	""
	.string	""
	.align 32
	.type	vm_dll, @object
	.size	vm_dll, 42
vm_dll:
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
	.string	"d"
	.string	"l"
	.string	"l"
	.string	""
	.string	""
	.align 32
	.type	vm_exe, @object
	.size	vm_exe, 42
vm_exe:
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
	.align 32
	.type	vm_version, @object
	.size	vm_version, 50
vm_version:
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"i"
	.string	"o"
	.string	"n"
	.string	"-"
	.string	"5"
	.string	"a"
	.string	"2"
	.string	"1"
	.string	"b"
	.string	"8"
	.string	"7"
	.string	"b"
	.string	"b"
	.string	"c"
	.string	"2"
	.string	"6"
	.string	"4"
	.string	"1"
	.string	"c"
	.string	"f"
	.string	""
	.string	""
	.hidden	axiom_hash_known_client
	.hidden	axiom_hash_known_library
	.section	.note.GNU-stack,"",@progbits
