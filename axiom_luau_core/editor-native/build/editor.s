.globl scan_clients
.globl set_status
.globl wcopy
.globl memcpy
.globl lastCount
.globl memset
.globl save_current
.globl axiom_relocation_anchor
.globl window_proc
.globl start_local
.globl log_line
.globl append_num
.globl update_gutter
.globl write_source
.globl release
.globl lastFirst
.globl lastVisible
.globl open_file
.globl install_event
.globl start_version_worker
.globl layout
.globl alloc
.globl can_discard
.globl control
.globl wappend
.globl start
.globl __const_editor_LC1
.globl __const_editor_LC4
.globl __const_editor_LC6
.globl __const_editor_LC5
.globl __const_editor_LC2
.globl __const_editor_LC9
.globl __const_editor_LC7
.globl __const_editor_LC8
.globl __const_editor_LC3
.globl __const_editor_LC0
.globl __const_editor_LC21
.globl __const_editor_LC76
.globl __const_editor_LC97
.globl __const_editor_LC57
.globl __const_editor_LC96
.globl __const_editor_LC94
.globl __const_editor_LC36
.globl __const_editor_LC52
.globl __const_editor_LC37
.globl __const_editor_LC19
.globl __const_editor_LC51
.globl __const_editor_LC32
.globl __const_editor_LC64
.globl __const_editor_LC98
.globl __const_editor_LC25
.globl __const_editor_LC90
.globl __const_editor_LC65
.globl __const_editor_LC54
.globl __const_editor_LC16
.globl __const_editor_LC79
.globl __const_editor_LC31
.globl __const_editor_LC12
.globl __const_editor_LC73
.globl __const_editor_LC87
.globl __const_editor_LC99
.globl __const_editor_LC69
.globl __const_editor_LC29
.globl __const_editor_LC17
.globl __const_editor_LC62
.globl __const_editor_LC38
.globl __const_editor_LC47
.globl __const_editor_LC84
.globl __const_editor_LC93
.globl __const_editor_LC66
.globl __const_editor_LC50
.globl __const_editor_LC92
.globl __const_editor_LC81
.globl __const_editor_LC85
.globl __const_editor_LC58
.globl __const_editor_LC77
.globl __const_editor_LC44
.globl __const_editor_LC49
.globl __const_editor_LC18
.globl __const_editor_LC72
.globl __const_editor_LC89
.globl __const_editor_LC22
.globl __const_editor_LC63
.globl __const_editor_LC60
.globl __const_editor_LC27
.globl __const_editor_LC75
.globl __const_editor_LC59
.globl __const_editor_LC68
.globl __const_editor_LC48
.globl __const_editor_LC33
.globl __const_editor_LC26
.globl __const_editor_LC82
.globl __const_editor_LC46
.globl __const_editor_LC67
.globl __const_editor_LC15
.globl __const_editor_LC86
.globl __const_editor_LC88
.globl __const_editor_LC53
.globl __const_editor_LC28
.globl __const_editor_LC56
.globl __const_editor_LC42
.globl __const_editor_LC41
.globl __const_editor_LC10
.globl __const_editor_LC83
.globl __const_editor_LC55
.globl __const_editor_LC95
.globl __const_editor_LC91
.globl __const_editor_LC20
.globl __const_editor_LC23
.globl __const_editor_LC80
.globl __const_editor_LC78
.globl __const_editor_LC61
.globl __const_editor_LC34
.globl __const_editor_LC74
.globl __const_editor_LC43
.globl __const_editor_LC71
.globl __const_editor_LC35
.globl __const_editor_LC70
.globl __const_editor_LC14
.globl __const_editor_LC11
.globl __const_editor_LC45
.globl __const_editor_LC24
.globl __const_editor_LC39
.globl __const_editor_LC13
.globl __const_editor_LC30
.globl __const_editor_LC40
.globl __const_editor_LC107
.globl __const_editor_LC117
.globl __const_editor_LC147
.globl __const_editor_LC120
.globl __const_editor_LC142
.globl __const_editor_LC172
.globl __const_editor_LC112
.globl __const_editor_LC168
.globl __const_editor_LC150
.globl __const_editor_LC140
.globl __const_editor_LC105
.globl __const_editor_LC100
.globl __const_editor_LC131
.globl __const_editor_LC148
.globl __const_editor_LC123
.globl __const_editor_LC110
.globl __const_editor_LC125
.globl __const_editor_LC113
.globl __const_editor_LC159
.globl __const_editor_LC134
.globl __const_editor_LC153
.globl __const_editor_LC119
.globl __const_editor_LC161
.globl __const_editor_LC114
.globl __const_editor_LC149
.globl __const_editor_LC152
.globl __const_editor_LC121
.globl __const_editor_LC156
.globl __const_editor_LC165
.globl __const_editor_LC174
.globl __const_editor_LC144
.globl __const_editor_LC141
.globl __const_editor_LC122
.globl __const_editor_LC104
.globl __const_editor_LC164
.globl __const_editor_LC103
.globl __const_editor_LC139
.globl __const_editor_LC135
.globl __const_editor_LC167
.globl __const_editor_LC133
.globl __const_editor_LC126
.globl __const_editor_LC116
.globl __const_editor_LC157
.globl __const_editor_LC171
.globl __const_editor_LC166
.globl __const_editor_LC124
.globl __const_editor_LC118
.globl __const_editor_LC145
.globl __const_editor_LC106
.globl __const_editor_LC176
.globl __const_editor_LC101
.globl __const_editor_LC169
.globl __const_editor_LC143
.globl __const_editor_LC162
.globl __const_editor_LC108
.globl __const_editor_LC129
.globl __const_editor_LC158
.globl __const_editor_LC138
.globl __const_editor_LC136
.globl __const_editor_LC155
.globl __const_editor_LC102
.globl __const_editor_LC154
.globl __const_editor_LC127
.globl __const_editor_LC115
.globl __const_editor_LC130
.globl __const_editor_LC160
.globl __const_editor_LC132
.globl __const_editor_LC163
.globl __const_editor_LC111
.globl __const_editor_LC170
.globl __const_editor_LC151
.globl __const_editor_LC137
.globl __const_editor_LC146
.globl __const_editor_LC173
.globl __const_editor_LC128
.globl __const_editor_LC109
.globl __const_editor_LC175
	.file	"editor.c"
	.text
	.type	wcopy, @function
wcopy:
	movl	%r8d, %r11d
	testl	%r8d, %r8d
	je	.L1
	movzwl	(%rdx), %r9d
	testw	%r9w, %r9w
	je	.L6
	cmpl	$1, %r8d
	jbe	.L7
	movl	$1, %r11d
	movl	$0, %eax
	jmp	.L4
.L8:
	movl	%r10d, %r11d
.L4:
	movw	%r9w, (%rcx,%rax)
	addq	$2, %rax
	movzwl	(%rdx,%rax), %r9d
	testw	%r9w, %r9w
	je	.L3
	leal	1(%r11), %r10d
	cmpl	%r10d, %r8d
	jne	.L8
.L3:
	movw	$0, (%rcx,%rax)
.L1:
	movl	%r11d, %eax
	ret
.L6:
	movl	$0, %r11d
	movl	$0, %eax
	jmp	.L3
.L7:
	movl	$0, %r11d
	movl	$0, %eax
	jmp	.L3
	.size	wcopy, .-wcopy
	.type	wappend, @function
wappend:
	movq	%rcx, %r11
	movzwl	(%r9), %ecx
	testw	%cx, %cx
	je	.L12
	leal	1(%rdx), %eax
	cmpl	%r8d, %eax
	jnb	.L13
	movl	$0, %edx
	jmp	.L11
.L14:
	movl	%r10d, %eax
.L11:
	addl	$1, %edx
	leal	-1(%rax), %r10d
	movw	%cx, (%r11,%r10,2)
	movl	%edx, %ecx
	movzwl	(%r9,%rcx,2), %ecx
	testw	%cx, %cx
	je	.L10
	leal	1(%rax), %r10d
	cmpl	%r8d, %r10d
	jb	.L14
.L10:
	movl	%eax, %edx
	movw	$0, (%r11,%rdx,2)
	ret
.L12:
	movl	%edx, %eax
	jmp	.L10
.L13:
	movl	%edx, %eax
	jmp	.L10
	.size	wappend, .-wappend
	.type	append_num, @function
append_num:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %r11
	movl	%edx, %ebx
	movl	$1, %edx
	movl	$3435973837, %edi
.L16:
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
	jbe	.L22
	cmpl	$15, %esi
	jbe	.L16
.L22:
	leal	1(%rbx), %ecx
	cmpl	%r8d, %ecx
	jnb	.L20
	movq	%rsp, %r10
	leal	-1(%rsi), %eax
	leaq	(%r10,%rax,2), %rdx
	jmp	.L19
.L21:
	movl	%eax, %ecx
.L19:
	leal	-1(%rcx), %eax
	movzwl	(%rdx), %r9d
	movw	%r9w, (%r11,%rax,2)
	cmpq	%r10, %rdx
	je	.L18
	leal	1(%rcx), %eax
	subq	$2, %rdx
	cmpl	%r8d, %eax
	jb	.L21
.L18:
	movl	%ecx, %eax
	movw	$0, (%r11,%rax,2)
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L20:
	movl	%ebx, %ecx
	jmp	.L18
	.size	append_num, .-append_num
	.type	control, @function
control:
	pushq	%rbx
	subq	$96, %rsp
	movq	$0, 88(%rsp)
	movq	module(%rip), %rax
	movq	%rax, 80(%rsp)
	movslq	144(%rsp), %rax
	movq	%rax, 72(%rsp)
	movq	%rcx, 64(%rsp)
	movl	$1, 56(%rsp)
	movl	$1, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	orl	$1342177280, %r9d
	movl	$0, %ecx
	call	CreateWindowExW@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L25
	movq	uiFont(%rip), %rdx
	movq	%rdx, %r8
	testq	%rdx, %rdx
	je	.L30
.L28:
	movl	$1, %r9d
	movl	$48, %edx
	movq	%rbx, %rcx
	call	SendMessageW@PLT
.L25:
	movq	%rbx, %rax
	addq	$96, %rsp
	popq	%rbx
	ret
.L30:
	movl	$17, %ecx
	call	GetStockObject@PLT
	movq	%rax, %r8
	jmp	.L28
	.size	control, .-control
	.section	.rodata.str2.2,"aMS",@progbits,2
	.align 2
__const_editor_LC0:
	.string	"\r"
	.string	"\n"
	.string	""
	.string	""
	.text
	.type	update_gutter, @function
update_gutter:
	movq	editor(%rip), %rcx
	testq	%rcx, %rcx
	je	.L40
	cmpq	$0, gutter(%rip)
	je	.L40
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
	subq	$40, %rsp
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$206, %edx
	call	SendMessageW@PLT
	movq	%rax, %rbx
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$186, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	movl	editorHeight(%rip), %edx
	movslq	%edx, %rdi
	imulq	$1808407283, %rdi, %rdi
	sarq	$35, %rdi
	sarl	$31, %edx
	subl	%edx, %edi
	addl	$2, %edi
	cmpl	%ebx, lastFirst(%rip)
	je	.L43
.L33:
	movl	%ebx, lastFirst(%rip)
	movl	%eax, lastCount(%rip)
	movl	%edi, lastVisible(%rip)
	movw	$0, 32(%rsp)
	testl	%edi, %edi
	je	.L34
	addl	$1, %ebx
	movl	%eax, %r13d
	cmpl	%ebx, %eax
	jb	.L34
	movl	$0, %esi
	movl	$0, %edx
	leaq	32(%rsp), %rbp
	leaq	__const_editor_LC0(%rip), %r12
.L35:
	movl	%ebx, %r9d
	movl	$4096, %r8d
	movq	%rbp, %rcx
	call	append_num
	movl	%eax, %edx
	movq	%r12, %r9
	movl	$4096, %r8d
	movq	%rbp, %rcx
	call	wappend
	movl	%eax, %edx
	addl	$1, %esi
	cmpl	%edi, %esi
	jnb	.L34
	cmpl	$99, %esi
	ja	.L34
	addl	$1, %ebx
	cmpl	%ebx, %r13d
	jnb	.L35
.L34:
	leaq	32(%rsp), %rdx
	movq	gutter(%rip), %rcx
	call	SetWindowTextW@PLT
.L31:
	addq	$8232, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L43:
	cmpl	%eax, lastCount(%rip)
	jne	.L33
	cmpl	%edi, lastVisible(%rip)
	jne	.L33
	jmp	.L31
.L40:
	ret
	.size	update_gutter, .-update_gutter
	.type	set_status, @function
set_status:
	subq	$40, %rsp
	movq	%rcx, %rdx
	movq	statusText(%rip), %rcx
	call	SetWindowTextW@PLT
	addq	$40, %rsp
	ret
	.size	set_status, .-set_status
	.type	release, @function
release:
	testq	%rcx, %rcx
	je	.L49
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
.L49:
	ret
	.size	release, .-release
	.type	log_line, @function
