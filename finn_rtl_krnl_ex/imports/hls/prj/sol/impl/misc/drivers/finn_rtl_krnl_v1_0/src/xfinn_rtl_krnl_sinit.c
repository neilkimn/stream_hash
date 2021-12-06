// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfinn_rtl_krnl.h"

extern XFinn_rtl_krnl_Config XFinn_rtl_krnl_ConfigTable[];

XFinn_rtl_krnl_Config *XFinn_rtl_krnl_LookupConfig(u16 DeviceId) {
	XFinn_rtl_krnl_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFINN_RTL_KRNL_NUM_INSTANCES; Index++) {
		if (XFinn_rtl_krnl_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFinn_rtl_krnl_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFinn_rtl_krnl_Initialize(XFinn_rtl_krnl *InstancePtr, u16 DeviceId) {
	XFinn_rtl_krnl_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFinn_rtl_krnl_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFinn_rtl_krnl_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

