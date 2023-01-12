format ELF executable

entry _start


segment readable executable

_start:
	mov al, 0xc2
	xor dl, dl
	poly = 0x16
	mov ecx, 8

crc_loop:
	shl al, 1
	setc bl
	shl dl, 1
	setc bh
	xor bl, bh
	jz .crc
	xor dl, poly

.crc:
	loop crc_loop