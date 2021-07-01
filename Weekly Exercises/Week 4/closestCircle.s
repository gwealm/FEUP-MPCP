.text
.global closestCircle
.type closestCircle, "function"

/**
 * ///////////////// PROGRAM /////////////////
 *
 *	VP -> contains (x, y) coordinates of NP points of single precision:
 *		Size: 2 * NP
 *
 *	VC -> contains the center and radius (Xc, Yc, r) of circunferences of Double precision
 *		Size: 3 * NC
 *
 *	ID -> contains closestCircle with indexes in range [0, NC - 1] of the closest circunference of each point
 *		Size: NP
 *
 *	Notes:
 *		NP > 0 && NC > 0
 *		d = sqrt(pow(x-xc, 2) + pow(y-yc, 2)) - r
 *		if ( d > 0 ) { point.inCircle = false; }			// -> valid distance
 *		else 		 { continue; }							// -> invalid distance (ignored)
 *
 *	point belongs to all circles -> ID[point.idx] = -1

 * ///////////////// REGISTER ORDER //////////
 *
 * W0 -> NP (unsigned int)
 * X1 -> VP (pointer to float array)
 * W2 -> NC (unsigned int)
 * X3 -> VC (pointer to double array)
 * X4 -> ID (pointer to int array)
 *
 */

closestCircle:		MOV		X10, 0

loop1:				CBZ		W0 , end
					LDR		S19, [X1], 4		// x
					LDR		S20, [X1], 4		// y
					FCVT	D19, S19
					FCVT	D20, S20
					SUB		W0, W0, 1
					MOV		X7, X3				// X7 <- copy of vc base address
					MOV		W11, W2
					SCVTF	D21, X10			// Will store the result

loop2:				CBZ		W11, prep
					SUB		W12, W2, W11		// W12 <- index
					SUB		W11, W11, 1
					LDR		D16, [X7], 8		// xc
					LDR		D17, [X7], 8		// yc
					LDR		D18, [X7], 8		// radius

formula:			FSUB	D22, D19, D16
					FSUB	D23, D20, D17
					FMUL	D22, D22, D22
					FMUL	D23, D23, D23
					FADD	D22, D22, D23
					FSQRT	D22, D22
					FSUB	D23, D22, D18		// D20 <- result of the formula

compare:			FCMP	D23, 0.0
					B.LE	loop2				// if (d <= 0) { B loop2; }
					FCMP	D21, 0.0
					B.EQ	firstVal
					FCMP	D23, D21
					B.GT	loop2
					FMOV	D21, D23
					STR		W12, [X4]
					B		loop2

firstVal:			FMOV	D21, D23
					STR		W12, [X4]
					B		loop2

prep:				ADD		X4, X4, 4
					B		loop1

end:				RET