/*++

Module Name:

    public.h

Abstract:

    This module contains the common declarations shared by driver
    and user applications.

Environment:

    user and kernel

--*/

//
// Define an Interface Guid so that app can find the device and talk to it.
//

DEFINE_GUID (GUID_DEVINTERFACE_firstKMDF,
    0xa90c093b,0x1a31,0x4434,0x90,0xee,0x19,0x70,0x86,0x54,0xab,0xc5);
// {a90c093b-1a31-4434-90ee-19708654abc5}
