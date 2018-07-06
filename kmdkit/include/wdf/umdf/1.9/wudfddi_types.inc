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
;//typedef enum _WDF_DEVICE_IO_TYPE {
    WdfDeviceIoUndefined        equ 0
    WdfDeviceIoNeither          equ 1
    WdfDeviceIoBuffered         equ 2
    WdfDeviceIoDirect           equ 3
    WdfDeviceIoBufferedOrDirect equ 4
    WdfDeviceIoMaximum          equ 5
;//} WDF_DEVICE_IO_TYPE, *PWDF_DEVICE_IO_TYPE;
WDF_DEVICE_IO_TYPE typedef DWORD
PWDF_DEVICE_IO_TYPE typedef ptr WDF_DEVICE_IO_TYPE