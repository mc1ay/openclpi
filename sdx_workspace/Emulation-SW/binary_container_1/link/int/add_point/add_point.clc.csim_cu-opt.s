	.file	"/data/workspace_picalc/Emulation-SW/binary_container_1/link/int/add_point/add_point.clc.csim_cu-opt.bc"
	.file	1 "/data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl"
	.section	.debug_info,"",@progbits
.Lsection_info:
	.section	.debug_abbrev,"",@progbits
.Lsection_abbrev:
	.section	.debug_aranges,"",@progbits
	.section	.debug_macinfo,"",@progbits
	.section	.debug_line,"",@progbits
.Lsection_line:
	.section	.debug_loc,"",@progbits
	.section	.debug_pubtypes,"",@progbits
	.section	.debug_str,"MS",@progbits,1
.Lsection_str:
	.section	.debug_ranges,"",@progbits
.Ldebug_range:
	.section	.debug_loc,"",@progbits
.Lsection_debug_loc:
	.text
.Ltext_begin:
	.data
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI0_0:
	.long	796917760               # float 2.328306e-10
                                        #  (0x2f800000)
.LCPI0_1:
	.long	1065353216              # float 1.000000e+00
                                        #  (0x3f800000)
	.text
	.globl	add_point
	.align	16, 0x90
	.type	add_point,@function
add_point:                              # @add_point
	.cfi_startproc
.Lfunc_begin0:
	.loc	1 4 0                   # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:4:0
# BB#0:
	pushq	%rbp
.Ltmp7:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp8:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp9:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp10:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp11:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp12:
	.cfi_def_cfa_offset 56
	pushq	%rax
.Ltmp13:
	.cfi_def_cfa_offset 64
.Ltmp14:
	.cfi_offset %rbx, -56
.Ltmp15:
	.cfi_offset %r12, -48
.Ltmp16:
	.cfi_offset %r13, -40
.Ltmp17:
	.cfi_offset %r14, -32
.Ltmp18:
	.cfi_offset %r15, -24
.Ltmp19:
	.cfi_offset %rbp, -16
	#DEBUG_VALUE: add_point:prng_state <- RDX+0
	#DEBUG_VALUE: add_point:inside <- RSI+0
	movq	%rdx, %r13
.Ltmp20:
	#DEBUG_VALUE: add_point:prng_state <- R13+0
	movq	%rsi, %r14
.Ltmp21:
	#DEBUG_VALUE: add_point:inside <- R14+0
	movq	%rdi, %r15
	movl	(%rcx), %r12d
	xorl	%ebx, %ebx
.Ltmp22:
	.align	16, 0x90
.LBB0_1:                                # %kernel.loop.0.split
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: add_point:prng_state <- R13+0
	movl	64(%r15), %ebp
	.loc	1 5 26 prologue_end     # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:5:26
.Ltmp23:
	imulq	%r12, %rbp
	addq	%rbx, %rbp
	movl	(%r13,%rbp,4), %ecx
.Ltmp24:
	#DEBUG_VALUE: add_point:state <- ECX+0
	.loc	1 8 20                  # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:8:20
	movl	%ecx, %eax
	shll	$13, %eax
	.loc	1 8 11                  # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:8:11
	xorl	%ecx, %eax
.Ltmp25:
	#DEBUG_VALUE: add_point:state <- EAX+0
	.loc	1 9 20                  # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:9:20
	movl	%eax, %ecx
	shrl	$17, %ecx
	.loc	1 9 11                  # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:9:11
	xorl	%eax, %ecx
.Ltmp26:
	#DEBUG_VALUE: add_point:state <- ECX+0
	.loc	1 10 20                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:10:20
	movl	%ecx, %eax
	shll	$5, %eax
	.loc	1 10 11                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:10:11
	xorl	%ecx, %eax
.Ltmp27:
	#DEBUG_VALUE: add_point:state <- EAX+0
	.loc	1 17 20                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:17:20
	movl	%eax, %ecx
	shll	$13, %ecx
	.loc	1 17 11                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:17:11
	xorl	%eax, %ecx
.Ltmp28:
	#DEBUG_VALUE: add_point:state <- ECX+0
	.loc	1 18 20                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:18:20
	movl	%ecx, %edx
	shrl	$17, %edx
	.loc	1 18 11                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:18:11
	xorl	%ecx, %edx
.Ltmp29:
	#DEBUG_VALUE: add_point:state <- EDX+0
	.loc	1 19 20                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:19:20
	movl	%edx, %ecx
	shll	$5, %ecx
	.loc	1 19 11                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:19:11
	xorl	%edx, %ecx
