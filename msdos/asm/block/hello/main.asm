; Copyright (c) 2016 by Steward Fu
; All rights reserved.
cseg segment para public 'code'
	BlkHello proc far
		assume cs:cseg, es:cseg, ds:cseg
	Header:
		NextDriver  dd -1
		Attribute   dw 0000h
		Strategy    dw MyStrategy
		Interrupt   dw MyInterrupt
		DriverName  db 'BlkHello'

		RhOffset    dw ?
		RhSegment   dw ?
		bootmsg     db 'Steward MS-DOS Driver Tutorial, Hello, world!', 0dh, 0ah, '$'
		CmdTable    dw Init

	MyStrategy:
		mov cs:RhSegment, es
		mov cs:RhOffset, bx
		ret

	MyInterrupt:
		cld
		push ds
		push es
		push ax
		push bx
		push cx
		push dx
		push di
		push si

		mov al, es:[bx]+2
		cmp al, 0
		jnz SkipCurRequest
		rol al, 1
		lea di, CmdTable
		mov ah, 0
		add di, ax
		jmp word ptr[di]

	Init:
		lea dx, bootmsg
		mov ah, 9
		int 21h
		lea ax, Exit
		mov es:[bx]+0eh, ax
		push cs
		pop ax
		mov es:[bx]+10h, ax
		mov es:word ptr 3[bx], 0100h
		jmp CompleteCmd

	SkipCurRequest:
		mov es:word ptr 3[bx], 8103h
		jmp CompleteCmd

	CompleteCmd:
		mov bx, cs:RhOffset
		mov es, cs:RhSegment
		pop si
		pop di
		pop dx
		pop cx
		pop bx
		pop ax
		pop es
		pop ds
		ret

	Exit:
	BlkHello endp
cseg ends
end
