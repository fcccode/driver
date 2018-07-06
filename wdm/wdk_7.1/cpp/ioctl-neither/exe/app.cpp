/*========================================================================================================
  Basically, all of files downloaded from my website can be modified or redistributed for any purpose.
  It is my honor to share my interesting to everybody.
  If you find any illeage content out from my website, please contact me firstly.
  I will remove all of the illeage parts.
  Thanks :)
   
  Steward Fu
  g9313716@yuntech.edu.tw
  https://steward-fu.github.io/website/index.htm
========================================================================================================*/
#include <DriverSpecs.h>
__user_code  
#define INITGUID
#include <windows.h>
#include <winioctl.h>
#include <strsafe.h>
#include <setupapi.h>
#include <stdio.h>
#include <stdlib.h>
#define WHILE(a) __pragma(warning(suppress:4127)) while(a)

#define IOCTL_NEITHER_SET CTL_CODE(FILE_DEVICE_UNKNOWN, 0x800, METHOD_NEITHER, FILE_ANY_ACCESS)
#define IOCTL_NEITHER_GET CTL_CODE(FILE_DEVICE_UNKNOWN, 0x801, METHOD_NEITHER, FILE_ANY_ACCESS)
 
//*** main entry point
int __cdecl main(int argc, char* argv[])
{
  HANDLE hFile = NULL;
  DWORD dwRet = 0;
  char szBuffer[255]={"test is testing message"};

  hFile = CreateFile("\\\\.\\firstIOCTL-Neither", GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
  if (hFile == INVALID_HANDLE_VALUE) {
    printf("failed to open driver\n");
    return 1;
  }
  DeviceIoControl(hFile, IOCTL_NEITHER_SET, szBuffer, strlen(szBuffer), NULL, 0, &dwRet, NULL);
  memset(szBuffer, 0, sizeof(szBuffer));
  DeviceIoControl(hFile, IOCTL_NEITHER_GET, NULL, 0, szBuffer, sizeof(szBuffer), &dwRet, NULL);
  printf("IOCTL_NEITHER_GET: %s\n", szBuffer);
  CloseHandle(hFile);
  return 0;
}