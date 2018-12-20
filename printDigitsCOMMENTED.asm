	; any words to the right of a semi-colon are called comments and ignored by the computer.
	; this is my first heavily commented assembly program.
	; in assembly, even basic things like printing letters and numbers to the screen require 
	; lots of instructions. 
	; In order to "print" i.e. send numbers, letters, punctuation marks, and other symbols to the screen,
	; you need to convert each decimal digit into an ascii character. For example, if you're printing the 
	; number 430 to the screen, you'll have to first convert the number '4' to an ascii character, print it 
	; to the screen, then do the same for the number '3', then do the same for the number '0'.
	
	; More commentary coming soon. I'll add comments throughout the week. The goal is to have all lines 
	; explained so that someone with little or no experience with assembly language programming 
	; can see what each line does and understand what it means, or something close to it. If there's only 
	; a certain line that you find confusing, you can just navigate to that line's comment and ignore the 
	; rest.


section .data			; the lines until the next section will contain initialized variables. The '.data' 
				; section in a file contains initialized variables, aka variables whose values are 
				; defined when writing the program instead of figured out by the computer when the
				; program is eventually run.
				
	num dq 66690210 	; 'num' is the name of the variable. 'dq' means dairy queen, which is where the cpu
				; is. just kidding. 'dq' means 'define quad word', so when we put the line together,
				; it reads 'define num as a quadword containing the number 66690210'. this means
				; the variable 'num' will use one quad word of space, which is 64 bits. if you're 
				; using an x86_64 machine (this means '64-bits'. you're most likely using either 
				; a 64-bit or a 32-bit machine), then your registers hold 64 bits each. So that's 
				; conventient for this program, since it means the program will print any number
				; that will fit in one of your registers. And what *that* means is that once we get 
				; it to work, we can print out the numbers that are held in any register! But for
				; now, all we're concentrating on is 'how does a computer take a number and print
				; it to the computer screen?'
				; If you want to toy with the program, try substituting another decimal number here, 
				; up to the biggest number a 64-bit register can hold. Keep putting bigger numbers 
				; in until you get a segmentation fault. The segmentation fault means that the 
				; number you asked the computer to put in a register was too big. Just replace the 
				; one I put  ("66690210") with the number you want to print to the screen. If 
				; you're running linux, this entails downloading the .asm file, going to your 
				; terminal, navigating to the directory you downloaded the file to, then typing, 
				; without the single quotes:
				; 'nasm -f elf64 printDigits.asm' followed by the enter key. 
				; Then type 
				; 'ld -o printDigits printDigits.o' followed by the enter key. 
				; Then type 
				; './printDigits' followed by the enter key. You will see the
				; number appear at your command line interface.

section .bss			; this means "This section will contain uninitialized data." Uninitialized data
				; is variables whose values are not defined until the program runs. In this program,
				; an uninitialized variable called 'asciiByte' will be used to store digits before
				; they're printed to screen. 
				
	asciiByte resb 1	; this means, 'reserve 1 byte of space and call it 'asciiByte'. notice how the word
				; resb aka 'reserve byte' is used in the .bss section instead of the word 'dq' aka 
				; 'define byte'? That's because you're reserving space for an uninitialized variable,
				; instead of defining it in the program. The variable can be defined in the program 
				; when it's run, isstead of by you explicitly when you initialize it, aka name it in
				; the .bss section.

section .text
	global _start

_start:
	mov rax, [num]
	call _printDigits	

	mov rax, 60		; exit
	mov rdi, 0
	syscall
		

_printDigits:			
	xor r9, r9	; zeroing out r9 just in case

digitsToBytes:
	xor rdx, rdx	; clear remainder from last time through loop (see line 21)
	inc r9		; r9 is used to keep track of how many times loop happened
			; which is used later when printing out the digits
	mov rbx, 10		
	div rbx		; uses rax as dividend (rdx was zerod out), puts quotient in rax, and 
			; remainder in rdx
	push rdx	; which gets pushed onto stack

	cmp rax, 0	; if the number divided by 10 is zero, then we have all the numbers
				; on the stack and we can start printing them, in printNums
	jne digitsToBytes

	mov r10, asciiByte	; move address of the uninitialized .bss byte into r10

printNums:
	pop rbx		; take first digit off the stack (or whichever one you're at in the loop)
	add bl, '0'	; make it into ascii char digit
	
	mov [r10], bl 	; move it into asciiByte
	
	mov rsi, r10	; move asciiByte into rsi for printing
	mov rax, 1
	mov rdi, 1
	mov rdx, 1
	syscall
	
	dec r9		; r9 counted up how many digits we have to print above in digitsToBytes
	cmp r9, 0	; now we count down.
	jne printNums

	ret
