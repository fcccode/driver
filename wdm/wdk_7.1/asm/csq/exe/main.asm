;//========================================================================================================
;//  Basically, all of files downloaded from my website can be modified or redistributed for any purpose.
;//  It is my honor to share my interesting to everybody.
;//  If you find any illeage content out from my website, please contact me firstly.
;//  I will remove all of the illeage parts.
;//  Thanks :)
;//  
;//  Steward Fu
;//  g9313716@yuntech.edu.tw
;//  https://steward-fu.github.io/website/index.htm
;//========================================================================================================*/
.386p
.model flat, stdcall
option casemap:none
 
include c:\masm32\include\windows.inc
include c:\masm32\include\masm32.inc
include c:\masm32\include\user32.inc
include c:\masm32\include\msvcrt.inc
include c:\masm32\include\kernel32.inc
include c:\masm32\include\w2k\ntddkbd.inc
include c:\masm32\Macros\Strings.mac
  
includelib c:\masm32\lib\user32.lib
includelib c:\masm32\lib\masm32.lib
includelib c:\masm32\lib\msvcrt.lib
includelib c:\masm32\lib\kernel32.lib
 
IOCTL_QUEUE_IT    equ CTL_CODE(FILE_DEVICE_UNKNOWN, 800h, METHOD_BUFFERED,    FILE_ANY_ACCESS)
IOCTL_PROCESS_IT  equ CTL_CODE(FILE_DEVICE_UNKNOWN, 801h, METHOD_BUFFERED,    FILE_ANY_ACCESS)
 
.const
DEV_NAME db "\\.\firstCSQ",0
 
.data?
cnt   dd ?
hFile dd ?
dwRet dd ?
ov OVERLAPPED <?>

.code
start:
  invoke CreateFile, offset DEV_NAME, GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_FLAG_OVERLAPPED or FILE_ATTRIBUTE_NORMAL, 0
  .if eax == INVALID_HANDLE_VALUE
    invoke crt_printf, $CTA0("failed to open firstTimer-IO driver")
    invoke ExitProcess, 0
  .endif
  mov hFile, eax
  invoke crt_memset, offset ov, 0, sizeof OVERLAPPED
  
  mov cnt, 10
  .while cnt > 0
    invoke CreateEvent,NULL, TRUE, FALSE, NULL
    push eax
		pop ov.hEvent
		invoke crt_printf, $CTA0("queue it\n")
		invoke DeviceIoControl, hFile, IOCTL_QUEUE_IT, NULL, 0, NULL, 0, offset dwRet, offset ov
		invoke CloseHandle, ov.hEvent
    sub cnt, 1
  .endw
  
  invoke crt_printf, $CTA0("process it\n")
  invoke DeviceIoControl, hFile, IOCTL_PROCESS_IT, NULL, 0, NULL, 0, offset dwRet, NULL
  invoke Sleep, 3000
  invoke CancelIo, hFile
  invoke CloseHandle, hFile
  invoke ExitProcess, 0
end start
