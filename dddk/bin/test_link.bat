@echo off
c:\dddk\bin\omf2d.exe %1
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEDbgPrint=_DbgPrint
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEIoCreateDevice=_IoCreateDevice@28
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEIoCompleteRequest=_IoCompleteRequest@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEIoDeleteDevice=_IoDeleteDevice@4
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEIoCreateSymbolicLink=_IoCreateSymbolicLink@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEIoDeleteSymbolicLink=_IoDeleteSymbolicLink@4
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CERtlInitUnicodeString=_RtlInitUnicodeString@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEInterlockedExchange=@InterlockedExchange@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEZwOpenProcess=_ZwOpenProcess@16
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEKeServiceDescriptorTable=_KeServiceDescriptorTable
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEProbeForRead=_ProbeForRead@12
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEExFreePool=_ExFreePool@4
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEKeWaitForSingleObject=_KeWaitForSingleObject@20 
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEExAllocatePool=_ExAllocatePool@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEExAllocatePoolWithQuota=_ExAllocatePoolWithQuota@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEExAllocatePoolWithTag=_ExAllocatePoolWithTag@12
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEKeInitializeMutex=_KeInitializeMutex@8
c:\dddk\bin\omf2d.exe c:\dddk\include\DDDK.obj /U- /CEKeReleaseMutex=_KeReleaseMutex@8
c:\dddk\bin\link.exe /FORCE:UNRESOLVED /FORCE:MULTIPLE /ENTRY:DriverEntry c:\dddk\include\DDDK.obj C:\dddk\lib\ntoskrnl.lib /MAP /nologo /driver /base:0x10000 /align:32 /out:main.sys /subsystem:native %1