.Ltmp30:
	#DEBUG_VALUE: add_point:state <- ECX+0
	.loc	1 26 62                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:26:62
	movl	%ecx, (%r13,%rbp,4)
	.loc	1 23 15                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:23:15
	cvtsi2ssq	%rcx, %xmm1
	.loc	1 14 15                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:14:15
	cvtsi2ssq	%rax, %xmm0
	movss	.LCPI0_0(%rip), %xmm2
	.loc	1 23 21                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:23:21
	mulss	%xmm2, %xmm1
.Ltmp31:
	#DEBUG_VALUE: add_point:y <- XMM1+0
	.loc	1 14 21                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:14:21
	mulss	%xmm2, %xmm0
.Ltmp32:
	#DEBUG_VALUE: add_point:x <- XMM0+0
	.loc	1 29 24                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:29:24
	mulss	%xmm1, %xmm1
.Ltmp33:
	.loc	1 29 20                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:29:20
	mulss	%xmm0, %xmm0
.Ltmp34:
	addss	%xmm1, %xmm0
	.loc	1 29 9                  # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:29:9
	callq	hls_sqrt@PLT
	movss	.LCPI0_1(%rip), %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.LBB0_3
.Ltmp35:
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: add_point:prng_state <- R13+0
	.loc	1 30 59                 # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:30:59
	movb	$1, (%r14,%rbp)
.Ltmp36:
.LBB0_3:                                # %kernel.loop.inc0
                                        #   in Loop: Header=BB0_1 Depth=1
	#DEBUG_VALUE: add_point:prng_state <- R13+0
	.loc	1 32 1                  # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:32:1
	incq	%rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB0_1
.Ltmp37:
# BB#4:                                 # %.split
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp38:
.Ltmp39:
	.size	add_point, .Ltmp39-add_point
.Lfunc_end0:
	.cfi_endproc

	.globl	__stub____xlnx_cl_single_thread_add_point
	.align	16, 0x90
	.type	__stub____xlnx_cl_single_thread_add_point,@function
__stub____xlnx_cl_single_thread_add_point: # @__stub____xlnx_cl_single_thread_add_point
	.cfi_startproc
.Lfunc_begin1:
	.loc	1 4 0                   # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:4:0
# BB#0:
	.loc	1 4 0 prologue_end      # /data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl:4:0
	movq	24(%rdi), %rax
	movq	(%rax), %rcx
	movq	16(%rdi), %rax
	movq	(%rax), %rdx
	movq	(%rdi), %rax
	movq	8(%rdi), %rsi
	movq	(%rsi), %rsi
	movq	(%rax), %rdi
	jmp	add_point@PLT           # TAILCALL
.Ltmp40:
.Ltmp41:
	.size	__stub____xlnx_cl_single_thread_add_point, .Ltmp41-__stub____xlnx_cl_single_thread_add_point
.Lfunc_end1:
	.cfi_endproc

	.cfi_sections .debug_frame
.Ltext_end:
	.data
.Ldata_end:
	.text
.Lsection_end1:
	.section	.debug_info,"",@progbits
.Linfo_begin1:
	.long	210                     # Length of Compilation Unit Info
	.short	2                       # DWARF version number
	.long	.Labbrev_begin          # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0xcb DW_TAG_compile_unit
	.long	.Lstring0               # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Lstring1               # DW_AT_name
	.quad	0                       # DW_AT_low_pc
	.long	.Lsection_line          # DW_AT_stmt_list
	.long	.Lstring2               # DW_AT_comp_dir
	.byte	1                       # DW_AT_APPLE_optimized
	.byte	2                       # Abbrev [2] 0x27:0x73 DW_TAG_subprogram
	.long	.Lstring3               # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	1                       # DW_AT_prototyped
	.byte	1                       # DW_AT_external
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.quad	.Lfunc_end0             # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.byte	1                       # DW_AT_APPLE_omit_frame_ptr
	.byte	3                       # Abbrev [3] 0x43:0xf DW_TAG_formal_parameter
	.long	.Lstring6               # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	196                     # DW_AT_type
.Lset0 = .Ldebug_loc4-.Lsection_debug_loc # DW_AT_location
	.long	.Lset0
	.byte	3                       # Abbrev [3] 0x52:0xf DW_TAG_formal_parameter
	.long	.Lstring8               # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	208                     # DW_AT_type
