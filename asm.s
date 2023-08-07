		
	AREA PROG1, CODE, READONLY
	ENTRY
	EXPORT __main
__main
		LDR		r0, =0xE000ED88
		LDR		r1, [r0]
		ORR		r1, r1, #(0xF << 20)
		STR		r1, [r0]
		MOV		r5, #0xffffffff
		
		vmov.f	s0,#2
		vsqrt.f	s1,s0		;s1 = sqrt2
		vmov.f	s5,#1
loop

		vadd.f	s2,s3,s0	;s2 = 2+sqrt2
		vsqrt.f	s3,s2		;s3 = sqrt s2
		vmov.f	s1,s2		;s2 to s2  sqrt(2+sqrt2)+2
		vdiv.f	s4,s3,s0	;s4 = s3/2
		vmul.f	s5,s5,s4	; s5=s5*s4
		vdiv.f	s6,s0,s5	;2/pi to pi

		b		loop
		END
			