log_line:
	pushq	%rsi
	pushq	%rbx
	leaq	-16384(%rsp), %r11
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	subq	$40, %rsp
	movq	%rcx, %rbx
	leaq	32(%rsp), %rdx
	movl	$8192, %r8d
	movq	output(%rip), %rcx
	call	GetWindowTextW@PLT
	testl	%eax, %eax
	movl	$0, %edx
	cmovns	%eax, %edx
	cmpl	$7000, %edx
	jbe	.L53
	movw	$0, 32(%rsp)
	movl	$0, %edx
.L53:
	leaq	32(%rsp), %rsi
	movq	%rbx, %r9
	movl	$8192, %r8d
	movq	%rsi, %rcx
	call	wappend
	movl	%eax, %edx
	leaq	__const_editor_LC0(%rip), %r9
	movl	$8192, %r8d
	movq	%rsi, %rcx
	call	wappend
	movl	%eax, %ebx
	movq	%rsi, %rdx
	movq	output(%rip), %rcx
	call	SetWindowTextW@PLT
	movl	%ebx, %r8d
	movq	%r8, %r9
	movl	$177, %edx
	movq	output(%rip), %rcx
	call	SendMessageW@PLT
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$183, %edx
	movq	output(%rip), %rcx
	call	SendMessageW@PLT
	addq	$16424, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.size	log_line, .-log_line
	.section	.rodata.str2.8,"aMS",@progbits,2
	.align 8
__const_editor_LC1:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	"."
	.string	" "
	.string	"A"
	.string	"g"
	.string	"u"
	.string	"a"
	.string	"r"
	.string	"d"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC2:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"e"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC3:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"f"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"z"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	" "
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"q"
	.string	"u"
	.string	"e"
	.string	" "
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"n"
	.string	"o"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC4:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"r"
	.string	"e"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"n"
	.string	"o"
	.string	"u"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"d"
	.string	"i"
	.string	"g"
	.string	"o"
	.string	" "
	.string	"z"
	.string	"e"
	.string	"r"
	.string	"o"
	.string	";"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC5:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"b"
	.string	"a"
	.string	"i"
	.string	"x"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC6:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"n"
	.string	"l"
	.string	"o"
	.string	"a"
	.string	"d"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC7:
	.string	"A"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"v"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC8:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"s"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	":"
	.string	" "
	.string	"a"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"v"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"p"
	.string	"e"
	.string	"l"
	.string	"o"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC9:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC10:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC11:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	";"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"i"
	.string	"r"
	.string	"m"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC12:
	.string	"A"
	.string	"g"
	.string	"u"
	.string	"a"
	.string	"r"
	.string	"d"
	.string	"o"
	.string	"u"
	.string	"-"
	.string	"s"
	.string	"e"
	.string	" "
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	","
	.string	" "
	.string	"m"
	.string	"a"
	.string	"s"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"i"
	.string	"r"
	.string	"m"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC13:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"r"
	.string	"e"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"n"
	.string	"o"
	.string	"u"
	.string	" "
	.string	"e"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	":"
	.string	" "
	.string	""
	.string	""
	.align 8
__const_editor_LC14:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"i"
	.string	"u"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"m"
	.string	" "
	.string	"s"
	.string	"u"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.text
	.type	install_event, @function
install_event:
	pushq	%rsi
	pushq	%rbx
	subq	$296, %rsp
	cmpl	$1, %ecx
	je	.L65
	movl	%ecx, %ebx
	movl	%edx, %esi
	movl	$1, %edx
	movq	binstall(%rip), %rcx
	call	EnableWindow@PLT
	cmpl	$2, %ebx
	je	.L66
	cmpl	$3, %ebx
	je	.L67
	cmpl	$4, %ebx
	je	.L68
	cmpl	$5, %ebx
	je	.L69
	cmpl	$6, %ebx
	je	.L70
	leaq	32(%rsp), %rbx
	movl	$128, %r8d
	leaq	__const_editor_LC13(%rip), %rdx
	movq	%rbx, %rcx
	call	wcopy
	movl	%eax, %edx
	movl	%esi, %r9d
	movl	$128, %r8d
	movq	%rbx, %rcx
	call	append_num
	leaq	__const_editor_LC14(%rip), %rcx
	call	set_status
	movq	%rbx, %rcx
	call	log_line
