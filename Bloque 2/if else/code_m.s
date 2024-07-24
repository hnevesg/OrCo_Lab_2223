	.data

X: 	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07
	.double 1.10, 1.11, 1.12, 1.13, 1.14, 1.15, 1.16, 1.17

Y: 	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07
	.double 2.10, 2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17

	.text

main:
	daddi	r8,r0,32
	daddi 	r4,r0,16
	dsll 	r4,r4,3
	daddi	r2,r0,15
	dsll	r2,r2,3
loop:
	l.d 	f0,X(r1)
	l.d 	f2,Y(r2)
	l.d 	f6,X+8(r1)
	l.d 	f8,Y-8(r2)
	l.d 	f10,X+16(r1)
	l.d 	f12,Y-16(r2)
	l.d 	f14,X+24(r1)
	l.d 	f16,Y-24(r2)

	add.d 	f4,f0,f2
	add.d 	f3,f6,f8
	add.d 	f13,f10,f12
	add.d 	f15,f14,f16
	add.d	f1,f1,f4

	daddi 	r1,r1,32
	dsub	r2,r2,r8
	dsub 	r3,r4,r1

	add.d	f1,f1,f3
	add.d	f1,f1,f13
	add.d	f1,f1,f15

	s.d 	f2,X-32(r1)
	s.d 	f0,Y+32(r2)
	s.d 	f8,X-24(r1)
	s.d 	f6,Y+24(r2)
	s.d 	f12,X-16(r1)
	s.d 	f10,Y+16(r2)
	s.d 	f16,X-8(r1)


	bnez 	r3,loop
	s.d 	f14,Y+8(r2)

	halt
