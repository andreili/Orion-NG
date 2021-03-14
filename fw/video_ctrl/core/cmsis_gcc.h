/**************************************************************************//**
 * @file     cmsis_gcc.h
 * @brief    CMSIS compiler GCC header file
 * @version  V5.0.4
 * @date     09. April 2018
 ******************************************************************************/
/*
 * Copyright (c) 2009-2018 Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __CMSIS_GCC_H
#define __CMSIS_GCC_H

/* ignore some GCC warnings */
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wconversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"

/* Fallback for __has_builtin */
#ifndef __has_builtin
  #define __has_builtin(x) (0)
#endif

#ifdef UNUSED
#elif defined(__GNUC__)
//# define UNUSED(x) UNUSED_ ## x __attribute__((unused))
# define UNUSED(x) (void)(x)
#elif defined(__LCLINT__)
# define UNUSED(x) /*@unused@*/ x
#else
# define UNUSED(x) x
#endif

/* CMSIS compiler specific defines */
#ifndef   __ASM
  #define __ASM                                  __asm
#endif
#ifndef   __INLINE
  #define __INLINE                               inline
#endif
#ifndef   __STATIC_INLINE
  #define __STATIC_INLINE                        static inline
#endif
#ifndef   __STATIC_FORCEINLINE                 
  #define __STATIC_FORCEINLINE                   __attribute__((always_inline)) static inline
#endif                                           
#ifndef   __NO_RETURN
  #define __NO_RETURN                            __attribute__((__noreturn__))
#endif
#ifndef   __USED
  #define __USED                                 __attribute__((used))
#endif
#ifndef   __WEAK
  #define __WEAK                                 __attribute__((weak))
#endif
#ifndef   __PACKED
  #define __PACKED                               __attribute__((packed, aligned(1)))
#endif
#ifndef   __PACKED_STRUCT
  #define __PACKED_STRUCT                        struct __attribute__((packed, aligned(1)))
#endif
#ifndef   __PACKED_UNION
  #define __PACKED_UNION                         union __attribute__((packed, aligned(1)))
#endif
#ifndef   __UNALIGNED_UINT32        /* deprecated */
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wpacked"
  #pragma GCC diagnostic ignored "-Wattributes"
  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
  #pragma GCC diagnostic pop
  #define __UNALIGNED_UINT32(x)                  (((struct T_UINT32 *)(x))->v)
#endif
#ifndef   __UNALIGNED_UINT16_WRITE
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wpacked"
  #pragma GCC diagnostic ignored "-Wattributes"
  __PACKED_STRUCT T_UINT16_WRITE { uint16_t v; };
  #pragma GCC diagnostic pop
  #define __UNALIGNED_UINT16_WRITE(addr, val)    (void)((((struct T_UINT16_WRITE *)(void *)(addr))->v) = (val))
#endif
#ifndef   __UNALIGNED_UINT16_READ
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wpacked"
  #pragma GCC diagnostic ignored "-Wattributes"
  __PACKED_STRUCT T_UINT16_READ { uint16_t v; };
  #pragma GCC diagnostic pop
  #define __UNALIGNED_UINT16_READ(addr)          (((const struct T_UINT16_READ *)(const void *)(addr))->v)
#endif
#ifndef   __UNALIGNED_UINT32_WRITE
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wpacked"
  #pragma GCC diagnostic ignored "-Wattributes"
  __PACKED_STRUCT T_UINT32_WRITE { uint32_t v; };
  #pragma GCC diagnostic pop
  #define __UNALIGNED_UINT32_WRITE(addr, val)    (void)((((struct T_UINT32_WRITE *)(void *)(addr))->v) = (val))
#endif
#ifndef   __UNALIGNED_UINT32_READ
  #pragma GCC diagnostic push
  #pragma GCC diagnostic ignored "-Wpacked"
  #pragma GCC diagnostic ignored "-Wattributes"
  __PACKED_STRUCT T_UINT32_READ { uint32_t v; };
  #pragma GCC diagnostic pop
  #define __UNALIGNED_UINT32_READ(addr)          (((const struct T_UINT32_READ *)(const void *)(addr))->v)
#endif
#ifndef   __ALIGNED
  #define __ALIGNED(x)                           __attribute__((aligned(x)))
#endif
#ifndef   __RESTRICT
  #define __RESTRICT                             __restrict
#endif

