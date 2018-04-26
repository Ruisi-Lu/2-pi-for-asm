		
	AREA PROG1, CODE, READONLY
	ENTRY
	EXPORT __main
__main
		LDR		r0, =0xE000ED88
		LDR		r1, [r0]
		ORR		r1, r1, #(0xF << 20)
		STR		r1, [r0]
		MOV		r5, #0xffffffff
		
		vmov.f	s7,#2
		vsqrt.f	s0,s7		;s0 = sqrt2
		vdiv.f	s1,s0,s7	;s1 = sqrt2/2
		vmov.f	s2,s0		; s2 = sqrt2
		vmov.f	s5,#1
		vmov.f	s6,#1
loop
		vmul.f	s6,s6,s5	; s6=s6*s5
		vadd.f	s3,s4,s7	;s3 = 2+sqrt2
		vsqrt.f	s4,s3		;s4 = sqrt s3
		vmov.f	s2,s3		;s3 to s2  sqrt(2+sqrt2)+2
		vdiv.f	s5,s4,s7	;s5 = s4/2


		b		loop
		END
			