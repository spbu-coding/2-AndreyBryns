	.file	"sort.c"
	.text
	.globl	_sort
	.def	_sort;	.scl	2;	.type	32;	.endef
_sort:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	$0, -12(%ebp)
	jmp	L2
L6:
	movl	$0, -16(%ebp)
	jmp	L3
L5:
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ecx
	movl	4(%eax), %ebx
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	cmpl	%ecx, %eax
	movl	%edx, %eax
	sbbl	%ebx, %eax
	jge	L4
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	leal	0(,%edx,8), %ecx
	movl	8(%ebp), %edx
	addl	%edx, %ecx
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	movl	-12(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-20(%ebp), %eax
	cltd
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
L4:
	addl	$1, -16(%ebp)
L3:
	movl	-16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jl	L5
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cmpl	%eax, 12(%ebp)
	ja	L6
	nop
	nop
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
	.ident	"GCC: (tdm-1) 9.2.0"
