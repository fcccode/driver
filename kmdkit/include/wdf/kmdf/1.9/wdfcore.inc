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
;////
;//// Time conversion related macros
;////
;////                                                      to    to     to
;////                                                      us    ms     sec
;//#define WDF_TIMEOUT_TO_SEC              ((LONGLONG) 1 * 10 * 1000 * 1000)
;//#define WDF_TIMEOUT_TO_MS               ((LONGLONG) 1 * 10 * 1000)
;//#define WDF_TIMEOUT_TO_US               ((LONGLONG) 1 * 10)
WDF_TIMEOUT_TO_SEC  equ (1 * 10 * 1000 * 1000)
WDF_TIMEOUT_TO_MS   equ (1 * 10 * 1000)
WDF_TIMEOUT_TO_US   equ (1 * 10)

;//LONGLONG
;//FORCEINLINE
;//WDF_REL_TIMEOUT_IN_MS(
;//    __in ULONGLONG Time
;//    )
;//{
;//    return Time * -1 * WDF_TIMEOUT_TO_MS;
;//}
;// !!! important, if someone have more good solution for longlong in this subroutine, 
;// please tell me, thanks :)
.code
WDF_REL_TIMEOUT_IN_MS proc uses ebx Time:qword
  lea eax, Time
  mov eax, (dword ptr [eax + 0])
  mov ebx, WDF_TIMEOUT_TO_MS
  mul ebx
  xor eax, -1
  xor edx, -1
  inc eax
  adc  edx, 0
  ret
WDF_REL_TIMEOUT_IN_MS endp
