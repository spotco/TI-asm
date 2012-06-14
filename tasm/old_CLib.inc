mem_next .EQU AppBackUpScreen

;allocate 16 bits for mem_next pointer
#define alloc_init() \ LD HL,AppBackUpScreen \ LD DE,16 \ ADD HL,DE \ LD (mem_next),HL

;allocate (size) bits, load beginning pointer to HL
#define alloc_var(size) \ LD DE,(mem_next) \ LD HL,(mem_next) \ LD BC, size \ ADD HL,BC \ LD (mem_next),HL \ EX DE,HL
	