.Lset1 = .Ldebug_loc0-.Lsection_debug_loc # DW_AT_location
	.long	.Lset1
	.byte	4                       # Abbrev [4] 0x61:0xf DW_TAG_variable
	.long	.Lstring10              # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	5                       # DW_AT_decl_line
	.long	201                     # DW_AT_type
.Lset2 = .Ldebug_loc7-.Lsection_debug_loc # DW_AT_location
	.long	.Lset2
	.byte	4                       # Abbrev [4] 0x70:0xf DW_TAG_variable
	.long	.Lstring11              # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	23                      # DW_AT_decl_line
	.long	182                     # DW_AT_type
.Lset3 = .Ldebug_loc15-.Lsection_debug_loc # DW_AT_location
	.long	.Lset3
	.byte	4                       # Abbrev [4] 0x7f:0xf DW_TAG_variable
	.long	.Lstring12              # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	14                      # DW_AT_decl_line
	.long	182                     # DW_AT_type
.Lset4 = .Ldebug_loc17-.Lsection_debug_loc # DW_AT_location
	.long	.Lset4
	.byte	5                       # Abbrev [5] 0x8e:0xb DW_TAG_formal_parameter
	.long	.Lstring13              # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.long	208                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x9a:0x1c DW_TAG_subprogram
	.long	.Lstring4               # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	4                       # DW_AT_decl_line
	.byte	1                       # DW_AT_prototyped
	.byte	1                       # DW_AT_external
	.quad	.Lfunc_begin1           # DW_AT_low_pc
	.quad	.Lfunc_end1             # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	87
	.byte	1                       # DW_AT_APPLE_omit_frame_ptr
	.byte	7                       # Abbrev [7] 0xb6:0x7 DW_TAG_base_type
	.long	.Lstring5               # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0xbd:0x7 DW_TAG_base_type
	.long	.Lstring7               # DW_AT_name
	.byte	2                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	8                       # Abbrev [8] 0xc4:0x5 DW_TAG_pointer_type
	.long	189                     # DW_AT_type
	.byte	7                       # Abbrev [7] 0xc9:0x7 DW_TAG_base_type
	.long	.Lstring9               # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	8                       # Abbrev [8] 0xd0:0x5 DW_TAG_pointer_type
	.long	201                     # DW_AT_type
	.byte	0                       # End Of Children Mark
.Linfo_end1:
	.section	.debug_abbrev,"",@progbits
.Labbrev_begin:
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	16                      # DW_AT_stmt_list
	.byte	6                       # DW_FORM_data4
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	 "\341\177"             # DW_AT_APPLE_optimized
	.byte	12                      # DW_FORM_flag
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	12                      # DW_FORM_flag
	.byte	63                      # DW_AT_external
	.byte	12                      # DW_FORM_flag
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	1                       # DW_FORM_addr
	.byte	64                      # DW_AT_frame_base
	.byte	10                      # DW_FORM_block1
	.ascii	 "\347\177"             # DW_AT_APPLE_omit_frame_ptr
	.byte	12                      # DW_FORM_flag
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	2                       # DW_AT_location
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	2                       # DW_AT_location
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	12                      # DW_FORM_flag
	.byte	63                      # DW_AT_external
	.byte	12                      # DW_FORM_flag
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	1                       # DW_FORM_addr
	.byte	64                      # DW_AT_frame_base
	.byte	10                      # DW_FORM_block1
	.ascii	 "\347\177"             # DW_AT_APPLE_omit_frame_ptr
	.byte	12                      # DW_FORM_flag
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
.Labbrev_end:
	.section	.debug_pubtypes,"",@progbits
.Lset5 = .Lpubtypes_end1-.Lpubtypes_begin1 # Length of Public Types Info
	.long	.Lset5
.Lpubtypes_begin1:
	.short	2                       # DWARF Version
	.long	.Linfo_begin1           # Offset of Compilation Unit Info
.Lset6 = .Linfo_end1-.Linfo_begin1      # Compilation Unit Length
	.long	.Lset6
	.long	0                       # End Mark
.Lpubtypes_end1:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.quad	.Lfunc_begin0
	.quad	.Ltmp20
.Lset7 = .Ltmp43-.Ltmp42                # Loc expr size
	.short	.Lset7
.Ltmp42:
	.byte	81                      # DW_OP_reg1
.Ltmp43:
	.quad	.Ltmp20
	.quad	.Ltmp37
.Lset8 = .Ltmp45-.Ltmp44                # Loc expr size
	.short	.Lset8
.Ltmp44:
	.byte	93                      # DW_OP_reg13
