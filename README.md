# asm-practice
Publishing my progress in x86_64 assembly

a.k.a. it's ok to throw PDFs out the window

I've noticed as I work on learning assembly language that there isn't a lot of *heavily* commented assembly programs out there, that don't assume the reader knows the basics. Even books that are ostensibly geared toward teaching people the basics of assembly language often throw large chunks of code at the reader early on with many unexplained instructions, which is hella frustrating for a newbie who's sitting there with a book that on its cover says it's written as an "introduction" to assembly, which shamelessly piles *unintroduced* concepts onto their head and expects the reader to just go look elsewhere to figure them out or just continue reading gibberish. My process of learning assembly language consisted of successive but not successful attempts to read books about it, reading until I inevitably got lost, then putting the book down and starting another one, reading til the author decided to jump too fast, and starting the process over with the next book. It sure seems like it should be possible to write a book like "Programming in C" by Stephen G. Kochan which teaches the reader in bitesize chunks about one facet of a language, and does it thoroughly til the reader has a chance to understand that facet from several angles, and then moves onto the next facet, without using *any* concepts which haven't already been introduced, and also doesn't spend the first half of the book setting needlessly vast preliminary ground before getting to any actual programs. Like, those kind of books are great for many situations but there really should be a book that spends *one* chapter explaining *briefly* what registers are (registers are just memory slots that can hold numbers. They're built into the cpu instead of RAM and the first four you're going to learn about are called RAX, RBX, RCX, RDX. Just put the first four letters of the alphabet between the letter 'R' and the letter 'X' and you've got your first four registers, boom, it's easy as that folks, don't even tell the reader about any other registers until a later chapter, keep it simple). You also don't need to understand binary to *start* studying assembly - if you know what a number is (it counts things), you  can just think of registers as holding numbers, and research binary numbers at step 3 of the process of learning assembly instead of step 1.....sure you'll need to understand binary soon, but not *immediately* before you even see your first assembly program!!!! Chapter 1 introduces a few other preliminary, easy-to-grasp things like how the cpu is basically a calculator (what does a calculator do? it takes numbers you give it and adds or subtracts them, that's it, it's a very complicated calculator but you don't need to think about how complicated it is at this stage), how RAM is just memory where you have an address and a number stored at the address (so you have two numbers - 1/ the address which is a number, and 2/ the number stored at the address), what a syscall is (when your program runs, the computer goes line by line through your program's text and does what the lines tell it to do. if it finds 'syscall' on a line, the computer looks in certain registers (remember, a register is just a memory slot built into the cpu instead of in RAM, and RAM is another (bigger) memory place that's close to the CPU but not inside it) - the cpu checks the registers for numbers, calculates another number with those numbers (for example, it finds the number 3 in the RAX register and the number 2 in the RBX register, adds them up to get 5, and puts the number 5 in the RAX register, which writes over what the RAX register had before, so it replaces the number 3 with the number 5 in the RAX register)- the basics of it really aren't that complicated and it's really shitty and pretentious to tell people they need to understand the architecture of a computer on a deep, fundamental level before they even begin to write simple assembly programs... learning about computer architecture and learning assembly can go hand in hand...), what variables are (explain the distinction between initialized and uninitialized variables further on in the book, all the reader needs to understand to begin is what a variable is - it's a word, any word the programmer chooses, like 'variable1' that's tied to an address in RAM - the computer looks at the word, takes the address that's tied to it, goes to the address in RAM, and gets the number it finds at the address and brings it back to a register- it's not difficult to understand)....? Then in chapter 2, give the reader a very simple program in assembly where the number 5 is put into the RAX register and then the program exits. No variables. Then, the next program, the number 5 is put into the RAX register, and then copied from the RAX register to the RBX register. See? Programs basically move numbers around inside a computer. On a fundamental level, that's all that's happening and that's all you need to understand to *start* writing in assembly. The reader is asked to write a program that puts 5 in RAX and move it successively to 3 other registers. Every line of code in the book is commented, and things are tied together in the comments. Why isn't there a book that does this? Maybe I should go ahead and get to writing and commenting these programs instead of outlining a fictional book about low-level computer programs. 

After a lot of sweat and frustration and wanting to throw books out the window if only they were books and not pdfs I obtained through totally legit capitalistic means involving the exchange of monetary value for goods and services, I finally had a breakthrough where assembly started actually making sense to me, and decided to start publishing assembly code I write, while heavily commenting the lines so that it might be of use to people who are just starting out with assembly like I was not too long ago. This repository will be a series of programs that do things like print numbers to the screen, create, delete, or copy files to and from the hard disk, and whatever else I happen to write. :)