namespace CORTEX
{
/* ###########################  Core Function Access  ########################### */
/** \ingroup  CMSIS_Core_FunctionInterface
    \defgroup CMSIS_Core_RegAccFunctions CMSIS Core Register Access Functions
  @{
 */
	__STATIC_FORCEINLINE void enable_irq()  { __ASM volatile ("cpsie i" : : : "memory"); }
	__STATIC_FORCEINLINE void disable_irq() { __ASM volatile ("cpsid i" : : : "memory"); }

	__STATIC_FORCEINLINE std::uint32_t get_CONTROL()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, control" : "=r" (result) );
		return(result);
	}
	 __STATIC_FORCEINLINE void set_CONTROL(std::uint32_t val) { __ASM volatile ("MSR control, %0" : : "r" (val) : "memory"); }
#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_CONTROL_NS()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, control_ns" : "=r" (result) );
		return(result);
	}
	 __STATIC_FORCEINLINE void __TZ_set_CONTROL_NS(std::uint32_t control) { __ASM volatile ("MSR control_ns, %0" : : "r" (control) : "memory"); }
#endif

	__STATIC_FORCEINLINE std::uint32_t get_IPSR()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, ipsr" : "=r" (result) );
		return(result);
	}

	__STATIC_FORCEINLINE std::uint32_t get_APSR()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, apsr" : "=r" (result) );
		return(result);
	}

	__STATIC_FORCEINLINE void set_APSR(std::uint32_t val)
	{
		__ASM volatile ("MRS %0, apsr" : "=r" (val) );
	}

	__STATIC_FORCEINLINE std::uint32_t get_xPSR()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, xpsr" : "=r" (result) );
		return(result);
	}

	__STATIC_FORCEINLINE std::uint32_t get_PSP()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, psp" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void set_PSP(std::uint32_t topOfProcStack) { __ASM volatile ("MSR psp, %0" : : "r" (topOfProcStack) : "memory"); }
#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_PSP_NS(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, psp_ns"  : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void TZ_set_PSP_NS(std::uint32_t topOfProcStack) { __ASM volatile ("MSR psp_ns, %0" : : "r" (topOfProcStack) : ); }
#endif

	__STATIC_FORCEINLINE std::uint32_t get_MSP()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, msp" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void set_MSP(std::uint32_t topOfMainStack) { __ASM volatile ("MSR msp, %0" : : "r" (topOfMainStack) : "memory"); }
#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_MSP_NS(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, msp_ns" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void TZ_set_MSP_NS(std::uint32_t topOfMainStack) { __ASM volatile ("MSR msp_ns, %0" : : "r" (topOfMainStack) : "memory"); }
#endif

#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_SP_NS(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, sp_ns" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void TZ_set_SP_NS(std::uint32_t topOfStack) { __ASM volatile ("MSR sp_ns, %0" : : "r" (topOfStack) : "memory"); }
#endif

	__STATIC_FORCEINLINE std::uint32_t get_PRIMASK()
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, primask" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void set_PRIMASK(std::uint32_t priMask) { __ASM volatile ("MSR primask, %0" : : "r" (priMask) : "memory"); }
#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_PRIMASK_NS(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, primask_ns" : "=r" (result) :: "memory");
		return(result);
	}
	__STATIC_FORCEINLINE void TZ_set_PRIMASK_NS(std::uint32_t priMask) { __ASM volatile ("MSR primask_ns, %0" : : "r" (priMask) : "memory"); }
#endif


#if ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
     (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
     (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1))    )
	__STATIC_FORCEINLINE void enable_fault_irq(void) { __ASM volatile ("cpsie f" : : : "memory"); }
	__STATIC_FORCEINLINE void disable_fault_irq(void) { __ASM volatile ("cpsid f" : : : "memory"); }

	__STATIC_FORCEINLINE std::uint32_t get_BASEPRI(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, basepri" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void set_BASEPRI(std::uint32_t basePri) { __ASM volatile ("MSR basepri, %0" : : "r" (basePri) : "memory"); }
#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_BASEPRI_NS(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, basepri_ns" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void TZ_set_BASEPRI_NS(std::uint32_t basePri) { __ASM volatile ("MSR basepri_ns, %0" : : "r" (basePri) : "memory"); }
#endif

	__STATIC_FORCEINLINE void set_BASEPRI_MAX(std::uint32_t basePri) { __ASM volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory"); }

	__STATIC_FORCEINLINE std::uint32_t get_FAULTMASK(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, faultmask" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void set_FAULTMASK(std::uint32_t faultMask) { __ASM volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory"); }
#if (defined (__ARM_FEATURE_CMSE ) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_FAULTMASK_NS(void)
	{
		std::uint32_t result;
		__ASM volatile ("MRS %0, faultmask_ns" : "=r" (result) );
		return(result);
	}
	__STATIC_FORCEINLINE void TZ_set_FAULTMASK_NS(std::uint32_t faultMask) { __ASM volatile ("MSR faultmask_ns, %0" : : "r" (faultMask) : "memory"); }
#endif

#endif /* ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
           (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
           (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1))    ) */


