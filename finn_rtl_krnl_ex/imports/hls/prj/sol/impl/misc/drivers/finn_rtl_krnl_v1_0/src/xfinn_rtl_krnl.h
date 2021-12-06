// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XFINN_RTL_KRNL_H
#define XFINN_RTL_KRNL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfinn_rtl_krnl_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XFinn_rtl_krnl_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XFinn_rtl_krnl;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFinn_rtl_krnl_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFinn_rtl_krnl_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFinn_rtl_krnl_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFinn_rtl_krnl_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XFinn_rtl_krnl_Initialize(XFinn_rtl_krnl *InstancePtr, u16 DeviceId);
XFinn_rtl_krnl_Config* XFinn_rtl_krnl_LookupConfig(u16 DeviceId);
int XFinn_rtl_krnl_CfgInitialize(XFinn_rtl_krnl *InstancePtr, XFinn_rtl_krnl_Config *ConfigPtr);
#else
int XFinn_rtl_krnl_Initialize(XFinn_rtl_krnl *InstancePtr, const char* InstanceName);
int XFinn_rtl_krnl_Release(XFinn_rtl_krnl *InstancePtr);
#endif



#ifdef __cplusplus
}
#endif

#endif