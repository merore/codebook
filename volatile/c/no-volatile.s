	.file	"no-volatile.c"
	.text
	.align	2
	.globl	threadA
	.type	threadA, @function
threadA:
.LFB6 = .
	.cfi_startproc
	la.local	$r12,i
	ldptr.w	$r12,$r12,0
	bnez	$r12,.L5
.L4:
	b	.L4
.L5:
	jr	$r1
	.cfi_endproc
.LFE6:
	.size	threadA, .-threadA
	.align	2
	.globl	threadB
	.type	threadB, @function
threadB:
.LFB7 = .
	.cfi_startproc
	la.local	$r12,i
	addi.w	$r13,$r0,1			# 0x1
	stptr.w	$r13,$r12,0
	jr	$r1
	.cfi_endproc
.LFE7:
	.size	threadB, .-threadB
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB8 = .
	.cfi_startproc
	addi.d	$r3,$r3,-48
	.cfi_def_cfa_offset 48
	or	$r7,$r0,$r0
	la.local	$r6,threadA
	or	$r5,$r0,$r0
	addi.d	$r4,$r3,8
	st.d	$r1,$r3,40
	.cfi_offset 1, -8
	bl	%plt(pthread_create)
	or	$r7,$r0,$r0
	la.local	$r6,threadB
	or	$r5,$r0,$r0
	addi.d	$r4,$r3,16
	bl	%plt(pthread_create)
	ld.d	$r4,$r3,8
	addi.d	$r5,$r3,24
	bl	%plt(pthread_join)
	ld.d	$r4,$r3,16
	addi.d	$r5,$r3,24
	bl	%plt(pthread_join)
	ld.d	$r1,$r3,40
	.cfi_restore 1
	or	$r4,$r0,$r0
	addi.d	$r3,$r3,48
	.cfi_def_cfa_offset 0
	jr	$r1
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.globl	i
	.section	.bss,"aw",@nobits
	.align	2
	.type	i, @object
	.size	i, 4
i:
	.space	4
	.ident	"GCC: (Loongnix 8.3.0-6.lnd.vec.31) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
