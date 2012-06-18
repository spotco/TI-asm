;A*B->A	
mult8:
	PUSH BC
	PUSH DE
	LD C,0
mult8cp:
	CP 0
	JP Z,endmult8
	JP mult8loop
mult8loop:
	LD D,A
	LD A,C
	ADD A,B
	LD C,A
	LD A,D
	DEC A
	JP mult8cp
endmult8:
	LD A,C
	POP BC
	POP DE
	ret

;HL*BC -> HL
mult16:
	PUSH BC
	PUSH DE
	LD D,H
	LD E,L
	LD HL,0
mult16cp:
	LD A,D
	CP 0
	JP NZ,mult16loop
	LD A,E
	CP 0
	JP NZ,mult16loop
	JP endmult16
mult16loop:
	EX DE,HL
	DEC HL
	EX DE,HL
	ADD HL,BC
	JP mult16cp
endmult16:
	POP BC
	POP DE
	ret

;HL = DE * A
fmult:
	PUSH AF
	PUSH BC
	PUSH DE
	LD HL,0
	LD B,8
_loop:
	SRL A
	JR NC,_skip
	ADD HL,DE
_skip:
	SLA E
	SLA D
	CP 0
	JR NZ,_loop
	POP DE
	POP BC
	POP AF
	ret
	