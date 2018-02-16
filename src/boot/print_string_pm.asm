	;; print_string_pm.asm
	;; 
	;; EBX: location of null terminated string
	;; 

	[bits 32]

	VIDEO_MEMORY equ 0xb8000
	WHITE_ON_BLACK equ 0x0f

print_string_pm:
	pusha

	mov edx, VIDEO_MEMORY

_print_string_pm_loop:
	mov al, [ebx]
	mov ah, WHITE_ON_BLACK

	cmp al, 0
	je _print_string_pm_done

	mov [edx], ax
	add ebx, 0x01
	add edx, 0x02

	jmp _print_string_pm_loop

_print_string_pm_done:
	popa
	ret