	;;; bootloader.asm --- 
	;; 
	;; Filename: bootloader.asm
	;; Description: 
	;; Author: Tharindu Hasthika
	;; Maintainer: Tharindu Hasthika
	;; Created: Thu Feb 15 07:37:43 2018 (+0530)
	;; Version: 
	;; Last-Updated: Thu Feb 15 13:19:26 2018 (+0530)
	;;           By: Tharindu Hasthika
	;;     Update #: 82
	;; URL: 
	;; Keywords: 
	;; Compatibility: 
	;; 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; 
	;;; Commentary: 
	;; 
	;; 
	;; 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; 
	;;; Change Log:
	;; 
	;; 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; 
	;; This program is free software; you can redistribute it and/or
	;; modify it under the terms of the GNU General Public License as
	;; published by the Free Software Foundation; either version 3, or
	;; (at your option) any later version.
	;; 
	;; This program is distributed in the hope that it will be useful,
	;; but WITHOUT ANY WARRANTY; without even the implied warranty of
	;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	;; General Public License for more details.
	;; 
	;; You should have received a copy of the GNU General Public License
	;; along with this program; see the file COPYING.  If not, write to
	;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
	;; Floor, Boston, MA 02110-1301, USA.
	;; 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; 
	;;; Code:

	[org 0x7c00]
	[bits 16]

	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print_string

	jmp switch_to_pm

	%include "print_string.asm"
	%include "gdt.asm"
	%include "print_string_pm.asm"
	%include "switch_to_pm.asm"

	[bits 32]
	
BEGIN_PM:

	mov ebx, MSG_PROT_MODE
	call print_string_pm

	jmp $

MSG_REAL_MODE:	db "Started in 16-bit Real Mode", 0
	
MSG_PROT_MODE:	db "In Protected Mode!", 0
	
	times 510 - ($-$$) db 0

	dw 0xAA55		; Boot Signature

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;; bootloader.asm ends here