.Ltmp45:
	.quad	0
	.quad	0
.Ldebug_loc4:
	.quad	.Lfunc_begin0
	.quad	.Ltmp21
.Lset9 = .Ltmp47-.Ltmp46                # Loc expr size
	.short	.Lset9
.Ltmp46:
	.byte	84                      # DW_OP_reg4
.Ltmp47:
	.quad	.Ltmp21
	.quad	.Ltmp22
.Lset10 = .Ltmp49-.Ltmp48               # Loc expr size
	.short	.Lset10
.Ltmp48:
	.byte	94                      # DW_OP_reg14
.Ltmp49:
	.quad	0
	.quad	0
.Ldebug_loc7:
	.quad	.Ltmp24
	.quad	.Ltmp25
.Lset11 = .Ltmp51-.Ltmp50               # Loc expr size
	.short	.Lset11
.Ltmp50:
	.byte	82                      # DW_OP_reg2
.Ltmp51:
	.quad	.Ltmp25
	.quad	.Ltmp26
.Lset12 = .Ltmp53-.Ltmp52               # Loc expr size
	.short	.Lset12
.Ltmp52:
	.byte	80                      # DW_OP_reg0
.Ltmp53:
	.quad	.Ltmp26
	.quad	.Ltmp27
.Lset13 = .Ltmp55-.Ltmp54               # Loc expr size
	.short	.Lset13
.Ltmp54:
	.byte	82                      # DW_OP_reg2
.Ltmp55:
	.quad	.Ltmp27
	.quad	.Ltmp28
.Lset14 = .Ltmp57-.Ltmp56               # Loc expr size
	.short	.Lset14
.Ltmp56:
	.byte	80                      # DW_OP_reg0
.Ltmp57:
	.quad	.Ltmp28
	.quad	.Ltmp29
.Lset15 = .Ltmp59-.Ltmp58               # Loc expr size
	.short	.Lset15
.Ltmp58:
	.byte	82                      # DW_OP_reg2
.Ltmp59:
	.quad	.Ltmp29
	.quad	.Ltmp30
.Lset16 = .Ltmp61-.Ltmp60               # Loc expr size
	.short	.Lset16
.Ltmp60:
	.byte	81                      # DW_OP_reg1
.Ltmp61:
	.quad	.Ltmp30
	.quad	.Ltmp35
.Lset17 = .Ltmp63-.Ltmp62               # Loc expr size
	.short	.Lset17
.Ltmp62:
	.byte	82                      # DW_OP_reg2
.Ltmp63:
	.quad	0
	.quad	0
.Ldebug_loc15:
	.quad	.Ltmp31
	.quad	.Ltmp33
.Lset18 = .Ltmp65-.Ltmp64               # Loc expr size
	.short	.Lset18
.Ltmp64:
	.byte	98                      # DW_OP_reg18
.Ltmp65:
	.quad	0
	.quad	0
.Ldebug_loc17:
	.quad	.Ltmp32
	.quad	.Ltmp34
.Lset19 = .Ltmp67-.Ltmp66               # Loc expr size
	.short	.Lset19
.Ltmp66:
	.byte	97                      # DW_OP_reg17
.Ltmp67:
	.quad	0
	.quad	0
.Ldebug_loc19:
	.section	.debug_aranges,"",@progbits
	.section	.debug_ranges,"",@progbits
	.section	.debug_macinfo,"",@progbits
	.section	.debug_str,"MS",@progbits,1
.Lstring0:
	.asciz	 "clang version 7.0.0 "
.Lstring1:
	.asciz	 "/data/workspace_picalc/Emulation-SW/binary_container_1/link/int/xo/add_point/add_point/cpu_sources/pi.cl"
.Lstring2:
	.asciz	 "/data/workspace_picalc/Emulation-SW/binary_container_1/link/int/add_point"
.Lstring3:
	.asciz	 "add_point"
.Lstring4:
	.asciz	 "__stub____xlnx_cl_single_thread_add_point"
.Lstring5:
	.asciz	 "float"
.Lstring6:
	.asciz	 "inside"
.Lstring7:
	.asciz	 "bool"
.Lstring8:
	.asciz	 "prng_state"
.Lstring9:
	.asciz	 "unsigned int"
.Lstring10:
	.asciz	 "state"
.Lstring11:
	.asciz	 "y"
.Lstring12:
	.asciz	 "x"
.Lstring13:
	.asciz	 "wg_size"

	.section	".note.GNU-stack","",@progbits