#if ((defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) || \
     (defined (__ARM_ARCH_8M_BASE__ ) && (__ARM_ARCH_8M_BASE__ == 1))    )
	__STATIC_FORCEINLINE std::uint32_t get_PSPLIM(void)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) && \
		(!defined (__ARM_FEATURE_CMSE) || (__ARM_FEATURE_CMSE < 3)))
		// without main extensions, the non-secure PSPLIM is RAZ/WI
		return 0U;
	#else
		std::uint32_t result;
		__ASM volatile ("MRS %0, psplim"  : "=r" (result) );
		return result;
	#endif
	}
	__STATIC_FORCEINLINE void set_PSPLIM(std::uint32_t ProcStackPtrLimit)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) && \
		(!defined (__ARM_FEATURE_CMSE) || (__ARM_FEATURE_CMSE < 3)))
		// without main extensions, the non-secure PSPLIM is RAZ/WI
		(void)ProcStackPtrLimit;
	#else
		__ASM volatile ("MSR psplim, %0" : : "r" (ProcStackPtrLimit));
	#endif
	}

#if (defined (__ARM_FEATURE_CMSE) && (__ARM_FEATURE_CMSE == 3))
	__STATIC_FORCEINLINE std::uint32_t TZ_get_PSPLIM_NS(void)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)))
		// without main extensions, the non-secure PSPLIM is RAZ/WI
		return 0U;
	#else
		std::uint32_t result;
		__ASM volatile ("MRS %0, psplim_ns"  : "=r" (result) );
		return result;
	#endif
	}
	__STATIC_FORCEINLINE void TZ_set_PSPLIM_NS(std::uint32_t ProcStackPtrLimit)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)))
		// without main extensions, the non-secure PSPLIM is RAZ/WI
		(void)ProcStackPtrLimit;
	#else
		__ASM volatile ("MSR psplim_ns, %0\n" : : "r" (ProcStackPtrLimit));
	#endif
	}
#endif

	__STATIC_FORCEINLINE std::uint32_t get_MSPLIM(void)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) && \
		(!defined (__ARM_FEATURE_CMSE) || (__ARM_FEATURE_CMSE < 3)))
		// without main extensions, the non-secure MSPLIM is RAZ/WI
		return 0U;
	#else
		std::uint32_t result;
		__ASM volatile ("MRS %0, msplim" : "=r" (result) );
		return result;
	#endif
	}
	__STATIC_FORCEINLINE void set_MSPLIM(std::uint32_t MainStackPtrLimit)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) && \
		(!defined (__ARM_FEATURE_CMSE) || (__ARM_FEATURE_CMSE < 3)))
		// without main extensions, the non-secure MSPLIM is RAZ/WI
		(void)MainStackPtrLimit;
	#else
		__ASM volatile ("MSR msplim, %0" : : "r" (MainStackPtrLimit));
	#endif
	}
#if (defined (__ARM_FEATURE_CMSE  ) && (__ARM_FEATURE_CMSE   == 3))
	__STATIC_FORCEINLINE void TZ_set_MSPLIM_NS(std::uint32_t MainStackPtrLimit)
	{
	#if (!(defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)))
	  // without main extensions, the non-secure MSPLIM is RAZ/WI
		(void)MainStackPtrLimit;
	#else
		__ASM volatile ("MSR msplim_ns, %0" : : "r" (MainStackPtrLimit));
	#endif
	}
#endif

