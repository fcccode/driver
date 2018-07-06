//============================================================================
// Copyright (c) 2016 by Steward Fu
// All rights reserved
// 2016/12/15
//============================================================================
#include <wdm.h>

// save next device object 
PDEVICE_OBJECT gpNextObj = NULL;

//============================================================================
// description:
//  call this function to add new device
//
// parameter:
//  pDrvObj
//   our driver object
//  pPhyObj
//   next device object
//
// return:
//  status
//============================================================================
NTSTATUS AddDevice(PDRIVER_OBJECT pDrvObj, PDEVICE_OBJECT pPhyObj)
{
	PDEVICE_OBJECT pFunObj = NULL;
	UNICODE_STRING usDeviceName;
	UNICODE_STRING usSymboName;

	DbgPrint("Steward WDM Driver Tutorial, Hello, world!\n");

	// create new device (device name: firstWDM)
	RtlInitUnicodeString(&usDeviceName, L"\\Device\\firstWDM");
	IoCreateDevice(pDrvObj, 0, &usDeviceName, FILE_DEVICE_UNKNOWN, 0, FALSE, &pFunObj);

	// create symbolic link
	// application can use it to communicate with driver
	RtlInitUnicodeString(&usSymboName, L"\\DosDevices\\firstWDM");
	IoCreateSymbolicLink(&usSymboName, &usDeviceName);

	// attach to driver stack and save next device object
	// we will use this object to forward irp
	gpNextObj = IoAttachDeviceToDeviceStack(pFunObj, pPhyObj);

	// initialize flags
	pFunObj->Flags &= ~DO_DEVICE_INITIALIZING;
	pFunObj->Flags |= DO_BUFFERED_IO;
	return STATUS_SUCCESS;
}

//============================================================================
// description:
//  unload driver
//
// parameter:
//  pDrvObj
//   our driver object
//
// return:
//  none
//============================================================================
void DriverUnload(PDRIVER_OBJECT pDrvObj)
{
	pDrvObj = pDrvObj;
}

//============================================================================
// description:
//  process pnp irp
//
// parameter:
//  pDevObj
//   current device object
//  pIrp
//   current irp
//
// return:
//  status
//============================================================================
NTSTATUS IrpDispatch(PDEVICE_OBJECT pDevObj, PIRP pIrp)
{
	PIO_STACK_LOCATION psk = IoGetCurrentIrpStackLocation(pIrp);
	UNICODE_STRING usSymboName;

	if (psk->MinorFunction == IRP_MN_REMOVE_DEVICE) {
		// free resources
		RtlInitUnicodeString(&usSymboName, L"\\DosDevices\\firstWDM");
		IoDeleteSymbolicLink(&usSymboName);
		IoDetachDevice(gpNextObj);
		IoDeleteDevice(pDevObj);
	}

	// pass irp to next
	IoSkipCurrentIrpStackLocation(pIrp);
	return IoCallDriver(gpNextObj, pIrp);
}

//============================================================================
// description:
//  driver entry point
//
// parameter:
//  pDrvObj
//   our driver object
//  pRegPath
//   registry path for our driver
//
// return:
//  status
//============================================================================
NTSTATUS DriverEntry(PDRIVER_OBJECT pDrvObj, PUNICODE_STRING pRegPath)
{
	pRegPath = pRegPath;

	// set pnp callback
	pDrvObj->MajorFunction[IRP_MJ_PNP] = IrpDispatch;

	// set adddevice callback
	pDrvObj->DriverExtension->AddDevice = AddDevice;

	// set driverunload callback
	pDrvObj->DriverUnload = DriverUnload;

	return STATUS_SUCCESS;
}