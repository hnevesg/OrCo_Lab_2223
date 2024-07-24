; for(i=0; i<10;i++)
;   if(X{i] != 0)
;		Y[i] = X[i] + Y[x] + Y[i+1];
;	else
;		Y[i] = X[i];
;

.data
X:	.double 1.00, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09 
Y:	.double 2.00, 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09, 3.00 
.text
main:		daddi r3,r0, 10		; r3 (counter) <-- Number of vector components to process
		daddi r1,r0,X	    ; r1 will be my base X register
		daddi r2,r0,Y	    ; r2 will be my base Y register

L1:		l.d f2, 0(r1)		; F2 <-- X(i)
		l.d f4, 0(r2)		; F4 <-- Y[i]
		l.d f6, 8(r2)		; F6 <-- Y[i+1]

		l.d f10, 8(r1)		; F2 <-- X(i)
;no porque es igual que f6     		l.d f12, 8(r2)	 F4 <-- Y[i+1]
	 	l.d f14, 16(r2)		; F6 <-- Y[i+2]

		c.eq.d f2,f0		; X(i) == 0 ?
		bc1t L3             ;
L2:		
		add.d f8,f2,f4		; F8 <-- X[i] + Y[i]
		add.d f8,f8,f6		; F8 <-- F8 + Y[i+1]
		s.d f8, 0(r2)		; store SUM in Y[i]
		j L5				; jump out then
L3:		s.d f2, 0(r2)		; store X[i] in Y[i]

L5:		c.eq.d f10,f0		; X(i) == 0 ?
		bc1t L7            ;

L6:		add.d f16,f10,f6	; F8 <-- X[i+1] + Y[i+1]
		add.d f16,f16,f14	; F8 <-- F8 + Y[i+2]
		s.d f16, 8(r2)		; store SUM in Y[i+1]
		j L4			; jump out then
L7:		s.d f10, 8(r2)		; store X[i+1] in Y[i+1]

L4:		daddi r1, r1, 16	; i = i+2
		daddi r2, r2, 16	; i = i+2
		daddi r3, r3, -2	; counter = counter - 2
		bnez r3,L1
exit:	halt