.L55:
	addq	$296, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L65:
	leaq	__const_editor_LC1(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC2(%rip), %rcx
	call	log_line
	jmp	.L55
.L66:
	leaq	__const_editor_LC3(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC4(%rip), %rcx
	call	log_line
	jmp	.L55
.L67:
	leaq	__const_editor_LC5(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC6(%rip), %rcx
	call	log_line
	jmp	.L55
.L68:
	leaq	__const_editor_LC7(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC8(%rip), %rcx
	call	log_line
	jmp	.L55
.L69:
	leaq	__const_editor_LC9(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC10(%rip), %rcx
	call	log_line
	jmp	.L55
.L70:
	leaq	__const_editor_LC11(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC12(%rip), %rcx
	call	log_line
	jmp	.L55
	.size	install_event, .-install_event
	.type	alloc, @function
alloc:
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
	.size	alloc, .-alloc
	.section	.rodata.str2.2
	.align 2
__const_editor_LC15:
	.string	"."
	.string	"a"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"-"
	.string	"t"
	.string	"m"
	.string	"p"
	.string	"-"
	.string	""
	.string	""
	.align 2
__const_editor_LC16:
	.string	"-"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC17:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"g"
	.string	"r"
	.string	"a"
	.string	"v"
	.string	"a"
	.string	"r"
	.string	";"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"g"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"e"
	.string	"s"
	.string	"e"
	.string	"r"
	.string	"v"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC18:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"z"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"g"
	.string	"r"
	.string	"a"
	.string	"v"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC19:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"u"
	.string	"b"
	.string	"s"
	.string	"t"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	";"
	.string	" "
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"g"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"e"
	.string	"s"
	.string	"e"
	.string	"r"
	.string	"v"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC20:
	.string	"A"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"a"
	.string	"l"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"m"
	.string	" "
	.string	"U"
	.string	"T"
	.string	"F"
	.string	"-"
	.string	"8"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC21:
	.string	"A"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"a"
	.string	"l"
	.string	"v"
	.string	"o"
	.string	"."
	.string	" "
	.string	"M"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC22:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	":"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"r"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"t"
	.string	"e"
	.string	"m"
	.string	"p"
	.string	"o"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	"i"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.text
	.type	write_source, @function
write_source:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$2248, %rsp
	movq	%rcx, %rbp
	movq	editor(%rip), %rcx
	call	GetWindowTextLengthW@PLT
	movl	$0, %edi
	cmpl	$524288, %eax
	jbe	.L99
.L73:
	movl	%edi, %eax
	addq	$2248, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L99:
	movl	%eax, %ebx
	cltq
	leaq	2(%rax,%rax), %rcx
	call	alloc
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L73
	leal	1(%rbx), %r8d
	movq	%rax, %rdx
	movq	editor(%rip), %rcx
	call	GetWindowTextW@PLT
	movl	%eax, 76(%rsp)
	testl	%eax, %eax
	jne	.L100
	movl	$1, %ecx
	call	alloc
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L87
.L89:
	movl	$0, %edi
	leaq	80(%rsp), %rbx
	leaq	__const_editor_LC15(%rip), %r15
	leaq	__const_editor_LC16(%rip), %r14
.L78:
	movl	$1072, %r8d
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	wcopy
	movl	%eax, %edx
	movq	%r15, %r9
	movl	$1072, %r8d
	movq	%rbx, %rcx
	call	wappend
	movl	%eax, %esi
	call	GetCurrentProcessId@PLT
	movl	%eax, %r9d
	movl	$1072, %r8d
	movl	%esi, %edx
	movq	%rbx, %rcx
	call	append_num
	movl	%eax, %edx
	movq	%r14, %r9
	movl	$1072, %r8d
	movq	%rbx, %rcx
	call	wappend
	movl	%eax, %edx
	movl	%edi, %r9d
	movl	$1072, %r8d
	movq	%rbx, %rcx
	call	append_num
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$1, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$1073741824, %edx
	movq	%rbx, %rcx
	call	CreateFileW@PLT
	movq	%rax, %rsi
	cmpq	$-1, %rax
	jne	.L79
	addl	$1, %edi
	cmpl	$32, %edi
	jne	.L78
	movq	%r12, %rcx
	call	release
	movq	%r13, %rcx
	call	release
	leaq	__const_editor_LC22(%rip), %rcx
	call	log_line
	movl	$0, %edi
	jmp	.L73
.L100:
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	%eax, %r9d
	movq	%r12, %r8
	movl	$0, %edx
	movl	$65001, %ecx
	call	WideCharToMultiByte@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jg	.L76
	movq	%r12, %rcx
	call	release
	jmp	.L73
.L97:
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movl	%ebx, 40(%rsp)
	movq	%r13, 32(%rsp)
	movl	76(%rsp), %r9d
	movq	%r12, %r8
	movl	$0, %edx
	movl	$65001, %ecx
	call	WideCharToMultiByte@PLT
	cmpl	%ebx, %eax
	jne	.L77
	movl	%ebx, 76(%rsp)
	jmp	.L89
.L77:
	movq	%r12, %rcx
	call	release
	movq	%r13, %rcx
	call	release
	movl	$0, %edi
	jmp	.L73
.L81:
	movq	%rsi, %rcx
	call	CloseHandle@PLT
	leaq	80(%rsp), %rcx
	call	DeleteFileW@PLT
	movq	%r12, %rcx
	call	release
	movq	%r13, %rcx
	call	release
	leaq	__const_editor_LC17(%rip), %rcx
	call	log_line
	movl	$0, %edi
	jmp	.L73
.L101:
	movq	%rsi, %rcx
	call	CloseHandle@PLT
	leaq	80(%rsp), %rcx
	call	DeleteFileW@PLT
	movq	%r12, %rcx
	call	release
	movq	%r13, %rcx
	call	release
	leaq	__const_editor_LC18(%rip), %rcx
	call	log_line
	jmp	.L73
.L102:
	leaq	80(%rsp), %rcx
	call	DeleteFileW@PLT
	leaq	__const_editor_LC19(%rip), %rcx
	call	log_line
	jmp	.L73
.L79:
	movl	76(%rsp), %eax
	movl	%eax, %edi
	movl	$0, %ebx
	leaq	2236(%rsp), %r14
	testl	%eax, %eax
	je	.L86
.L83:
	movl	$0, 2236(%rsp)
	movl	%ebx, %edx
	addq	%r13, %rdx
	movq	$0, 32(%rsp)
	movq	%r14, %r9
	movl	%edi, %r8d
	subl	%ebx, %r8d
	movq	%rsi, %rcx
	call	WriteFile@PLT
	testl	%eax, %eax
	je	.L81
	movl	2236(%rsp), %eax
	testl	%eax, %eax
	je	.L81
	addl	%eax, %ebx
	cmpl	%edi, %ebx
	jb	.L83
.L86:
	movq	%rsi, %rcx
	call	FlushFileBuffers@PLT
	movl	%eax, %edi
	testl	%eax, %eax
	je	.L101
	movq	%rsi, %rcx
	call	CloseHandle@PLT
	movq	%r12, %rcx
	call	release
	movq	%r13, %rcx
	call	release
	leaq	80(%rsp), %rcx
	movl	$9, %r8d
	movq	%rbp, %rdx
	call	MoveFileExW@PLT
	movl	%eax, %edi
	testl	%eax, %eax
	je	.L102
	movl	$0, dirty(%rip)
	leaq	__const_editor_LC20(%rip), %rcx
	call	log_line
	leaq	__const_editor_LC21(%rip), %rcx
	call	set_status
	movl	$1, %edi
	jmp	.L73
.L76:
	movslq	%eax, %rcx
	addq	$1, %rcx
	call	alloc
	movq	%rax, %r13
	testq	%rax, %rax
	jne	.L97
.L87:
	movq	%r12, %rcx
	call	release
	movl	$0, %edi
	jmp	.L73
	.size	write_source, .-write_source
	.section	.rodata.str2.8
	.align 8
__const_editor_LC23:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC24:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"-"
	.string	"l"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC25:
	.string	"P"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC26:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"s"
	.string	"k"
	.string	"t"
	.string	"o"
	.string	"p"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"a"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC27:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"o"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC28:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"g"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.text
	.type	start_version_worker, @function
start_version_worker:
	cmpl	$0, versionBusy(%rip)
	je	.L112
	ret
.L112:
	pushq	%rsi
	pushq	%rbx
	subq	$56, %rsp
	movq	%rcx, %rbx
	movl	%edx, %esi
	movl	$1, versionBusy(%rip)
	movl	$0, %edx
	movq	bprepare(%rip), %rcx
	call	EnableWindow@PLT
	movl	$0, %edx
	movq	blaunch(%rip), %rcx
	call	EnableWindow@PLT
	testl	%esi, %esi
	je	.L105
	leaq	__const_editor_LC23(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC24(%rip), %rcx
	call	log_line
	leaq	version_worker_launch(%rip), %r8
.L106:
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movq	%rbx, %r9
	movl	$0, %edx
	movl	$0, %ecx
	call	CreateThread@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L113
	call	CloseHandle@PLT
.L103:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L105:
	leaq	__const_editor_LC25(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC26(%rip), %rcx
	call	log_line
	leaq	version_worker_prepare(%rip), %r8
	jmp	.L106
.L113:
	movl	$0, versionBusy(%rip)
	movl	$1, %edx
	movq	bprepare(%rip), %rcx
	call	EnableWindow@PLT
	movl	$1, %edx
	movq	blaunch(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC27(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC28(%rip), %rcx
	call	log_line
	jmp	.L103
	.size	start_version_worker, .-start_version_worker
	.section	.rodata.str2.8
	.align 8
__const_editor_LC29:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC30:
	.string	"E"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"("
	.string	"f"
	.string	"o"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	")"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC31:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"o"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC32:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"t"
	.string	"e"
	.string	"x"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"o"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC33:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"i"
	.string	"n"
	.string	"t"
	.string	"a"
	.string	"x"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC34:
	.string	"E"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"t"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	" "
	.string	"V"
	.string	"M"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.text
	.type	start_local, @function
start_local:
	cmpl	$0, localBusy(%rip)
	je	.L124
	ret
.L124:
	pushq	%rsi
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %rsi
	movl	%edx, %ebx
	movl	$1, localBusy(%rip)
	movl	%edx, localCheck(%rip)
	movl	$0, %edx
	movq	bcheck(%rip), %rcx
	call	EnableWindow@PLT
	movl	$0, %edx
	movq	brun(%rip), %rcx
	call	EnableWindow@PLT
	testl	%ebx, %ebx
	jne	.L116
	leaq	__const_editor_LC34(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC30(%rip), %rcx
	jmp	.L118
.L125:
	movl	$0, localBusy(%rip)
	movl	$1, %edx
	movq	bcheck(%rip), %rcx
	call	EnableWindow@PLT
	movl	$1, %edx
	movq	brun(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC31(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC32(%rip), %rcx
	call	log_line
	jmp	.L114
.L116:
	leaq	__const_editor_LC33(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC29(%rip), %rcx
.L118:
	call	log_line
	movl	%ebx, %r8d
	movq	editor(%rip), %rdx
	movq	%rsi, %rcx
	call	localrun_start
	testl	%eax, %eax
	je	.L125
.L114:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.size	start_local, .-start_local
	.type	layout, @function
layout:
	cmpq	$0, editor(%rip)
	je	.L131
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$72, %rsp
	leaq	48(%rsp), %rdx
	call	GetClientRect@PLT
	testl	%eax, %eax
	jne	.L134
.L126:
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L134:
	movl	56(%rsp), %esi
	movl	60(%rsp), %ebx
	leal	-212(%rsi), %edi
	movl	$220, %eax
	cmpl	%eax, %edi
	cmovl	%eax, %edi
	leal	-160(%rbx), %ebp
	movl	$213, %eax
	cmpl	%eax, %ebp
	cmovl	%eax, %ebp
	leal	12(%rbp), %r12d
	movl	$1, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	$180, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	sidebar(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$162, %r9d
	movl	$12, %r8d
	movl	$16, %edx
	movq	titleLabel(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$26, 32(%rsp)
	movl	$160, %r9d
	movl	$66, %r8d
	movl	$16, %edx
	movq	explorerLabel(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$27, 32(%rsp)
	movl	$160, %r9d
	movl	$104, %r8d
	movl	$16, %edx
	movq	scriptLabel(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$75, 32(%rsp)
	movl	$162, %r9d
	movl	$140, %r8d
	movl	$16, %edx
	movq	disabledLabel(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$32, 32(%rsp)
	movl	$148, %r9d
	movl	$230, %r8d
	movl	$16, %edx
	movq	binstall(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$32, 32(%rsp)
	movl	$148, %r9d
	movl	$270, %r8d
	movl	$16, %edx
	movq	bprobe(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$32, 32(%rsp)
	movl	$148, %r9d
	movl	$310, %r8d
	movl	$16, %edx
	movq	bprepare(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$32, 32(%rsp)
	movl	$148, %r9d
	movl	$350, %r8d
	movl	$16, %edx
	movq	blaunch(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$32, 32(%rsp)
	movl	$148, %r9d
	movl	$390, %r8d
	movl	$16, %edx
	movq	bcheck(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$32, 32(%rsp)
	movl	$148, %r9d
	movl	$430, %r8d
	movl	$16, %edx
	movq	brun(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$27, 32(%rsp)
	movl	%edi, %r9d
	movl	$16, %r8d
	movl	$194, %edx
	movq	tabLabel(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$57, %r9d
	movl	$55, %r8d
	movl	$194, %edx
	movq	bnew(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$66, %r9d
	movl	$55, %r8d
	movl	$254, %edx
	movq	bopen(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$67, %r9d
	movl	$55, %r8d
	movl	$323, %edx
	movq	bsave(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$73, %r9d
	movl	$55, %r8d
	movl	$393, %edx
	movq	bcopy(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$75, %r9d
	movl	$55, %r8d
	movl	$469, %edx
	movq	bclear(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$76, %r9d
	movl	$55, %r8d
	movl	$547, %edx
	movq	bclients(%rip), %rcx
	call	MoveWindow@PLT
	leal	-203(%rsi), %edx
	movl	$626, %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$88, %r9d
	movl	$55, %r8d
	movq	bconnect(%rip), %rcx
	call	MoveWindow@PLT
	leal	-110(%rsi), %edx
	movl	$716, %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movl	$1, 40(%rsp)
	movl	$29, 32(%rsp)
	movl	$92, %r9d
	movl	$55, %r8d
	movq	bexecute(%rip), %rcx
	call	MoveWindow@PLT
	leal	-133(%rbp), %r13d
	movl	$1, 40(%rsp)
	movl	%r13d, 32(%rsp)
	movl	$48, %r9d
	movl	$133, %r8d
	movl	$194, %edx
	movq	gutter(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	%r13d, 32(%rsp)
	leal	-48(%rdi), %r9d
	movl	$133, %r8d
	movl	$242, %edx
	movq	editor(%rip), %rcx
	call	MoveWindow@PLT
	movl	%r13d, editorHeight(%rip)
	movl	$1, 40(%rsp)
	movl	$20, 32(%rsp)
	movl	%edi, %r9d
	movl	%r12d, %r8d
	movl	$194, %edx
	movq	outputLabel(%rip), %rcx
	call	MoveWindow@PLT
	movl	$1, 40(%rsp)
	movl	%ebx, %eax
	subl	%r12d, %eax
	subl	$53, %eax
	movl	$35, %edx
	cmpl	%edx, %eax
	cmovl	%edx, %eax
	movl	%eax, 32(%rsp)
	movl	%edi, %r9d
	leal	32(%rbp), %r8d
	movl	$194, %edx
	movq	output(%rip), %rcx
	call	MoveWindow@PLT
	subl	$24, %esi
	subl	$28, %ebx
	movl	$1, 40(%rsp)
	movl	$23, 32(%rsp)
	movl	$300, %r9d
	cmpl	%r9d, %esi
	cmovge	%esi, %r9d
	testl	%ebx, %ebx
	movl	$0, %r8d
	cmovns	%ebx, %r8d
	movl	$12, %edx
	movq	statusText(%rip), %rcx
	call	MoveWindow@PLT
	jmp	.L126
.L131:
	ret
	.size	layout, .-layout
	.globl	memset
	.type	memset, @function
memset:
	movq	%rcx, %rax
	testq	%r8, %r8
	je	.L136
	addq	%rcx, %r8
	movq	%rcx, %r9
.L137:
	addq	$1, %r9
	movb	%dl, -1(%r9)
	cmpq	%r9, %r8
	jne	.L137
.L136:
	ret
	.size	memset, .-memset
	.section	.rodata.str2.2
	.align 2
__const_editor_LC35:
	.string	"S"
	.string	"e"
	.string	"g"
	.string	"o"
	.string	"e"
	.string	" "
	.string	"U"
	.string	"I"
	.string	""
	.string	""
	.align 2
__const_editor_LC36:
	.string	"C"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"o"
	.string	"l"
	.string	"a"
	.string	"s"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC37:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"N"
	.string	"a"
	.string	"t"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"E"
	.string	"d"
	.string	"i"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	""
	.string	""
	.align 8
__const_editor_LC38:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	" "
	.string	"-"
	.string	" "
	.string	"E"
	.string	"d"
	.string	"i"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC39:
	.string	"d"
	.string	"w"
	.string	"m"
	.string	"a"
	.string	"p"
	.string	"i"
	.string	"."
	.string	"d"
	.string	"l"
	.string	"l"
	.string	""
	.string	""
	.section	.rodata.str1.1,"aMS",@progbits,1
__const_editor_LC40:
	.string	"DwmSetWindowAttribute"
	.section	.rodata.str2.2
	.align 2
__const_editor_LC41:
	.string	""
	.string	""
	.align 2
__const_editor_LC42:
	.string	"S"
	.string	"T"
	.string	"A"
	.string	"T"
	.string	"I"
	.string	"C"
	.string	""
	.string	""
	.align 2
__const_editor_LC43:
	.string	"A"
	.string	"X"
	.string	"I"
	.string	"O"
	.string	"M"
	.string	""
	.string	""
	.align 2
__const_editor_LC44:
	.string	"E"
	.string	"X"
	.string	"P"
	.string	"L"
	.string	"O"
	.string	"R"
	.string	"E"
	.string	"R"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC45:
	.string	" "
	.string	" "
	.string	">"
	.string	" "
	.string	" "
	.string	"S"
	.string	"c"
	.string	"r"
	.string	"i"
	.string	"p"
	.string	"t"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	""
	.string	""
	.align 8
__const_editor_LC46:
	.string	"O"
	.string	" "
	.string	"m"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"a"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC47:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC48:
	.string	"B"
	.string	"U"
	.string	"T"
	.string	"T"
	.string	"O"
	.string	"N"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC49:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	""
	.string	""
	.align 8
__const_editor_LC50:
	.string	"P"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC51:
	.string	"A"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC52:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"s"
	.string	"i"
	.string	"n"
	.string	"t"
	.string	"a"
	.string	"x"
	.string	"e"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC53:
	.string	"E"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"t"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC54:
	.string	" "
	.string	" "
	.string	"N"
	.string	"O"
	.string	"V"
	.string	"O"
	.string	" "
	.string	"S"
	.string	"C"
	.string	"R"
	.string	"I"
	.string	"P"
	.string	"T"
	.string	" "
	.string	" "
	.string	"|"
	.string	" "
	.string	" "
	.string	"U"
	.string	"T"
	.string	"F"
	.string	"-"
	.string	"8"
	.string	""
	.string	""
	.align 8
__const_editor_LC55:
	.string	" "
	.string	" "
	.string	"S"
	.string	"A"
	.string	"I"
	.string	"D"
	.string	"A"
	.string	" "
	.string	"D"
	.string	"O"
	.string	" "
	.string	"A"
	.string	"X"
	.string	"I"
	.string	"O"
	.string	"M"
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC56:
	.string	"N"
	.string	"o"
	.string	"v"
	.string	"o"
	.string	""
	.string	""
	.align 2
__const_editor_LC57:
	.string	"A"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	""
	.string	""
	.align 2
__const_editor_LC58:
	.string	"S"
	.string	"a"
	.string	"l"
	.string	"v"
	.string	"a"
	.string	"r"
	.string	""
	.string	""
	.align 2
__const_editor_LC59:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	""
	.string	""
	.align 2
__const_editor_LC60:
	.string	"L"
	.string	"i"
	.string	"m"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	""
	.string	""
	.align 2
__const_editor_LC61:
	.string	"C"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	""
	.string	""
	.align 2
__const_editor_LC62:
	.string	"C"
	.string	"o"
	.string	"n"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"r"
	.string	""
	.string	""
	.align 2
__const_editor_LC63:
	.string	"1"
	.string	""
	.string	""
	.align 2
__const_editor_LC64:
	.string	"p"
	.string	"r"
	.string	"i"
	.string	"n"
	.string	"t"
	.string	"("
	.string	"\""
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"\""
	.string	")"
	.string	""
	.string	""
	.align 2
__const_editor_LC65:
	.string	"E"
	.string	"D"
	.string	"I"
	.string	"T"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC66:
	.string	"E"
	.string	"d"
	.string	"i"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"o"
	.string	"."
	.string	" "
	.string	"E"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"a"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"m"
	.string	"p"
	.string	"l"
	.string	"e"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	"\r"
	.string	"\n"
	.string	""
	.string	""
	.align 8
__const_editor_LC67:
	.string	"D"
	.string	"e"
	.string	"s"
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	" "
	.string	"|"
	.string	" "
	.string	" "
	.string	"m"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	""
	.string	""
	.text
	.globl	start
	.type	start, @function
start:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$256, %rsp
	movl	$1, 124(%rsp)
	leaq	176(%rsp), %rbx
	movl	$72, %r8d
	movl	$0, %edx
	movq	%rbx, %rcx
	call	memset
	movl	$0, %ecx
	call	GetModuleHandleW@PLT
	movq	%rax, module(%rip)
	movl	$920588, %ecx
	call	CreateSolidBrush@PLT
	movq	%rax, bgBrush(%rip)
	movl	$1381139, %ecx
	call	CreateSolidBrush@PLT
	movq	%rax, sideBrush(%rip)
	movl	$1117967, %ecx
	call	CreateSolidBrush@PLT
	movq	%rax, editorBrush(%rip)
	movl	$1381139, %ecx
	call	CreateSolidBrush@PLT
	movq	%rax, barBrush(%rip)
	movl	$2104605, %ecx
	call	CreateSolidBrush@PLT
	movq	%rax, buttonBrush(%rip)
	movl	$3288622, %ecx
	call	CreateSolidBrush@PLT
	movq	%rax, hotBrush(%rip)
	leaq	__const_editor_LC35(%rip), %rsi
	movq	%rsi, 104(%rsp)
	movl	$0, 96(%rsp)
	movl	$0, 88(%rsp)
	movl	$0, 80(%rsp)
	movl	$0, 72(%rsp)
	movl	$1, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$400, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$-14, %ecx
	call	CreateFontW@PLT
	movq	%rax, uiFont(%rip)
	movq	%rsi, 104(%rsp)
	movl	$0, 96(%rsp)
	movl	$0, 88(%rsp)
	movl	$0, 80(%rsp)
	movl	$0, 72(%rsp)
	movl	$1, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$600, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$-19, %ecx
	call	CreateFontW@PLT
	movq	%rax, headingFont(%rip)
	leaq	__const_editor_LC36(%rip), %rax
	movq	%rax, 104(%rsp)
	movl	$49, 96(%rsp)
	movl	$0, 88(%rsp)
	movl	$0, 80(%rsp)
	movl	$0, 72(%rsp)
	movl	$1, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	$0, 48(%rsp)
	movl	$0, 40(%rsp)
	movl	$400, 32(%rsp)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movl	$-16, %ecx
	call	CreateFontW@PLT
	movq	%rax, codeFont(%rip)
	leaq	window_proc(%rip), %rax
	movq	%rax, 184(%rsp)
	movq	module(%rip), %rax
	movq	%rax, 200(%rsp)
	movl	$32512, %edx
	movl	$0, %ecx
	call	LoadCursorW@PLT
	movq	%rax, 216(%rsp)
	movq	bgBrush(%rip), %rax
	movq	%rax, 224(%rsp)
	leaq	__const_editor_LC37(%rip), %rax
	movq	%rax, 240(%rsp)
	movq	%rbx, %rcx
	call	RegisterClassW@PLT
	testw	%ax, %ax
	je	.L155
.L140:
	movq	$0, 88(%rsp)
	movq	module(%rip), %rax
	movq	%rax, 80(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, 64(%rsp)
	movl	$720, 56(%rsp)
	movl	$1120, 48(%rsp)
	movl	$100, 40(%rsp)
	movl	$100, 32(%rsp)
	movl	$13565952, %r9d
	leaq	__const_editor_LC38(%rip), %r8
	movq	240(%rsp), %rdx
	movl	$0, %ecx
	call	CreateWindowExW@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L156
.L141:
	leaq	__const_editor_LC39(%rip), %rcx
	call	LoadLibraryW@PLT
	testq	%rax, %rax
	je	.L142
	leaq	__const_editor_LC40(%rip), %rdx
	movq	%rax, %rcx
	call	GetProcAddress@PLT
	testq	%rax, %rax
	je	.L142
	movl	$4, %r9d
	leaq	124(%rsp), %r8
	movl	$20, %edx
	movq	%rbx, %rcx
	call	*%rax
.L142:
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC41(%rip), %r8
	leaq	__const_editor_LC42(%rip), %rdi
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, sidebar(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC43(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, titleLabel(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC44(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, explorerLabel(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC45(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, scriptLabel(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC46(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, disabledLabel(%rip)
	movl	$110, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC47(%rip), %r8
	leaq	__const_editor_LC48(%rip), %rsi
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, binstall(%rip)
	movl	$111, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC49(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bprobe(%rip)
	movl	$112, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC50(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bprepare(%rip)
	movl	$113, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC51(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, blaunch(%rip)
	movl	$114, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC52(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bcheck(%rip)
	movl	$115, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC53(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, brun(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC54(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, tabLabel(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC55(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, outputLabel(%rip)
	movl	$104, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC56(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bnew(%rip)
	movl	$102, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC57(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bopen(%rip)
	movl	$103, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC58(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bsave(%rip)
	movl	$105, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC59(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bcopy(%rip)
	movl	$106, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC60(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bclear(%rip)
	movl	$107, 32(%rsp)
	movl	$65547, %r9d
	leaq	__const_editor_LC61(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bclients(%rip)
	movl	$108, 32(%rsp)
	movl	$11, %r9d
	leaq	__const_editor_LC62(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bconnect(%rip)
	movl	$109, 32(%rsp)
	movl	$11, %r9d
	leaq	__const_editor_LC53(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, bexecute(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC63(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, gutter(%rip)
	movl	$101, 32(%rsp)
	movl	$3215556, %r9d
	leaq	__const_editor_LC64(%rip), %r8
	leaq	__const_editor_LC65(%rip), %rsi
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, editor(%rip)
	movl	$0, 32(%rsp)
	movl	$2099268, %r9d
	leaq	__const_editor_LC66(%rip), %r8
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, output(%rip)
	movl	$0, 32(%rsp)
	movl	$0, %r9d
	leaq	__const_editor_LC67(%rip), %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	control
	movq	%rax, statusText(%rip)
	cmpq	$0, sidebar(%rip)
	je	.L143
	cmpq	$0, titleLabel(%rip)
	je	.L143
	cmpq	$0, explorerLabel(%rip)
	je	.L143
	cmpq	$0, scriptLabel(%rip)
	je	.L143
	cmpq	$0, disabledLabel(%rip)
	je	.L143
	cmpq	$0, binstall(%rip)
	je	.L143
	cmpq	$0, bprobe(%rip)
	je	.L143
	cmpq	$0, bprepare(%rip)
	je	.L143
	cmpq	$0, blaunch(%rip)
	je	.L143
	cmpq	$0, bcheck(%rip)
	je	.L143
	cmpq	$0, brun(%rip)
	je	.L143
	cmpq	$0, tabLabel(%rip)
	je	.L143
	cmpq	$0, outputLabel(%rip)
	je	.L143
	cmpq	$0, bnew(%rip)
	je	.L143
	cmpq	$0, bopen(%rip)
	je	.L143
	cmpq	$0, bsave(%rip)
	je	.L143
	cmpq	$0, bcopy(%rip)
	je	.L143
	cmpq	$0, bclear(%rip)
	je	.L143
	cmpq	$0, bclients(%rip)
	je	.L143
	cmpq	$0, bconnect(%rip)
	je	.L143
	cmpq	$0, bexecute(%rip)
	je	.L143
	cmpq	$0, gutter(%rip)
	je	.L143
	cmpq	$0, editor(%rip)
	je	.L143
	cmpq	$0, output(%rip)
	je	.L143
	testq	%rax, %rax
	jne	.L144
.L143:
	movl	$1, %ecx
	call	ExitProcess@PLT
.L144:
	movq	headingFont(%rip), %rdx
	movq	%rdx, %r8
	testq	%rdx, %rdx
	je	.L157
.L147:
	movl	$1, %r9d
	movl	$48, %edx
	movq	titleLabel(%rip), %rcx
	call	SendMessageW@PLT
	movq	codeFont(%rip), %rdx
	movq	%rdx, %r8
	testq	%rdx, %rdx
	je	.L158
.L149:
	movl	$1, %r9d
	movl	$48, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	movq	codeFont(%rip), %rdx
	movq	%rdx, %r8
	testq	%rdx, %rdx
	je	.L159
.L151:
	movl	$1, %r9d
	movl	$48, %edx
	movq	gutter(%rip), %rcx
	call	SendMessageW@PLT
	movl	$0, %r9d
	movl	$524288, %r8d
	movl	$197, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	movl	$0, %r9d
	movl	$8191, %r8d
	movl	$197, %edx
	movq	output(%rip), %rcx
	call	SendMessageW@PLT
	movl	$1, %edx
	movq	bconnect(%rip), %rcx
	call	EnableWindow@PLT
	movl	$1, %edx
	movq	bexecute(%rip), %rcx
	call	EnableWindow@PLT
	movl	$0, dirty(%rip)
	movq	%rbx, %rcx
	call	layout
	movl	$0, %r9d
	movl	$250, %r8d
	movl	$1, %edx
	movq	%rbx, %rcx
	call	SetTimer@PLT
	movl	$5, %edx
	movq	%rbx, %rcx
	call	ShowWindow@PLT
	movq	%rbx, %rcx
	call	UpdateWindow@PLT
	leaq	128(%rsp), %rbx
	jmp	.L152
.L155:
	movl	$1, %ecx
	call	ExitProcess@PLT
	jmp	.L140
.L156:
	movl	$1, %ecx
	call	ExitProcess@PLT
	jmp	.L141
.L157:
	movl	$17, %ecx
	call	GetStockObject@PLT
	movq	%rax, %r8
	jmp	.L147
.L158:
	movl	$17, %ecx
	call	GetStockObject@PLT
	movq	%rax, %r8
	jmp	.L149
.L159:
	movl	$17, %ecx
	call	GetStockObject@PLT
	movq	%rax, %r8
	jmp	.L151
.L153:
	movq	%rbx, %rcx
	call	TranslateMessage@PLT
	movq	%rbx, %rcx
	call	DispatchMessageW@PLT
.L152:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	%rbx, %rcx
	call	GetMessageW@PLT
	testl	%eax, %eax
	jg	.L153
	movl	$0, %ecx
	call	ExitProcess@PLT
	addq	$256, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.size	start, .-start
	.section	.rodata
	.align 8
__const_editor_LC68:
	.string	"S"
	.string	"c"
	.string	"r"
	.string	"i"
	.string	"p"
	.string	"t"
	.string	"s"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"("
	.string	"*"
	.string	"."
	.string	"l"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	";"
	.string	"*"
	.string	"."
	.string	"l"
	.string	"u"
	.string	"a"
	.string	")"
	.string	""
	.string	""
	.string	"*"
	.string	"."
	.string	"l"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	";"
	.string	"*"
	.string	"."
	.string	"l"
	.string	"u"
	.string	"a"
	.string	""
	.string	""
	.string	"T"
	.string	"o"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"o"
	.string	"s"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"("
	.string	"*"
	.string	"."
	.string	"*"
	.string	")"
	.string	""
	.string	""
	.string	"*"
	.string	"."
	.string	"*"
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC69:
	.string	"l"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	""
	.string	""
	.text
	.type	save_current, @function
save_current:
	pushq	%rsi
	pushq	%rbx
	subq	$2248, %rsp
	cmpw	$0, currentPath(%rip)
	jne	.L164
	movq	%rcx, %rbx
	movw	$0, 192(%rsp)
	leaq	32(%rsp), %rsi
	movl	$152, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	memset
	movl	$152, 32(%rsp)
	movq	%rbx, 40(%rsp)
	leaq	__const_editor_LC68(%rip), %rax
	movq	%rax, 56(%rsp)
	leaq	192(%rsp), %rax
	movq	%rax, 80(%rsp)
	movl	$1024, 88(%rsp)
	movl	$1, 76(%rsp)
	leaq	__const_editor_LC69(%rip), %rax
	movq	%rax, 136(%rsp)
	movl	$2062, 128(%rsp)
	movq	%rsi, %rcx
	call	GetSaveFileNameW@PLT
	testl	%eax, %eax
	je	.L160
	leaq	192(%rsp), %rcx
	call	write_source
	testl	%eax, %eax
	je	.L160
	leaq	192(%rsp), %rdx
	movl	$1024, %r8d
	leaq	currentPath(%rip), %rcx
	call	wcopy
	movl	$1, %eax
	jmp	.L160
.L164:
	leaq	currentPath(%rip), %rcx
	call	write_source
.L160:
	addq	$2248, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.size	save_current, .-save_current
	.section	.rodata.str2.8
	.align 8
__const_editor_LC70:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	" "
	.string	"-"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"l"
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	""
	.string	""
	.align 8
__const_editor_LC71:
	.string	"S"
	.string	"a"
	.string	"l"
	.string	"v"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	"s"
	.string	" "
	.string	"a"
	.string	"l"
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"o"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"i"
	.string	"n"
	.string	"u"
	.string	"a"
	.string	"r"
	.string	"?"
	.string	""
	.string	""
	.text
	.type	can_discard, @function
can_discard:
	movl	$1, %eax
	cmpl	$0, dirty(%rip)
	jne	.L174
	ret
.L174:
	pushq	%rbx
	subq	$32, %rsp
	movq	%rcx, %rbx
	movl	$35, %r9d
	leaq	__const_editor_LC70(%rip), %r8
	leaq	__const_editor_LC71(%rip), %rdx
	call	MessageBoxW@PLT
	movl	%eax, %edx
	movl	$0, %eax
	cmpl	$2, %edx
	je	.L165
	cmpl	$7, %edx
	sete	%al
	movzbl	%al, %eax
	cmpl	$6, %edx
	je	.L175
.L165:
	addq	$32, %rsp
	popq	%rbx
	ret
.L175:
	movq	%rbx, %rcx
	call	save_current
	jmp	.L165
	.size	can_discard, .-can_discard
	.section	.rodata.str2.8
	.align 8
__const_editor_LC72:
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
	.align 8
__const_editor_LC73:
	.string	"N"
	.string	"e"
	.string	"n"
	.string	"h"
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"t"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC74:
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"t"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	" "
	.string	"M"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC75:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC76:
	.string	"C"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"t"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	":"
	.string	" "
	.string	""
	.string	""
	.align 8
__const_editor_LC77:
	.string	" "
	.string	"|"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"i"
	.string	"m"
	.string	"e"
	.string	"i"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"P"
	.string	"I"
	.string	"D"
	.string	":"
	.string	" "
	.string	""
	.string	""
	.text
	.type	scan_clients, @function
scan_clients:
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$936, %rsp
	movl	$0, %edx
	movl	$2, %ecx
	call	CreateToolhelp32Snapshot@PLT
	cmpq	$-1, %rax
	je	.L194
	movq	%rax, %rbx
	leaq	352(%rsp), %rsi
	movl	$568, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	memset
	movl	$568, 352(%rsp)
	movq	%rsi, %rdx
	movq	%rbx, %rcx
	call	Process32FirstW@PLT
	testl	%eax, %eax
	je	.L179
	movl	$0, %ebp
	movl	$0, %esi
	leaq	352(%rsp), %rdi
	jmp	.L187
.L194:
	leaq	__const_editor_LC75(%rip), %rcx
	call	log_line
	jmp	.L176
.L196:
	movl	360(%rsp), %ebp
.L186:
	addl	$1, %esi
.L181:
	movq	%rdi, %rdx
	movq	%rbx, %rcx
	call	Process32NextW@PLT
	testl	%eax, %eax
	je	.L195
.L187:
	movzwl	396(%rsp), %eax
	leaq	__const_editor_LC72(%rip), %rcx
	leaq	396(%rsp), %r8
	testw	%ax, %ax
	je	.L181
.L180:
	movzwl	(%rcx), %edx
	testw	%dx, %dx
	je	.L184
	movzwl	%ax, %eax
	leal	-65(%rax), %r10d
	leal	32(%rax), %r9d
	cmpl	$26, %r10d
	cmovb	%r9d, %eax
	movzwl	%dx, %edx
	leal	-65(%rdx), %r10d
	leal	32(%rdx), %r9d
	cmpl	$26, %r10d
	cmovb	%r9d, %edx
	cmpl	%eax, %edx
	jne	.L181
	addq	$2, %r8
	addq	$2, %rcx
	movzwl	(%r8), %eax
	testw	%ax, %ax
	jne	.L180
.L184:
	cmpw	%ax, (%rcx)
	jne	.L181
	testl	%esi, %esi
	jne	.L186
	jmp	.L196
.L195:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	leaq	32(%rsp), %rbx
	movl	$160, %r8d
	leaq	__const_editor_LC76(%rip), %rdx
	movq	%rbx, %rcx
	call	wcopy
	movl	%eax, %edx
	movl	%esi, %r9d
	movl	$160, %r8d
	movq	%rbx, %rcx
	call	append_num
	testl	%esi, %esi
	je	.L188
	leaq	__const_editor_LC77(%rip), %r9
	movl	$160, %r8d
	movl	%eax, %edx
	movq	%rbx, %rcx
	call	wappend
	movl	%eax, %edx
	movl	%ebp, %r9d
	movl	$160, %r8d
	movq	%rbx, %rcx
	call	append_num
	movq	%rbx, %rcx
	call	log_line
	leaq	__const_editor_LC74(%rip), %rcx
	jmp	.L189
.L179:
	movq	%rbx, %rcx
	call	CloseHandle@PLT
	leaq	32(%rsp), %rbx
	movl	$160, %r8d
	leaq	__const_editor_LC76(%rip), %rdx
	movq	%rbx, %rcx
	call	wcopy
	movl	%eax, %edx
	movl	$0, %r9d
	movl	$160, %r8d
	movq	%rbx, %rcx
	call	append_num
.L188:
	leaq	32(%rsp), %rcx
	call	log_line
	leaq	__const_editor_LC73(%rip), %rcx
.L189:
	call	set_status
.L176:
	addq	$936, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.size	scan_clients, .-scan_clients
	.section	.rodata.str2.8
	.align 8
__const_editor_LC78:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	":"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC79:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	":"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"o"
	.string	"u"
	.string	" "
	.string	"m"
	.string	"a"
	.string	"i"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"q"
	.string	"u"
	.string	"e"
	.string	" "
	.string	"2"
	.string	" "
	.string	"M"
	.string	"i"
	.string	"B"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC80:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC81:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	":"
	.string	" "
	.string	"u"
	.string	"s"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"U"
	.string	"T"
	.string	"F"
	.string	"-"
	.string	"8"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"m"
	.string	"i"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC82:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	":"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	" "
	.string	"N"
	.string	"U"
	.string	"L"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC83:
	.string	" "
	.string	" "
	.string	"S"
	.string	"C"
	.string	"R"
	.string	"I"
	.string	"P"
	.string	"T"
	.string	" "
	.string	"A"
	.string	"B"
	.string	"E"
	.string	"R"
	.string	"T"
	.string	"O"
	.string	" "
	.string	" "
	.string	"|"
	.string	" "
	.string	" "
	.string	"U"
	.string	"T"
	.string	"F"
	.string	"-"
	.string	"8"
	.string	""
	.string	""
	.align 8
__const_editor_LC84:
	.string	"A"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	"."
	.string	" "
	.string	"M"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC85:
	.string	"A"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"d"
	.string	"i"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"."
	.string	""
	.string	""
	.text
	.type	open_file, @function
open_file:
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$2280, %rsp
	movq	%rcx, %rbx
	call	can_discard
	testl	%eax, %eax
	jne	.L229
.L197:
	addq	$2280, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L229:
	movw	$0, 224(%rsp)
	leaq	64(%rsp), %rsi
	movl	$152, %r8d
	movl	$0, %edx
	movq	%rsi, %rcx
	call	memset
	movl	$152, 64(%rsp)
	movq	%rbx, 72(%rsp)
	leaq	__const_editor_LC68(%rip), %rax
	movq	%rax, 88(%rsp)
	leaq	224(%rsp), %rax
	movq	%rax, 112(%rsp)
	movl	$1024, 120(%rsp)
	movl	$1, 108(%rsp)
	leaq	__const_editor_LC69(%rip), %rax
	movq	%rax, 168(%rsp)
	movl	$6156, 160(%rsp)
	movq	%rsi, %rcx
	call	GetOpenFileNameW@PLT
	testl	%eax, %eax
	je	.L197
	leaq	224(%rsp), %rcx
	movq	$0, 48(%rsp)
	movl	$128, 40(%rsp)
	movl	$3, 32(%rsp)
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$-2147483648, %edx
	call	CreateFileW@PLT
	movq	%rax, %rdi
	cmpq	$-1, %rax
	je	.L230
	movl	$0, %edx
	movq	%rax, %rcx
	call	GetFileSize@PLT
	movl	%eax, %esi
	cmpl	$2097152, %eax
	ja	.L231
	movl	%eax, %r13d
	leaq	1(%r13), %rcx
	call	alloc
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L203
	movl	$0, %ebx
	leaq	64(%rsp), %r12
	testl	%esi, %esi
	je	.L232
.L204:
	movl	$0, 64(%rsp)
	movl	%ebx, %edx
	addq	%rbp, %rdx
	movq	$0, 32(%rsp)
	movq	%r12, %r9
	movl	%esi, %r8d
	subl	%ebx, %r8d
	movq	%rdi, %rcx
	call	ReadFile@PLT
	testl	%eax, %eax
	je	.L206
	movl	64(%rsp), %eax
	testl	%eax, %eax
	je	.L206
	addl	%eax, %ebx
	cmpl	%esi, %ebx
	jb	.L204
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	movb	$0, 0(%rbp,%r13)
	cmpl	$2, %esi
	jbe	.L219
	movl	$0, %edi
	cmpb	$-17, 0(%rbp)
	jne	.L208
	cmpb	$-69, 1(%rbp)
	jne	.L208
	cmpb	$-65, 2(%rbp)
	jne	.L208
	cmpl	$3, %esi
	jne	.L233
.L209:
	movl	$2, %ecx
	call	alloc
	movq	%rax, %r12
	movl	$2, %r13d
	testq	%rax, %rax
	je	.L217
.L213:
	movw	$0, -2(%r12,%r13)
	movl	$1, ignoreChange(%rip)
	movq	%r12, %rdx
	movq	editor(%rip), %rcx
	call	SetWindowTextW@PLT
	movl	$0, ignoreChange(%rip)
	movl	$0, dirty(%rip)
	movl	$-1, lastCount(%rip)
	leaq	224(%rsp), %rdx
	movl	$1024, %r8d
	leaq	currentPath(%rip), %rcx
	call	wcopy
	leaq	__const_editor_LC83(%rip), %rdx
	movq	tabLabel(%rip), %rcx
	call	SetWindowTextW@PLT
	leaq	__const_editor_LC84(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC85(%rip), %rcx
	call	log_line
	movq	%rbp, %rcx
	call	release
	movq	%r12, %rcx
	call	release
	jmp	.L197
.L230:
	leaq	__const_editor_LC78(%rip), %rcx
	call	log_line
	jmp	.L197
.L231:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	leaq	__const_editor_LC79(%rip), %rcx
	call	log_line
	jmp	.L197
.L203:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	jmp	.L197
.L206:
	movq	%rbp, %rcx
	call	release
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	leaq	__const_editor_LC80(%rip), %rcx
	call	log_line
	jmp	.L197
.L233:
	movl	$3, %edi
	jmp	.L208
.L219:
	movl	$0, %edi
.L208:
	movl	%edi, %eax
	movl	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	%esi, %r9d
	subl	%edi, %r9d
	leaq	0(%rbp,%rax), %r8
	movl	$8, %edx
	movl	$65001, %ecx
	call	MultiByteToWideChar@PLT
	movl	%eax, %ebx
	cmpl	%esi, %edi
	setb	%dl
	testl	%eax, %eax
	setle	%al
	testb	%al, %dl
	jne	.L223
	cmpl	$524288, %ebx
	jle	.L210
.L223:
	movq	%rbp, %rcx
	call	release
	leaq	__const_editor_LC81(%rip), %rcx
	call	log_line
	jmp	.L197
.L210:
	movslq	%ebx, %rcx
	addq	$1, %rcx
	addq	%rcx, %rcx
	movq	%rcx, %r13
	call	alloc
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L212
.L217:
	movq	%rbp, %rcx
	call	release
	jmp	.L197
.L212:
	testl	%ebx, %ebx
	je	.L213
	movl	%edi, %eax
	movl	%ebx, 40(%rsp)
	movq	%r12, 32(%rsp)
	subl	%edi, %esi
	movl	%esi, %r9d
	leaq	0(%rbp,%rax), %r8
	movl	$8, %edx
	movl	$65001, %ecx
	call	MultiByteToWideChar@PLT
	cmpl	%eax, %ebx
	jne	.L234
	movq	%r12, %rax
	leal	-1(%rbx), %edx
	leaq	2(%r12,%rdx,2), %rdx
.L216:
	cmpw	$0, (%rax)
	je	.L235
	addq	$2, %rax
	cmpq	%rdx, %rax
	jne	.L216
	jmp	.L213
.L234:
	movq	%rbp, %rcx
	call	release
	movq	%r12, %rcx
	call	release
	jmp	.L197
.L235:
	movq	%rbp, %rcx
	call	release
	movq	%r12, %rcx
	call	release
	leaq	__const_editor_LC82(%rip), %rcx
	call	log_line
	jmp	.L197
.L232:
	movq	%rdi, %rcx
	call	CloseHandle@PLT
	movb	$0, 0(%rbp)
	jmp	.L209
	.size	open_file, .-open_file
	.section	.rodata.str2.8
	.align 8
__const_editor_LC86:
	.string	"C"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"m"
	.string	" "
	.string	"m"
	.string	"o"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC87:
	.string	"C"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	" "
	.string	"M"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC88:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC89:
	.string	"E"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC90:
	.string	"S"
	.string	"i"
	.string	"n"
	.string	"t"
	.string	"a"
	.string	"x"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC91:
	.string	"E"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"f"
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"z"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC92:
	.string	"S"
	.string	"H"
	.string	"A"
	.string	"-"
	.string	"2"
	.string	"5"
	.string	"6"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"e"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"t"
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"l"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	";"
	.string	" "
	.string	"1"
	.string	"6"
	.string	" "
	.string	"b"
	.string	"y"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"q"
	.string	"u"
	.string	"a"
	.string	"t"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"t"
	.string	"r"
	.string	"e"
	.string	"c"
	.string	"h"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC93:
	.string	"P"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"x"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"g"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	";"
	.string	" "
	.string	"t"
	.string	"i"
	.string	"p"
	.string	"o"
	.string	" "
	.string	"e"
	.string	" "
	.string	"f"
	.string	"u"
	.string	"n"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC94:
	.string	"P"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"x"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"z"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	";"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"d"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"c"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"a"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"i"
	.string	"r"
	.string	"m"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC95:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"i"
	.string	"r"
	.string	"m"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC96:
	.string	"A"
	.string	"b"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"j"
	.string	"o"
	.string	"g"
	.string	"o"
	.string	" "
	.string	"e"
	.string	" "
	.string	"t"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"n"
	.string	"o"
	.string	"v"
	.string	"a"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC97:
	.string	"M"
	.string	"a"
	.string	"i"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC98:
	.string	"D"
	.string	"e"
	.string	"i"
	.string	"x"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"p"
	.string	"e"
	.string	"n"
	.string	"a"
	.string	"s"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC99:
	.string	"A"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"n"
	.string	"e"
	.string	"g"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC100:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC101:
	.string	"C"
	.string	"a"
	.string	"m"
	.string	"i"
	.string	"n"
	.string	"h"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC102:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"u"
	.string	"l"
	.string	"t"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"m"
	.string	"i"
	.string	"n"
	.string	"h"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC103:
	.string	"A"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC104:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"t"
	.string	"a"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"S"
	.string	"H"
	.string	"A"
	.string	"-"
	.string	"2"
	.string	"5"
	.string	"6"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC105:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC106:
	.string	"A"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"s"
	.string	"k"
	.string	"t"
	.string	"o"
	.string	"p"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	";"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"f"
	.string	"s"
	.string	"e"
	.string	"t"
	.string	"s"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"u"
	.string	"l"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC107:
	.string	"M"
	.string	"o"
	.string	"d"
	.string	"u"
	.string	"l"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"z"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC108:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"d"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"m"
	.string	"o"
	.string	"d"
	.string	"u"
	.string	"l"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"i"
	.string	"n"
	.string	"c"
	.string	"i"
	.string	"p"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC109:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"m"
	.string	"e"
	.string	"m"
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC110:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"r"
	.string	" "
	.string	"t"
	.string	"o"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"o"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"e"
	.string	"s"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC111:
	.string	"T"
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"l"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"o"
	.string	"p"
	.string	"c"
	.string	"o"
	.string	"d"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC112:
	.string	"A"
	.string	" "
	.string	"t"
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"l"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"m"
	.string	"p"
	.string	"l"
	.string	"e"
	.string	"t"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	" "
	.string	"m"
	.string	"e"
	.string	"m"
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC113:
	.string	"T"
	.string	"r"
	.string	"e"
	.string	"c"
	.string	"h"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"d"
	.string	"i"
	.string	"g"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC114:
	.string	"U"
	.string	"m"
	.string	" "
	.string	"d"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"q"
	.string	"u"
	.string	"a"
	.string	"t"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"t"
	.string	"r"
	.string	"e"
	.string	"c"
	.string	"h"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"n"
	.string	"a"
	.string	" "
	.string	"m"
	.string	"e"
	.string	"m"
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"m"
	.string	"o"
	.string	"s"
	.string	"t"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC115:
	.string	"E"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"r"
	.string	"i"
	.string	"p"
	.string	"t"
	.string	"o"
	.string	"g"
	.string	"r"
	.string	"a"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC116:
	.string	"O"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"e"
	.string	"g"
	.string	"u"
	.string	"i"
	.string	"u"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"c"
	.string	"u"
	.string	"l"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"S"
	.string	"H"
	.string	"A"
	.string	"-"
	.string	"2"
	.string	"5"
	.string	"6"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC117:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC118:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"s"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC119:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC120:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"r"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"m"
	.string	" "
	.string	"L"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"A"
	.string	"p"
	.string	"p"
	.string	"D"
	.string	"a"
	.string	"t"
	.string	"a"
	.string	"\\"
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	"\\"
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"i"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"."
	.string	" "
	.string	"U"
	.string	"s"
	.string	"e"
	.string	" "
	.string	"A"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC121:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"j"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC122:
	.string	"A"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"i"
	.string	"s"
	.string	"t"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"."
	.string	" "
	.string	"U"
	.string	"s"
	.string	"e"
	.string	" "
	.string	"A"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC123:
	.string	"A"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"s"
	.string	"o"
	.string	"l"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC124:
	.string	"S"
	.string	"o"
	.string	"l"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"t"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"v"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	";"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"r"
	.string	"r"
	.string	"e"
	.string	"g"
	.string	"a"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"f"
	.string	"i"
	.string	"r"
	.string	"m"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC125:
	.string	"N"
	.string	"e"
	.string	"n"
	.string	"h"
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC126:
	.string	"A"
	.string	"b"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"s"
	.string	"k"
	.string	"t"
	.string	"o"
	.string	"p"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"s"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC127:
	.string	"M"
	.string	"a"
	.string	"i"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC128:
	.string	"D"
	.string	"e"
	.string	"i"
	.string	"x"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"p"
	.string	"e"
	.string	"n"
	.string	"a"
	.string	"s"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC129:
	.string	"C"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"a"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC130:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"u"
	.string	"l"
	.string	"t"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC131:
	.string	"O"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"t"
	.string	"a"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"r"
	.string	"r"
	.string	"e"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"d"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC132:
	.string	"I"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"g"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"c"
	.string	"o"
	.string	"m"
	.string	"p"
	.string	"l"
	.string	"e"
	.string	"t"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC133:
	.string	"O"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"r"
	.string	"e"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"g"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"o"
	.string	"s"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"e"
	.string	"s"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC134:
	.string	"C"
	.string	"a"
	.string	"m"
	.string	"i"
	.string	"n"
	.string	"h"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"v"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"o"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"n"
	.string	"g"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"m"
	.string	"a"
	.string	"i"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC135:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"u"
	.string	"s"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"m"
	.string	"i"
	.string	"n"
	.string	"h"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC136:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC137:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"c"
	.string	"e"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	";"
	.string	" "
	.string	"a"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"g"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"a"
	.string	"l"
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC138:
	.string	"A"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"n"
	.string	"k"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"u"
	.string	"p"
	.string	"o"
	.string	"r"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC139:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"c"
	.string	"e"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"n"
	.string	"k"
	.string	" "
	.string	"o"
	.string	"u"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"r"
	.string	"e"
	.string	"d"
	.string	"i"
	.string	"r"
	.string	"e"
	.string	"c"
	.string	"i"
	.string	"o"
	.string	"n"
	.string	"a"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC140:
	.string	"L"
	.string	"i"
	.string	"m"
	.string	"i"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"t"
	.string	"a"
	.string	"m"
	.string	"a"
	.string	"n"
	.string	"h"
	.string	"o"
	.string	" "
	.string	"o"
	.string	"u"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"f"
	.string	"u"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"d"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"t"
	.string	"i"
	.string	"n"
	.string	"g"
	.string	"i"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC141:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"c"
	.string	"e"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"c"
	.string	"e"
	.string	"d"
	.string	"e"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"s"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"m"
	.string	"i"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"g"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC142:
	.string	"J"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"i"
	.string	"s"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"u"
	.string	"m"
	.string	"a"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"s"
	.string	"t"
	.string	"i"
	.string	"n"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"i"
	.string	"f"
	.string	"e"
	.string	"r"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC143:
	.string	"A"
	.string	" "
	.string	"p"
	.string	"a"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"i"
	.string	"s"
	.string	"t"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"s"
	.string	"u"
	.string	"b"
	.string	"s"
	.string	"t"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"a"
	.string	"l"
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC144:
	.string	"C"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"o"
	.string	"u"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"v"
	.string	"a"
	.string	"l"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC145:
	.string	"P"
	.string	"r"
	.string	"e"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	"e"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"-"
	.string	"l"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC146:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"r"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC147:
	.string	"O"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	" "
	.string	"r"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"s"
	.string	"o"
	.string	"u"
	.string	" "
	.string	"a"
	.string	" "
	.string	"a"
	.string	"b"
	.string	"e"
	.string	"r"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC148:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"S"
	.string	"H"
	.string	"A"
	.string	"-"
	.string	"2"
	.string	"5"
	.string	"6"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC149:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"g"
	.string	"r"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	"d"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"e"
	.string	"c"
	.string	"u"
	.string	"t"
	.string	"a"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC150:
	.string	"S"
	.string	"a"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"m"
	.string	"i"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"i"
	.string	"m"
	.string	"e"
	.string	"i"
	.string	"r"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"6"
	.string	"0"
	.string	"0"
	.string	"0"
	.string	" "
	.string	"b"
	.string	"y"
	.string	"t"
	.string	"e"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC151:
	.string	"O"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"r"
	.string	"e"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"n"
	.string	"o"
	.string	"u"
	.string	" "
	.string	"u"
	.string	"m"
	.string	" "
	.string	"e"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC152:
	.string	"A"
	.string	" "
	.string	"o"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"m"
	.string	"i"
	.string	"n"
	.string	"o"
	.string	"u"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"m"
	.string	" "
	.string	"e"
	.string	"r"
	.string	"r"
	.string	"o"
	.string	";"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"s"
	.string	"u"
	.string	"l"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"a"
	.string	" "
	.string	"s"
	.string	"a"
	.string	"i"
	.string	"d"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"c"
	.string	"i"
	.string	"m"
	.string	"a"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC153:
	.string	"C"
	.string	"o"
	.string	"m"
	.string	"p"
	.string	"i"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"t"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC154:
	.string	"E"
	.string	"x"
	.string	"t"
	.string	"r"
	.string	"a"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"o"
	.string	" "
	.string	"Z"
	.string	"I"
	.string	"P"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"m"
	.string	"p"
	.string	"l"
	.string	"e"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"e"
	.string	" "
	.string	"m"
	.string	"a"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"n"
	.string	"h"
	.string	"a"
	.string	" "
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
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"d"
	.string	"i"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC155:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC156:
	.string	"O"
	.string	" "
	.string	"W"
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"s"
	.string	" "
	.string	"n"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"o"
	.string	"u"
	.string	" "
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
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC157:
	.string	"T"
	.string	"e"
	.string	"m"
	.string	"p"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"i"
	.string	"m"
	.string	"i"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"d"
	.string	"a"
	.string	" "
	.string	"o"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"e"
	.string	"x"
	.string	"c"
	.string	"e"
	.string	"d"
	.string	"i"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC158:
	.string	"O"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"e"
	.string	"n"
	.string	"c"
	.string	"e"
	.string	"r"
	.string	"r"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"p"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"1"
	.string	"5"
	.string	" "
	.string	"s"
	.string	"e"
	.string	"g"
	.string	"u"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC159:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"n"
	.string	"a"
	.string	" "
	.string	"o"
	.string	"p"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC160:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"c"
	.string	"l"
	.string	"u"
	.string	"i"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"m"
	.string	"u"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"m"
	.string	" "
	.string	"o"
	.string	" "
	.string	"L"
	.string	"u"
	.string	"a"
	.string	"u"
	.string	" "
	.string	"l"
	.string	"o"
	.string	"c"
	.string	"a"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC161:
	.string	"N"
	.string	"o"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"c"
	.string	"r"
	.string	"i"
	.string	"p"
	.string	"t"
	.string	"."
	.string	" "
	.string	"M"
	.string	"e"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"i"
	.string	"s"
	.string	"m"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"d"
	.string	"i"
	.string	"s"
	.string	"p"
	.string	"o"
	.string	"n"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	"."
	.string	""
	.string	""
	.section	.rodata.str2.2
	.align 2
__const_editor_LC162:
	.string	"T"
	.string	"e"
	.string	"x"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"p"
	.string	"i"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 2
__const_editor_LC163:
	.string	"A"
	.string	"x"
	.string	"i"
	.string	"o"
	.string	"m"
	.string	""
	.string	""
	.section	.rodata.str2.8
	.align 8
__const_editor_LC164:
	.string	"L"
	.string	"i"
	.string	"m"
	.string	"p"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"t"
	.string	"e"
	.string	"x"
	.string	"t"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"d"
	.string	"i"
	.string	"t"
	.string	"o"
	.string	"r"
	.string	"?"
	.string	""
	.string	""
	.align 8
__const_editor_LC165:
	.string	"B"
	.string	"a"
	.string	"i"
	.string	"x"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"l"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC166:
	.string	"B"
	.string	"a"
	.string	"i"
	.string	"x"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"s"
	.string	"t"
	.string	"a"
	.string	"l"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	"r"
	.string	" "
	.string	"o"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"l"
	.string	"."
	.string	" "
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"e"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"s"
	.string	"t"
	.string	"i"
	.string	"n"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	"f"
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"d"
	.string	"o"
	.string	"s"
	.string	" "
	.string	"p"
	.string	"e"
	.string	"l"
	.string	"o"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC167:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"n"
	.string	"l"
	.string	"o"
	.string	"a"
	.string	"d"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC168:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	"w"
	.string	"n"
	.string	"l"
	.string	"o"
	.string	"a"
	.string	"d"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC169:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"R"
	.string	"o"
	.string	"b"
	.string	"l"
	.string	"o"
	.string	"x"
	.string	" "
	.string	"("
	.string	"s"
	.string	"o"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	")"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC170:
	.string	"V"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"a"
	.string	"r"
	.string	"q"
	.string	"u"
	.string	"i"
	.string	"v"
	.string	"o"
	.string	" "
	.string	"e"
	.string	" "
	.string	"m"
	.string	"e"
	.string	"m"
	.string	"o"
	.string	"r"
	.string	"i"
	.string	"a"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	","
	.string	" "
	.string	"s"
	.string	"e"
	.string	"m"
	.string	" "
	.string	"a"
	.string	"l"
	.string	"t"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"o"
	.string	" "
	.string	"p"
	.string	"r"
	.string	"o"
	.string	"c"
	.string	"e"
	.string	"s"
	.string	"s"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC171:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC172:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC173:
	.string	"C"
	.string	"o"
	.string	"n"
	.string	"e"
	.string	"c"
	.string	"t"
	.string	"a"
	.string	"n"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"e"
	.string	"m"
	.string	" "
	.string	"m"
	.string	"o"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	"."
	.string	"."
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC174:
	.string	"C"
	.string	"o"
	.string	"n"
	.string	"e"
	.string	"x"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"o"
	.string	"l"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"a"
	.string	":"
	.string	" "
	.string	"s"
	.string	"o"
	.string	"m"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	" "
	.string	"l"
	.string	"e"
	.string	"i"
	.string	"t"
	.string	"u"
	.string	"r"
	.string	"a"
	.string	";"
	.string	" "
	.string	"n"
	.string	"e"
	.string	"n"
	.string	"h"
	.string	"u"
	.string	"m"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"d"
	.string	"i"
	.string	"g"
	.string	"o"
	.string	" "
	.string	"s"
	.string	"e"
	.string	"r"
	.string	"a"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"j"
	.string	"e"
	.string	"t"
	.string	"a"
	.string	"d"
	.string	"o"
	.string	" "
	.string	"n"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC175:
	.string	"N"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"f"
	.string	"o"
	.string	"i"
	.string	" "
	.string	"p"
	.string	"o"
	.string	"s"
	.string	"s"
	.string	"i"
	.string	"v"
	.string	"e"
	.string	"l"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"c"
	.string	"o"
	.string	"n"
	.string	"e"
	.string	"x"
	.string	"a"
	.string	"o"
	.string	"."
	.string	""
	.string	""
	.align 8
__const_editor_LC176:
	.string	"F"
	.string	"a"
	.string	"l"
	.string	"h"
	.string	"a"
	.string	" "
	.string	"a"
	.string	"o"
	.string	" "
	.string	"i"
	.string	"n"
	.string	"i"
	.string	"c"
	.string	"i"
	.string	"a"
	.string	"r"
	.string	" "
	.string	"a"
	.string	" "
	.string	"v"
	.string	"e"
	.string	"r"
	.string	"i"
	.string	"f"
	.string	"i"
	.string	"c"
	.string	"a"
	.string	"c"
	.string	"a"
	.string	"o"
	.string	" "
	.string	"d"
	.string	"o"
	.string	" "
	.string	"c"
	.string	"l"
	.string	"i"
	.string	"e"
	.string	"n"
	.string	"t"
	.string	"e"
	.string	"."
	.string	""
	.string	""
	.text
	.type	window_proc, @function
window_proc:
	pushq	%rdi
	pushq	%rsi
	pushq	%rbx
	subq	$224, %rsp
	cmpl	$275, %edx
	je	.L237
	movq	%rcx, %rdi
	movq	%r8, %rbx
	movq	%r9, %rsi
	movl	%r8d, %ecx
	jbe	.L351
	cmpl	$32771, %edx
	je	.L247
	ja	.L248
	cmpl	$312, %edx
	je	.L249
	cmpl	$32770, %edx
	je	.L250
	cmpl	$307, %edx
	jne	.L244
	movl	$14210003, %edx
	movq	%r8, %rcx
	call	SetTextColor@PLT
	movl	$1117967, %edx
	movq	%rbx, %rcx
	call	SetBkColor@PLT
	movq	editorBrush(%rip), %rax
	jmp	.L236
.L351:
	cmpl	$36, %edx
	je	.L239
	ja	.L240
	cmpl	$5, %edx
	je	.L241
	cmpl	$16, %edx
	je	.L242
	cmpl	$2, %edx
	jne	.L244
	movl	$1, %edx
	movq	%rdi, %rcx
	call	KillTimer@PLT
	movq	uiFont(%rip), %rcx
	testq	%rcx, %rcx
	je	.L327
	call	DeleteObject@PLT
.L327:
	movq	headingFont(%rip), %rcx
	testq	%rcx, %rcx
	je	.L328
	call	DeleteObject@PLT
.L328:
	movq	codeFont(%rip), %rcx
	testq	%rcx, %rcx
	je	.L329
	call	DeleteObject@PLT
.L329:
	movq	bgBrush(%rip), %rcx
	testq	%rcx, %rcx
	je	.L330
	call	DeleteObject@PLT
.L330:
	movq	sideBrush(%rip), %rcx
	testq	%rcx, %rcx
	je	.L331
	call	DeleteObject@PLT
.L331:
	movq	editorBrush(%rip), %rcx
	testq	%rcx, %rcx
	je	.L332
	call	DeleteObject@PLT
.L332:
	movq	barBrush(%rip), %rcx
	testq	%rcx, %rcx
	je	.L333
	call	DeleteObject@PLT
.L333:
	movq	buttonBrush(%rip), %rcx
	testq	%rcx, %rcx
	je	.L334
	call	DeleteObject@PLT
.L334:
	movq	hotBrush(%rip), %rcx
	testq	%rcx, %rcx
	je	.L335
	call	DeleteObject@PLT
.L335:
	movl	$0, %ecx
	call	PostQuitMessage@PLT
	movl	$0, %eax
	jmp	.L236
.L240:
	cmpl	$43, %edx
	je	.L245
	cmpl	$273, %edx
	jne	.L244
	movzwl	%r8w, %eax
	shrl	$16, %ecx
	cmpl	$768, %ecx
	jne	.L303
	cmpl	$101, %eax
	jne	.L303
	cmpl	$0, ignoreChange(%rip)
	jne	.L304
	movl	$1, dirty(%rip)
.L304:
	movl	$-1, lastCount(%rip)
	movl	$0, %eax
	jmp	.L236
.L248:
	cmpl	$32772, %edx
	je	.L252
	cmpl	$32773, %edx
	jne	.L244
	movl	$0, localBusy(%rip)
	movl	$1, %edx
	movq	bcheck(%rip), %rcx
	call	EnableWindow@PLT
	movl	$1, %edx
	movq	brun(%rip), %rcx
	call	EnableWindow@PLT
	testq	%rsi, %rsi
	je	.L285
	cmpw	$0, 4(%rsi)
	jne	.L352
.L286:
	cmpl	$0, (%rsi)
	jne	.L353
.L285:
	cmpl	$1, %ebx
	je	.L354
	cmpl	$2, %ebx
	je	.L355
	cmpl	$3, %ebx
	je	.L356
	cmpl	$4, %ebx
	je	.L357
	cmpl	$5, %ebx
	je	.L358
	leaq	__const_editor_LC159(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC160(%rip), %rcx
	call	log_line
	jmp	.L290
.L239:
	movq	%r9, %rax
	testq	%r9, %r9
	je	.L236
	movl	$850, 24(%r9)
	movl	$550, 28(%r9)
	movl	$0, %eax
	jmp	.L236
.L241:
	movq	%rdi, %rcx
	call	layout
	movl	$0, %eax
	jmp	.L236
.L237:
	call	update_gutter
	movl	$0, %eax
	jmp	.L236
.L250:
	movl	%r9d, %edx
	call	install_event
	movl	$0, %eax
	jmp	.L236
.L247:
	movl	probeConnection(%rip), %edi
	movl	$1, %edx
	movq	bprobe(%rip), %rcx
	call	EnableWindow@PLT
	movl	$1, %edx
	movq	bconnect(%rip), %rcx
	call	EnableWindow@PLT
	movl	$0, probeConnection(%rip)
	cmpl	$1, %ebx
	je	.L359
	cmpl	$2, %ebx
	je	.L360
	cmpl	$3, %ebx
	je	.L361
	cmpl	$4, %ebx
	je	.L362
	cmpl	$5, %ebx
	je	.L363
	cmpl	$6, %ebx
	je	.L364
	cmpl	$7, %ebx
	je	.L365
	cmpl	$8, %ebx
	je	.L366
	cmpl	$9, %ebx
	je	.L367
	cmpl	$10, %ebx
	je	.L368
	cmpl	$11, %ebx
	je	.L369
	cmpl	$12, %ebx
	je	.L370
	leaq	__const_editor_LC117(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC118(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L359:
	testl	%edi, %edi
	leaq	__const_editor_LC87(%rip), %rcx
	leaq	__const_editor_LC86(%rip), %rax
	cmovne	%rax, %rcx
	call	set_status
	leaq	__const_editor_LC92(%rip), %rcx
	call	log_line
	testb	$4, %sil
	je	.L257
	leaq	__const_editor_LC93(%rip), %rcx
	call	log_line
.L258:
	leaq	__const_editor_LC95(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L257:
	leaq	__const_editor_LC94(%rip), %rcx
	call	log_line
	jmp	.L258
.L360:
	leaq	__const_editor_LC73(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC96(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L361:
	leaq	__const_editor_LC97(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC98(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L362:
	leaq	__const_editor_LC99(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC100(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L363:
	leaq	__const_editor_LC101(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC102(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L364:
	leaq	__const_editor_LC103(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC104(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L365:
	leaq	__const_editor_LC105(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC106(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L366:
	leaq	__const_editor_LC107(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC108(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L367:
	leaq	__const_editor_LC109(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC110(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L368:
	leaq	__const_editor_LC111(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC112(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L369:
	leaq	__const_editor_LC113(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC114(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L370:
	leaq	__const_editor_LC115(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC116(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L252:
	movl	$0, versionBusy(%rip)
	movl	$1, %edx
	movq	bprepare(%rip), %rcx
	call	EnableWindow@PLT
	movl	$1, %edx
	movq	blaunch(%rip), %rcx
	call	EnableWindow@PLT
	cmpl	$1, %ebx
	je	.L371
	cmpl	$2, %ebx
	je	.L372
	cmpl	$3, %ebx
	je	.L373
	cmpl	$4, %ebx
	je	.L374
	cmpl	$5, %ebx
	je	.L375
	cmpl	$6, %ebx
	je	.L376
	cmpl	$7, %ebx
	je	.L377
	cmpl	$8, %ebx
	je	.L378
	cmpl	$9, %ebx
	je	.L379
	cmpl	$10, %ebx
	je	.L380
	cmpl	$11, %ebx
	je	.L381
	cmpl	$12, %ebx
	je	.L382
	cmpl	$13, %ebx
	je	.L383
	cmpl	$14, %ebx
	je	.L384
	cmpl	$15, %ebx
	je	.L385
	leaq	__const_editor_LC148(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC149(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L371:
	leaq	__const_editor_LC119(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC120(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L372:
	leaq	__const_editor_LC121(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC122(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L373:
	leaq	__const_editor_LC123(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC124(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L374:
	leaq	__const_editor_LC125(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC126(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L375:
	leaq	__const_editor_LC127(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC128(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L376:
	leaq	__const_editor_LC129(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC130(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L377:
	leaq	__const_editor_LC105(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC131(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L378:
	leaq	__const_editor_LC132(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC133(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L379:
	leaq	__const_editor_LC134(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC135(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L380:
	leaq	__const_editor_LC136(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC137(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L381:
	leaq	__const_editor_LC138(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC139(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L382:
	leaq	__const_editor_LC140(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC141(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L383:
	leaq	__const_editor_LC142(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC143(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L384:
	leaq	__const_editor_LC144(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC145(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L385:
	leaq	__const_editor_LC146(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC147(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L352:
	leaq	4(%rsi), %rcx
	call	log_line
	jmp	.L286
.L353:
	leaq	__const_editor_LC150(%rip), %rcx
	call	log_line
	jmp	.L285
.L354:
	cmpl	$0, localCheck(%rip)
	leaq	__const_editor_LC89(%rip), %rcx
	leaq	__const_editor_LC88(%rip), %rax
	cmovne	%rax, %rcx
	call	set_status
	cmpl	$0, localCheck(%rip)
	leaq	__const_editor_LC91(%rip), %rcx
	leaq	__const_editor_LC90(%rip), %rax
	cmovne	%rax, %rcx
	call	log_line
.L290:
	movq	%rsi, %rcx
	call	release
	movl	$0, %eax
	jmp	.L236
.L355:
	leaq	__const_editor_LC151(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC152(%rip), %rcx
	call	log_line
	jmp	.L290
.L356:
	leaq	__const_editor_LC153(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC154(%rip), %rcx
	call	log_line
	jmp	.L290
.L357:
	leaq	__const_editor_LC155(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC156(%rip), %rcx
	call	log_line
	jmp	.L290
.L358:
	leaq	__const_editor_LC157(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC158(%rip), %rcx
	call	log_line
	jmp	.L290
.L245:
	testq	%r9, %r9
	je	.L340
	cmpq	$0, 24(%r9)
	je	.L341
	movdqu	40(%r9), %xmm0
	movaps	%xmm0, 48(%rsp)
	testb	$1, 16(%r9)
	movq	hotBrush(%rip), %r8
	cmove	buttonBrush(%rip), %r8
	leaq	48(%rsp), %rdx
	movq	32(%r9), %rcx
	call	FillRect@PLT
	movq	32(%rsi), %rcx
	movl	$1, %edx
	call	SetBkMode@PLT
	movl	16(%rsi), %eax
	andl	$4, %eax
	cmpl	$1, %eax
	sbbl	%edx, %edx
	andl	$7698038, %edx
	addl	$6446429, %edx
	movq	32(%rsi), %rcx
	call	SetTextColor@PLT
	movq	uiFont(%rip), %rdx
	testq	%rdx, %rdx
	je	.L386
.L299:
	movq	32(%rsi), %rcx
	call	SelectObject@PLT
	movq	%rax, %rbx
	leaq	64(%rsp), %rdi
	movq	24(%rsi), %rcx
	movl	$80, %r8d
	movq	%rdi, %rdx
	call	GetWindowTextW@PLT
	movq	32(%rsi), %rcx
	movl	$37, 32(%rsp)
	leaq	48(%rsp), %r9
	movl	$-1, %r8d
	movq	%rdi, %rdx
	call	DrawTextW@PLT
	movq	32(%rsi), %rcx
	movq	%rbx, %rdx
	call	SelectObject@PLT
	movl	$1, %eax
.L295:
	cltq
	jmp	.L236
.L386:
	movl	$17, %ecx
	call	GetStockObject@PLT
	movq	%rax, %rdx
	jmp	.L299
.L340:
	movl	$0, %eax
	jmp	.L295
.L341:
	movl	$0, %eax
	jmp	.L295
.L249:
	cmpq	gutter(%rip), %r9
	je	.L300
	cmpq	output(%rip), %r9
	je	.L300
	cmpq	%r9, disabledLabel(%rip)
	movl	$14736604, %edx
	movl	$7893104, %eax
	cmove	%eax, %edx
	movq	%r8, %rcx
	call	SetTextColor@PLT
	movl	$1381139, %edx
	movq	%rbx, %rcx
	call	SetBkColor@PLT
	movq	sideBrush(%rip), %rax
	jmp	.L236
.L300:
	movl	$9143171, %edx
	movq	%rbx, %rcx
	call	SetTextColor@PLT
	movl	$1117967, %edx
	movq	%rbx, %rcx
	call	SetBkColor@PLT
	movq	editorBrush(%rip), %rax
	jmp	.L236
.L303:
	cmpl	$109, %eax
	je	.L305
	ja	.L306
	cmpl	$105, %eax
	je	.L307
	jbe	.L387
	cmpl	$107, %eax
	je	.L312
	cmpl	$108, %eax
	je	.L388
	movl	$36, %r9d
	leaq	__const_editor_LC163(%rip), %r8
	leaq	__const_editor_LC164(%rip), %rdx
	movq	%rdi, %rcx
	call	MessageBoxW@PLT
	movl	%eax, %edx
	movl	$0, %eax
	cmpl	$6, %edx
	jne	.L236
	leaq	__const_editor_LC41(%rip), %rdx
	movq	editor(%rip), %rcx
	call	SetWindowTextW@PLT
	movl	$0, %eax
	jmp	.L236
.L387:
	cmpl	$103, %eax
	je	.L309
	cmpl	$104, %eax
	je	.L310
	cmpl	$102, %eax
	jne	.L244
	movq	%rdi, %rcx
	call	open_file
	movl	$0, %eax
	jmp	.L236
.L306:
	cmpl	$113, %eax
	je	.L315
	ja	.L316
	cmpl	$111, %eax
	je	.L317
	cmpl	$112, %eax
	je	.L389
	movl	$0, %edx
	movq	binstall(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC165(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC166(%rip), %rcx
	call	log_line
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movq	%rdi, %r9
	leaq	installer_worker(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	CreateThread@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L390
	call	CloseHandle@PLT
	movl	$0, %eax
	jmp	.L236
.L316:
	cmpl	$114, %eax
	je	.L320
	cmpl	$115, %eax
	jne	.L244
	movl	$0, %edx
	movq	%rdi, %rcx
	call	start_local
	movl	$0, %eax
	jmp	.L236
.L310:
	movq	%rdi, %rcx
	call	can_discard
	movl	%eax, %edx
	movl	$0, %eax
	testl	%edx, %edx
	je	.L236
	movl	$1, ignoreChange(%rip)
	leaq	__const_editor_LC41(%rip), %rdx
	movq	editor(%rip), %rcx
	call	SetWindowTextW@PLT
	movl	$0, ignoreChange(%rip)
	movw	$0, currentPath(%rip)
	movl	$0, dirty(%rip)
	movl	$-1, lastCount(%rip)
	leaq	__const_editor_LC54(%rip), %rdx
	movq	tabLabel(%rip), %rcx
	call	SetWindowTextW@PLT
	leaq	__const_editor_LC161(%rip), %rcx
	call	set_status
	movl	$0, %eax
	jmp	.L236
.L309:
	movq	%rdi, %rcx
	call	save_current
	movl	$0, %eax
	jmp	.L236
.L307:
	movl	$0, 48(%rsp)
	movl	$0, 64(%rsp)
	leaq	64(%rsp), %r9
	leaq	48(%rsp), %r8
	movl	$176, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	movl	64(%rsp), %eax
	cmpl	%eax, 48(%rsp)
	je	.L391
.L322:
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$769, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	movl	48(%rsp), %r8d
	movl	64(%rsp), %r9d
	cmpl	%r9d, %r8d
	je	.L392
.L323:
	leaq	__const_editor_LC162(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L391:
	movq	$-1, %r9
	movl	$0, %r8d
	movl	$177, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	jmp	.L322
.L392:
	movl	%r9d, %r9d
	movl	%r8d, %r8d
	movl	$177, %edx
	movq	editor(%rip), %rcx
	call	SendMessageW@PLT
	jmp	.L323
.L312:
	call	scan_clients
	movl	$0, %eax
	jmp	.L236
.L390:
	movl	$1, %edx
	movq	binstall(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC167(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC168(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L317:
	movl	$0, probeConnection(%rip)
	movl	$0, %edx
	movq	bprobe(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC169(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC170(%rip), %rcx
	call	log_line
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movq	%rdi, %r9
	leaq	probe_worker(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	CreateThread@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L393
	call	CloseHandle@PLT
	movl	$0, %eax
	jmp	.L236
.L393:
	movl	$1, %edx
	movq	bprobe(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC171(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC172(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L388:
	movl	$0, %eax
	cmpl	$0, probeConnection(%rip)
	jne	.L236
	movl	$1, probeConnection(%rip)
	movl	$0, %edx
	movq	bconnect(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC173(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC174(%rip), %rcx
	call	log_line
	movq	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movq	%rdi, %r9
	leaq	probe_worker(%rip), %r8
	movl	$0, %edx
	movl	$0, %ecx
	call	CreateThread@PLT
	movq	%rax, %rcx
	testq	%rax, %rax
	je	.L394
	call	CloseHandle@PLT
	movl	$0, %eax
	jmp	.L236
.L394:
	movl	$0, probeConnection(%rip)
	movl	$1, %edx
	movq	bconnect(%rip), %rcx
	call	EnableWindow@PLT
	leaq	__const_editor_LC175(%rip), %rcx
	call	set_status
	leaq	__const_editor_LC176(%rip), %rcx
	call	log_line
	movl	$0, %eax
	jmp	.L236
.L305:
	movl	$0, %edx
	movq	%rdi, %rcx
	call	start_local
	movl	$0, %eax
	jmp	.L236
.L389:
	movl	$0, %edx
	movq	%rdi, %rcx
	call	start_version_worker
	movl	$0, %eax
	jmp	.L236
.L315:
	movl	$1, %edx
	movq	%rdi, %rcx
	call	start_version_worker
	movl	$0, %eax
	jmp	.L236
.L320:
	movl	$1, %edx
	movq	%rdi, %rcx
	call	start_local
	movl	$0, %eax
	jmp	.L236
.L242:
	movq	%rdi, %rcx
	call	can_discard
	movl	%eax, %edx
	movl	$0, %eax
	testl	%edx, %edx
	je	.L236
	movq	%rdi, %rcx
	call	DestroyWindow@PLT
	movl	$0, %eax
	jmp	.L236
.L244:
	movq	%rsi, %r9
	movq	%rbx, %r8
	movq	%rdi, %rcx
	call	DefWindowProcW@PLT
.L236:
	addq	$224, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.size	window_proc, .-window_proc
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	movq	%rcx, %rax
	testq	%r8, %r8
	je	.L396
	movl	$0, %r9d
.L397:
	movzbl	(%rdx,%r9), %r10d
	movb	%r10b, (%rax,%r9)
	addq	$1, %r9
	cmpq	%r8, %r9
	jne	.L397
.L396:
	ret
	.size	memcpy, .-memcpy
	.data
	.align 4
	.type	lastVisible, @object
	.size	lastVisible, 4
lastVisible:
	.long	-1
	.align 4
	.type	lastCount, @object
	.size	lastCount, 4
lastCount:
	.long	-1
	.align 4
	.type	lastFirst, @object
	.size	lastFirst, 4
lastFirst:
	.long	-1
	.globl probeConnection
	.comm	probeConnection,4,4
	.globl localCheck
	.comm	localCheck,4,4
	.globl localBusy
	.comm	localBusy,4,4
	.globl versionBusy
	.comm	versionBusy,4,4
	.globl editorHeight
	.comm	editorHeight,4,4
	.globl ignoreChange
	.comm	ignoreChange,4,4
	.globl dirty
	.comm	dirty,4,4
	.globl currentPath
	.comm	currentPath,2048,32
	.globl hotBrush
	.comm	hotBrush,8,8
	.globl buttonBrush
	.comm	buttonBrush,8,8
	.globl barBrush
	.comm	barBrush,8,8
	.globl editorBrush
	.comm	editorBrush,8,8
	.globl sideBrush
	.comm	sideBrush,8,8
	.globl bgBrush
	.comm	bgBrush,8,8
	.globl codeFont
	.comm	codeFont,8,8
	.globl headingFont
	.comm	headingFont,8,8
	.globl uiFont
	.comm	uiFont,8,8
	.globl brun
	.comm	brun,8,8
	.globl bcheck
	.comm	bcheck,8,8
	.globl blaunch
	.comm	blaunch,8,8
	.globl bprepare
	.comm	bprepare,8,8
	.globl bprobe
	.comm	bprobe,8,8
	.globl binstall
	.comm	binstall,8,8
	.globl bexecute
	.comm	bexecute,8,8
	.globl bconnect
	.comm	bconnect,8,8
	.globl bclients
	.comm	bclients,8,8
	.globl bclear
	.comm	bclear,8,8
	.globl bcopy
	.comm	bcopy,8,8
	.globl bnew
	.comm	bnew,8,8
	.globl bsave
	.comm	bsave,8,8
	.globl bopen
	.comm	bopen,8,8
	.globl disabledLabel
	.comm	disabledLabel,8,8
	.globl outputLabel
	.comm	outputLabel,8,8
	.globl tabLabel
	.comm	tabLabel,8,8
	.globl scriptLabel
	.comm	scriptLabel,8,8
	.globl explorerLabel
	.comm	explorerLabel,8,8
	.globl titleLabel
	.comm	titleLabel,8,8
	.globl sidebar
	.comm	sidebar,8,8
	.globl statusText
	.comm	statusText,8,8
	.globl output
	.comm	output,8,8
	.globl gutter
	.comm	gutter,8,8
	.globl editor
	.comm	editor,8,8
	.globl module
	.comm	module,8,8
	.globl	axiom_relocation_anchor
	.section	.data.rel.local,"aw"
	.align 8
	.type	axiom_relocation_anchor, @object
	.size	axiom_relocation_anchor, 8
axiom_relocation_anchor:
	.quad	start
	.hidden	probe_worker
	.hidden	installer_worker
	.hidden	localrun_start
	.hidden	version_worker_prepare
	.hidden	version_worker_launch
	.section	.note.GNU-stack,"",@progbits
