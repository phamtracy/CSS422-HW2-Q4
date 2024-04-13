; Defining source and destination data buffer
src		DCB		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l'
dst		DCB		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		
begin
		LDR		R0, =src			; Load address to R0 register
		LDR		R1, =dst			; Load address into R1 register
		MOV		R3, #12				; Sets register R3 as a counter
		
loop
		LDRB		R2, [R0], #1			; Load byte from src address into register R2 and increment src address
		CMP		R2, #'a'			; Compares letter 'a' with register R2
		BLT		skip				; Branches if the byte is less than 'a'
		CMP		R2, #'z'			; Compares letter 'z' with register R2
		BGT		skip				; Branches if the byte is greater than 'z'
		SUB		R2, R2, #32			; Converts from lowercase to uppercase by subtracting 32 from ASCII value
		
skip
		STRB		R2, [R1], #1			; Stores the content of R2 into memory address stored in R1, then increment address in R1 by one byte
		SUBS		R3, R3, #1			; Decrements the counter R3
		BNE		loop				; Branches back to the loop if counter R3 is not zero
		
done
		END