#endif /* ((defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) || \
           (defined (__ARM_ARCH_8M_BASE__ ) && (__ARM_ARCH_8M_BASE__ == 1))    ) */

	__STATIC_FORCEINLINE std::uint32_t __get_FPSCR(void)
	{
	#if ((defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)) && \
		 (defined (__FPU_USED   ) && (__FPU_USED    == 1U))     )
	#if __has_builtin(__builtin_arm_get_fpscr)
	// Re-enable using built-in when GCC has been fixed
	// || (__GNUC__ > 7) || (__GNUC__ == 7 && __GNUC_MINOR__ >= 2)
		/* see https://gcc.gnu.org/ml/gcc-patches/2017-04/msg00443.html */
		return __builtin_arm_get_fpscr();
	#else
		std::uint32_t result;

		__ASM volatile ("VMRS %0, fpscr" : "=r" (result) );
		return(result);
	#endif
	#else
		return(0U);
	#endif
	}
	__STATIC_FORCEINLINE void __set_FPSCR(std::uint32_t fpscr)
	{
	#if ((defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)) && \
		 (defined (__FPU_USED   ) && (__FPU_USED    == 1U))     )
	#if __has_builtin(__builtin_arm_set_fpscr)
	// Re-enable using built-in when GCC has been fixed
	// || (__GNUC__ > 7) || (__GNUC__ == 7 && __GNUC_MINOR__ >= 2)
		/* see https://gcc.gnu.org/ml/gcc-patches/2017-04/msg00443.html */
		__builtin_arm_set_fpscr(fpscr);
	#else
		__ASM volatile ("VMSR fpscr, %0" : : "r" (fpscr) : "vfpcc", "memory");
	#endif
	#else
		//UNUSED(fpscr);
	#endif
	}
/*@} end of CMSIS_Core_RegAccFunctions */

/* ##########################  Core Instruction Access  ######################### */
/** \defgroup CMSIS_Core_InstructionInterface CMSIS Core Instruction Interface
  Access to dedicated instructions
  @{
*/

/* Define macros for porting to both thumb1 and thumb2.
 * For thumb1, use low register (r0-r7), specified by constraint "l"
 * Otherwise, use general registers, specified by constraint "r" */
#if defined (__thumb__) && !defined (__thumb2__)
#define __CMSIS_GCC_OUT_REG(r) "=l" (r)
#define __CMSIS_GCC_RW_REG(r) "+l" (r)
#define __CMSIS_GCC_USE_REG(r) "l" (r)
#else
#define __CMSIS_GCC_OUT_REG(r) "=r" (r)
#define __CMSIS_GCC_RW_REG(r) "+r" (r)
#define __CMSIS_GCC_USE_REG(r) "r" (r)
#endif

	__STATIC_FORCEINLINE void NOP() { __ASM volatile ("nop"); }
	__STATIC_FORCEINLINE void WFI() { __ASM volatile ("wfi"); }
	__STATIC_FORCEINLINE void WFE() { __ASM volatile ("wfe"); }
	__STATIC_FORCEINLINE void SEV() { __ASM volatile ("sev"); }

	/**
	  \brief   Instruction Synchronization Barrier
	  \details Instruction Synchronization Barrier flushes the pipeline in the processor,
			   so that all instructions following the ISB are fetched from cache or memory,
			   after the instruction has been completed.
	 */
	__STATIC_FORCEINLINE void ISB() { __ASM volatile ("isb 0xF":::"memory"); }
	/**
	  \brief   Data Synchronization Barrier
	  \details Acts as a special kind of Data Memory Barrier.
			   It completes when all explicit memory accesses before this instruction complete.
	 */
	__STATIC_FORCEINLINE void DSB() { __ASM volatile ("dsb 0xF":::"memory"); }
	/**
	  \brief   Data Memory Barrier
	  \details Ensures the apparent order of the explicit memory operations before
			   and after the instruction, without ensuring their completion.
	 */
	__STATIC_FORCEINLINE void DMB() { __ASM volatile ("dmb 0xF":::"memory"); }

	__STATIC_FORCEINLINE std::uint32_t REV(std::uint32_t value)
	{
	#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
		return __builtin_bswap32(value);
	#else
		std::uint32_t result;

		__ASM volatile ("rev %0, %1" : __CMSIS_GCC_OUT_REG (result) : __CMSIS_GCC_USE_REG (value) );
		return result;
	#endif
	}
	__STATIC_FORCEINLINE std::uint32_t REV16(std::uint32_t value)
	{
		std::uint32_t result;
		__ASM volatile ("rev16 %0, %1" : __CMSIS_GCC_OUT_REG (result) : __CMSIS_GCC_USE_REG (value) );
		return result;
	}

	__STATIC_FORCEINLINE std::int16_t REVSH(std::int16_t value)
	{
	#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
		return (std::int16_t)__builtin_bswap16(value);
	#else
		std::int16_t result;
		__ASM volatile ("revsh %0, %1" : __CMSIS_GCC_OUT_REG (result) : __CMSIS_GCC_USE_REG (value) );
		return result;
	#endif
	}

	__STATIC_FORCEINLINE std::uint32_t ROR(std::uint32_t op1, std::uint32_t op2)
	{
		op2 %= 32U;
		if (op2 == 0U)
		{
			return op1;
		}
		return (op1 >> op2) | (op1 << (32U - op2));
	}

