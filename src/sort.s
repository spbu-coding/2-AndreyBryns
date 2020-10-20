.text
	.file	"sort.c"
	.globl	_Z4sortPxj              # -- Begin function _Z4sortPxj
	.p2align	4, 0x90
	.type	_Z4sortPxj,@function
_Z4sortPxj:                             # @_Z4sortPxj
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jae	.LBB0_10
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$0, -20(%rbp)
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_8
# %bb.4:                                # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-8(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	cmpq	(%rcx,%rdx,8), %rax
	jle	.LBB0_6
# %bb.5:                                # %if.then
                                        #   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	%eax, %edx
	movl	%edx, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rsi
	movq	%rax, (%rcx,%rsi,8)
	movslq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	movslq	-16(%rbp), %rsi
	movq	%rax, (%rcx,%rsi,8)
.LBB0_6:                                # %if.end
                                        #   in Loop: Header=BB0_3 Depth=2
	jmp	.LBB0_7
.LBB0_7:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_9
.LBB0_9:                                # %for.inc16
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_10:                               # %for.end18
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z4sortPxj, .Lfunc_end0-_Z4sortPxj
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 7.0.0 (git@github.com:apple/swift-clang.git 5c9d04dc0697297a47b5edb0c1a581b306a42bdb) (git@github.com:apple/swift-llvm.git 34250a6eef79ee8a83c5cfb4deb1583176dcbb63)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z4sortPxj