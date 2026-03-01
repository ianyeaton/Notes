	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 26, 0	sdk_version 26, 2
	.globl	_counter                        ; -- Begin function counter
	.p2align	2
_counter:                               ; @counter
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, _counter.count@PAGE
	ldr	w9, [x8, _counter.count@PAGEOFF]
	add	w9, w9, #1
	str	w9, [x8, _counter.count@PAGEOFF]
	ldr	w8, [x8, _counter.count@PAGEOFF]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_stack_demo                     ; -- Begin function stack_demo
	.p2align	2
_stack_demo:                            ; @stack_demo
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	mov	w8, #100                        ; =0x64
	str	w8, [sp, #28]
	adrp	x8, l___const.stack_demo.arr@PAGE
	add	x8, x8, l___const.stack_demo.arr@PAGEOFF
	ldr	q0, [x8]
	str	q0, [sp, #32]
	ldr	w8, [x8, #16]
	str	w8, [sp, #48]
	ldr	w8, [sp, #28]
	mov	x10, x8
	ldr	w8, [sp, #40]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	b.eq	LBB1_2
	b	LBB1_1
LBB1_1:
	bl	___stack_chk_fail
LBB1_2:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_heap_demo                      ; -- Begin function heap_demo
	.p2align	2
_heap_demo:                             ; @heap_demo
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, #20                         ; =0x14
	bl	_malloc
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	cbnz	x8, LBB2_2
	b	LBB2_1
LBB2_1:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
	b	LBB2_7
LBB2_2:
	stur	wzr, [x29, #-12]
	b	LBB2_3
LBB2_3:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-12]
	subs	w8, w8, #5
	b.ge	LBB2_6
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_3 Depth=1
	ldur	w8, [x29, #-12]
	mov	w9, #10                         ; =0xa
	mul	w8, w8, w9
	ldur	x9, [x29, #-8]
	ldursw	x10, [x29, #-12]
	str	w8, [x9, x10, lsl #2]
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_3 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB2_3
LBB2_6:
	ldur	x8, [x29, #-8]
	ldr	w8, [x8, #12]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-8]
	bl	_free
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB2_7
LBB2_7:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_version_info                   ; -- Begin function version_info
	.p2align	2
_version_info:                          ; @version_info
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0                          ; =0x0
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	adrp	x8, _greeting@PAGE
	ldr	x8, [x8, _greeting@PAGEOFF]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	adrp	x8, _global_initialized@PAGE
	ldr	w8, [x8, _global_initialized@PAGEOFF]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	adrp	x8, _global_uninitialized@GOTPAGE
	ldr	x8, [x8, _global_uninitialized@GOTPAGEOFF]
	ldr	w8, [x8]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	bl	_counter
	bl	_counter
	bl	_counter
	bl	_stack_demo
	bl	_heap_demo
	bl	_version_info
	mov	w8, #10                         ; =0xa
	stur	w8, [x29, #-12]
	mov	w8, #20                         ; =0x14
	stur	w8, [x29, #-8]
	ldur	w8, [x29, #-12]
	mov	x10, x8
	ldur	w8, [x29, #-8]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #16]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_global_initialized             ; @global_initialized
	.p2align	2, 0x0
_global_initialized:
	.long	42                              ; 0x2a

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Hello from rodata"

	.section	__DATA,__data
	.globl	_greeting                       ; @greeting
	.p2align	3, 0x0
_greeting:
	.quad	l_.str

.zerofill __DATA,__bss,_counter.count,4,2 ; @counter.count
	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"Called %d times\n"

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @__const.stack_demo.arr
l___const.stack_demo.arr:
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.long	4                               ; 0x4
	.long	5                               ; 0x5

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"Stack var: %d, arr[2]: %d\n"

l_.str.3:                               ; @.str.3
	.asciz	"malloc failed\n"

l_.str.4:                               ; @.str.4
	.asciz	"Heap value: %d\n"

l_.str.5:                               ; @.str.5
	.asciz	"Debug build\n"

l_.str.6:                               ; @.str.6
	.asciz	"Version 1\n"

l_.str.7:                               ; @.str.7
	.asciz	"%s\n"

l_.str.8:                               ; @.str.8
	.asciz	"Global initialized: %d\n"

l_.str.9:                               ; @.str.9
	.asciz	"Global uninitialized: %d\n"

	.comm	_global_uninitialized,4,2       ; @global_uninitialized
l_.str.10:                              ; @.str.10
	.asciz	"Point: %d, %d\n"

.subsections_via_symbols