#define __BKPT(value)                       __ASM volatile ("bkpt "#value)

	__STATIC_FORCEINLINE std::uint32_t RBIT(std::uint32_t value)
	{
		std::uint32_t result;

	#if ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
		 (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
		 (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1))    )
		__ASM volatile ("rbit %0, %1" : "=r" (result) : "r" (value) );
	#else
		std::uint32_t s = (4U /*sizeof(v)*/ * 8U) - 1U; /* extra shift needed at end */

		result = value;                      /* r will be reversed bits of v; first get LSB of v */
		for (value >>= 1U; value != 0U; value >>= 1U)
		{
			result <<= 1U;
			result |= value & 1U;
			s--;
		}
		result <<= s;                        /* shift when v's highest bits are zero */
	#endif
		return result;
	}

#define __CLZ             (uint8_t)__builtin_clz

#if ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
     (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
     (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) || \
     (defined (__ARM_ARCH_8M_BASE__ ) && (__ARM_ARCH_8M_BASE__ == 1))    )
	__STATIC_FORCEINLINE uint8_t LDREXB(volatile uint8_t *addr)
	{
		uint32_t result;
	#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
		__ASM volatile ("ldrexb %0, %1" : "=r" (result) : "Q" (*addr) );
	#else
		/* Prior to GCC 4.8, "Q" will be expanded to [rx, #0] which is not
		accepted by assembler. So has to use following less efficient pattern.
		*/
		__ASM volatile ("ldrexb %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
	#endif
		return ((uint8_t) result);    /* Add explicit type cast here */
	}

	__STATIC_FORCEINLINE uint16_t LDREXH(volatile uint16_t *addr)
	{
		uint32_t result;
	#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
		__ASM volatile ("ldrexh %0, %1" : "=r" (result) : "Q" (*addr) );
	#else
		/* Prior to GCC 4.8, "Q" will be expanded to [rx, #0] which is not
		   accepted by assembler. So has to use following less efficient pattern.
		*/
		__ASM volatile ("ldrexh %0, [%1]" : "=r" (result) : "r" (addr) : "memory" );
	#endif
		return ((uint16_t) result);    /* Add explicit type cast here */
	}

	__STATIC_FORCEINLINE uint32_t LDREXW(volatile uint32_t *addr)
	{
		uint32_t result;
		__ASM volatile ("ldrex %0, %1" : "=r" (result) : "Q" (*addr) );
		return(result);
	}

	__STATIC_FORCEINLINE uint32_t STREXB(uint8_t value, volatile uint8_t *addr)
	{
		uint32_t result;
		__ASM volatile ("strexb %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
		return(result);
	}

	__STATIC_FORCEINLINE uint32_t STREXH(uint16_t value, volatile uint16_t *addr)
	{
		uint32_t result;
		__ASM volatile ("strexh %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" ((uint32_t)value) );
		return(result);
	}

	__STATIC_FORCEINLINE uint32_t STREXW(uint32_t value, volatile uint32_t *addr)
	{
		uint32_t result;
		__ASM volatile ("strex %0, %2, %1" : "=&r" (result), "=Q" (*addr) : "r" (value) );
		return(result);
	}

	__STATIC_FORCEINLINE void CLREX(void)
	{
		__ASM volatile ("clrex" ::: "memory");
	}

#endif /* ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
           (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
           (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) || \
           (defined (__ARM_ARCH_8M_BASE__ ) && (__ARM_ARCH_8M_BASE__ == 1))    ) */


#if ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
     (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
     (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1))    )
	__STATIC_FORCEINLINE std::uint32_t SSAT(std::uint32_t op1, std::uint32_t op2)
	{
		std::uint32_t result;
		__ASM volatile ("ssat %0, %1, %2" : "=r" (result) : "I" (op2), "r" (op1) );
		return result;
	}

	__STATIC_FORCEINLINE std::uint32_t USAT(std::uint32_t op1, std::uint32_t op2)
	{
		std::uint32_t result;
		__ASM volatile ("usat %0, %1, %2" : "=r" (result) : "I" (op2), "r" (op1) );
		return result;
	}

	__STATIC_FORCEINLINE std::uint32_t RRX(std::uint32_t value)
	{
		std::uint32_t result;
		__ASM volatile ("rrx %0, %1" : __CMSIS_GCC_OUT_REG (result) : __CMSIS_GCC_USE_REG (value) );
		return result;
	}

	__STATIC_FORCEINLINE std::uint8_t LDRBT(volatile std::uint8_t *ptr)
	{
		std::uint32_t result;
	#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
		__ASM volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
	#else
		/* Prior to GCC 4.8, "Q" will be expanded to [rx, #0] which is not
		   accepted by assembler. So has to use following less efficient pattern.
		*/
		__ASM volatile ("ldrbt %0, [%1]" : "=r" (result) : "r" (ptr) : "memory" );
	#endif
		return ((uint8_t) result);    /* Add explicit type cast here */
	}

	__STATIC_FORCEINLINE std::uint16_t LDRHT(volatile std::uint16_t *ptr)
	{
		std::uint32_t result;
	#if (__GNUC__ > 4) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 8)
		__ASM volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
	#else
		/* Prior to GCC 4.8, "Q" will be expanded to [rx, #0] which is not
		   accepted by assembler. So has to use following less efficient pattern.
		*/
		__ASM volatile ("ldrht %0, [%1]" : "=r" (result) : "r" (ptr) : "memory" );
	#endif
		return ((uint16_t) result);    /* Add explicit type cast here */
	}

	__STATIC_FORCEINLINE std::uint32_t LDRT(volatile std::uint32_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
		return(result);
	}

	__STATIC_FORCEINLINE void STRBT(std::uint8_t value, volatile std::uint8_t *ptr)
	{
		__ASM volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((std::uint32_t)value) );
	}

	__STATIC_FORCEINLINE void STRHT(uint16_t value, volatile std::uint16_t *ptr)
	{
		__ASM volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((std::uint32_t)value) );
	}

	__STATIC_FORCEINLINE void STRT(std::uint32_t value, volatile std::uint32_t *ptr)
	{
		__ASM volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
	}

