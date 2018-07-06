/*====================================================================================
 Copyright (c) 2015 by Steward Fu
 All rights reserved
 2015/05/05
====================================================================================*/
#include <ntddk.h>
 
/*====================================================================================
description:
 unload driver
   
parameter:
 pDrvObj: our driver object
   
return:
 none
====================================================================================*/
void Unload(PDRIVER_OBJECT pDrvObj)
{
 UNICODE_STRING usSymboName;
 
 // free resources
 RtlInitUnicodeString(&usSymboName, L"\\DosDevices\\firstLegacy");
 IoDeleteSymbolicLink(&usSymboName);
 if(pDrvObj->DeviceObject != NULL){
  IoDeleteDevice(pDrvObj->DeviceObject);
 }
}
 
/*====================================================================================
description:
 driver entry point
  
parameters:
 pDrvObj: our driver object
 pRegPath: registry path for our driver
  
returned:
 status
====================================================================================*/
NTSTATUS DriverEntry(PDRIVER_OBJECT pDrvObj, PUNICODE_STRING pRegPath)
{
 PDEVICE_OBJECT pFunObj=NULL;
 UNICODE_STRING usDeviceName;
 UNICODE_STRING usSymboName;
 
 DbgPrint("Steward Legacy(Nt-Style) Driver Tutorial, Hello, world!\n");
 
 // create new device (device name: firstWDM)
 RtlInitUnicodeString(&usDeviceName, L"\\Device\\firstLegacy");
 IoCreateDevice(pDrvObj, 0, &usDeviceName, FILE_DEVICE_UNKNOWN, 0, FALSE, &pFunObj);
 
 // create symbol link
 // application can use it for communication with driver
 RtlInitUnicodeString(&usSymboName, L"\\DosDevices\\firstLegacy");
 IoCreateSymbolicLink(&usSymboName, &usDeviceName);
 
 // set unload callback function
 pDrvObj->DriverUnload = Unload;
 return STATUS_SUCCESS;
}