#else  /* ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
           (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
           (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1))    ) */

	__STATIC_FORCEINLINE std::int32_t SSAT(std::int32_t val, std::uint32_t sat)
	{
		if ((sat >= 1U) && (sat <= 32U))
		{
			const std::int32_t max = (std::int32_t)((1U << (sat - 1U)) - 1U);
			const std::int32_t min = -1 - max ;
			if (val > max)
			{
				return max;
			}
			else if (val < min)
			{
				return min;
			}
		}
		return val;
	}

	__STATIC_FORCEINLINE std::uint32_t USAT(std::int32_t val, std::uint32_t sat)
	{
		if (sat <= 31U)
		{
			const std::uint32_t max = ((1U << sat) - 1U);
			if (val > (std::int32_t)max)
			{
				return max;
			}
			else if (val < 0)
			{
				return 0U;
			}
		}
		return (uint32_t)val;
	}

#endif /* ((defined (__ARM_ARCH_7M__      ) && (__ARM_ARCH_7M__      == 1)) || \
           (defined (__ARM_ARCH_7EM__     ) && (__ARM_ARCH_7EM__     == 1)) || \
           (defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1))    ) */

#if ((defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) || \
     (defined (__ARM_ARCH_8M_BASE__ ) && (__ARM_ARCH_8M_BASE__ == 1))    )

__STATIC_FORCEINLINE std::uint8_t LDAB(volatile std::uint8_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("ldab %0, %1" : "=r" (result) : "Q" (*ptr) );
		return ((std::uint8_t) result);
	}

	__STATIC_FORCEINLINE std::uint16_t LDAH(volatile std::uint16_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("ldah %0, %1" : "=r" (result) : "Q" (*ptr) );
		return ((std::uint16_t) result);
	}

	__STATIC_FORCEINLINE std::uint32_t LDA(volatile std::uint32_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("lda %0, %1" : "=r" (result) : "Q" (*ptr) );
		return(result);
	}

	__STATIC_FORCEINLINE void STLB(std::uint8_t value, volatile std::uint8_t *ptr)
	{
		__ASM volatile ("stlb %1, %0" : "=Q" (*ptr) : "r" ((std::uint32_t)value) );
	}

	__STATIC_FORCEINLINE void STLH(std::uint16_t value, volatile std::uint16_t *ptr)
	{
		__ASM volatile ("stlh %1, %0" : "=Q" (*ptr) : "r" ((std::uint32_t)value) );
	}

	__STATIC_FORCEINLINE void STL(std::uint32_t value, volatile std::uint32_t *ptr)
	{
		__ASM volatile ("stl %1, %0" : "=Q" (*ptr) : "r" ((std::uint32_t)value) );
	}

	__STATIC_FORCEINLINE std::uint8_t LDAEXB(volatile std::uint8_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("ldaexb %0, %1" : "=r" (result) : "Q" (*ptr) );
		return ((std::uint8_t) result);
	}

	__STATIC_FORCEINLINE std::uint16_t LDAEXH(volatile std::uint16_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("ldaexh %0, %1" : "=r" (result) : "Q" (*ptr) );
		return ((std::uint16_t) result);
	}

	__STATIC_FORCEINLINE std::uint32_t LDAEX(volatile std::uint32_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("ldaex %0, %1" : "=r" (result) : "Q" (*ptr) );
		return(result);
	}

	__STATIC_FORCEINLINE std::uint32_t STLEXB(std::uint8_t value, volatile std::uint8_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("stlexb %0, %2, %1" : "=&r" (result), "=Q" (*ptr) : "r" ((std::uint32_t)value) );
		return(result);
	}

	__STATIC_FORCEINLINE std::uint32_t STLEXH(std::uint16_t value, volatile std::uint16_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("stlexh %0, %2, %1" : "=&r" (result), "=Q" (*ptr) : "r" ((std::uint32_t)value) );
		return(result);
	}

	__STATIC_FORCEINLINE std::uint32_t STLEX(std::uint32_t value, volatile std::uint32_t *ptr)
	{
		std::uint32_t result;
		__ASM volatile ("stlex %0, %2, %1" : "=&r" (result), "=Q" (*ptr) : "r" ((uint32_t)value) );
		return(result);
	}

#endif /* ((defined (__ARM_ARCH_8M_MAIN__ ) && (__ARM_ARCH_8M_MAIN__ == 1)) || \
           (defined (__ARM_ARCH_8M_BASE__ ) && (__ARM_ARCH_8M_BASE__ == 1))    ) */
/*@}*/ /* end of group CMSIS_Core_InstructionInterface */
}



/* ###################  Compiler specific Intrinsics  ########################### */
/** \defgroup CMSIS_SIMD_intrinsics CMSIS SIMD Intrinsics
  Access to dedicated SIMD instructions
  @{
*/

#if (defined (__ARM_FEATURE_DSP) && (__ARM_FEATURE_DSP == 1))

__STATIC_FORCEINLINE uint32_t __SADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("sadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __QADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("qadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("shadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UQADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uqadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uhadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__STATIC_FORCEINLINE uint32_t __SSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("ssub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __QSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("qsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("shsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __USUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("usub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UQSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uqsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uhsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__STATIC_FORCEINLINE uint32_t __SADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("sadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __QADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("qadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("shadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UQADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uqadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uhadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("ssub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __QSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("qsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("shsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __USUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("usub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UQSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uqsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uhsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("sasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __QASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("qasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("shasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UQASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uqasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uhasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("ssax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __QSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("qsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("shsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __USAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("usax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UQSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uqsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uhsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __USAD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("usad8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __USADA8(uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __ASM volatile ("usada8 %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

#define __SSAT16(ARG1,ARG2) \
({                          \
  int32_t __RES, __ARG1 = (ARG1); \
  __ASM ("ssat16 %0, %1, %2" : "=r" (__RES) :  "I" (ARG2), "r" (__ARG1) ); \
  __RES; \
 })

#define __USAT16(ARG1,ARG2) \
({                          \
  uint32_t __RES, __ARG1 = (ARG1); \
  __ASM ("usat16 %0, %1, %2" : "=r" (__RES) :  "I" (ARG2), "r" (__ARG1) ); \
  __RES; \
 })

__STATIC_FORCEINLINE uint32_t __UXTB16(uint32_t op1)
{
  uint32_t result;

  __ASM volatile ("uxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__STATIC_FORCEINLINE uint32_t __UXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("uxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SXTB16(uint32_t op1)
{
  uint32_t result;

  __ASM volatile ("sxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("sxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMUAD  (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("smuad %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMUADX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("smuadx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMLAD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __ASM volatile ("smlad %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMLADX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __ASM volatile ("smladx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__STATIC_FORCEINLINE uint64_t __SMLALD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;

#ifndef __ARMEB__   /* Little endian */
  __ASM volatile ("smlald %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );
#else               /* Big endian */
  __ASM volatile ("smlald %0, %1, %2, %3" : "=r" (llr.w32[1]), "=r" (llr.w32[0]): "r" (op1), "r" (op2) , "0" (llr.w32[1]), "1" (llr.w32[0]) );
#endif

  return(llr.w64);
}

__STATIC_FORCEINLINE uint64_t __SMLALDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;

#ifndef __ARMEB__   /* Little endian */
  __ASM volatile ("smlaldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );
#else               /* Big endian */
  __ASM volatile ("smlaldx %0, %1, %2, %3" : "=r" (llr.w32[1]), "=r" (llr.w32[0]): "r" (op1), "r" (op2) , "0" (llr.w32[1]), "1" (llr.w32[0]) );
#endif

  return(llr.w64);
}

__STATIC_FORCEINLINE uint32_t __SMUSD  (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("smusd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMUSDX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("smusdx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMLSD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __ASM volatile ("smlsd %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__STATIC_FORCEINLINE uint32_t __SMLSDX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __ASM volatile ("smlsdx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__STATIC_FORCEINLINE uint64_t __SMLSLD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;

#ifndef __ARMEB__   /* Little endian */
  __ASM volatile ("smlsld %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );
#else               /* Big endian */
  __ASM volatile ("smlsld %0, %1, %2, %3" : "=r" (llr.w32[1]), "=r" (llr.w32[0]): "r" (op1), "r" (op2) , "0" (llr.w32[1]), "1" (llr.w32[0]) );
#endif

  return(llr.w64);
}

__STATIC_FORCEINLINE uint64_t __SMLSLDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;

#ifndef __ARMEB__   /* Little endian */
  __ASM volatile ("smlsldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );
#else               /* Big endian */
  __ASM volatile ("smlsldx %0, %1, %2, %3" : "=r" (llr.w32[1]), "=r" (llr.w32[0]): "r" (op1), "r" (op2) , "0" (llr.w32[1]), "1" (llr.w32[0]) );
#endif

  return(llr.w64);
}

__STATIC_FORCEINLINE uint32_t __SEL  (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __ASM volatile ("sel %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE  int32_t __QADD( int32_t op1,  int32_t op2)
{
  int32_t result;

  __ASM volatile ("qadd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__STATIC_FORCEINLINE  int32_t __QSUB( int32_t op1,  int32_t op2)
{
  int32_t result;

  __ASM volatile ("qsub %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

#if 0
#define __PKHBT(ARG1,ARG2,ARG3) \
({                          \
  uint32_t __RES, __ARG1 = (ARG1), __ARG2 = (ARG2); \
  __ASM ("pkhbt %0, %1, %2, lsl %3" : "=r" (__RES) :  "r" (__ARG1), "r" (__ARG2), "I" (ARG3)  ); \
  __RES; \
 })

#define __PKHTB(ARG1,ARG2,ARG3) \
({                          \
  uint32_t __RES, __ARG1 = (ARG1), __ARG2 = (ARG2); \
  if (ARG3 == 0) \
    __ASM ("pkhtb %0, %1, %2" : "=r" (__RES) :  "r" (__ARG1), "r" (__ARG2)  ); \
  else \
    __ASM ("pkhtb %0, %1, %2, asr %3" : "=r" (__RES) :  "r" (__ARG1), "r" (__ARG2), "I" (ARG3)  ); \
  __RES; \
 })
#endif

#define __PKHBT(ARG1,ARG2,ARG3)          ( ((((uint32_t)(ARG1))          ) & 0x0000FFFFUL) |  \
                                           ((((uint32_t)(ARG2)) << (ARG3)) & 0xFFFF0000UL)  )

#define __PKHTB(ARG1,ARG2,ARG3)          ( ((((uint32_t)(ARG1))          ) & 0xFFFF0000UL) |  \
                                           ((((uint32_t)(ARG2)) >> (ARG3)) & 0x0000FFFFUL)  )

__STATIC_FORCEINLINE int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
 int32_t result;

 __ASM volatile ("smmla %0, %1, %2, %3" : "=r" (result): "r"  (op1), "r" (op2), "r" (op3) );
 return(result);
}

#endif /* (__ARM_FEATURE_DSP == 1) */
/*@} end of group CMSIS_SIMD_intrinsics */


#pragma GCC diagnostic pop

#endif /* __CMSIS_GCC_H */
