#pragma once

#include <cstdint>
#include <cstddef>

template <std::uint32_t... bitmask>
inline constexpr std::uint32_t SetBits()
{
	return (bitmask | ...);
}

#define __CORTEX_M                (3U)                                       /*!< Cortex-M Core */

/* IO definitions (access restrictions to peripheral registers) */
#define     __I      volatile const      /*!< Defines 'read only' permissions */
#define     __O      volatile            /*!< Defines 'write only' permissions */
#define     __IO     volatile            /*!< Defines 'read / write' permissions */

/* following defines should be used for structure members */
#define     __IM     volatile const      /*! Defines 'read only' structure member permissions */
#define     __OM     volatile            /*! Defines 'write only' structure member permissions */
#define     __IOM    volatile            /*! Defines 'read / write' structure member permissions */

#define FIELD_MSK(name) name = (static_cast<std::uint32_t>(EFields:: name ## _FIELD) << static_cast<std::uint32_t>(EOffsets:: name ## _OFFSET))

#include "cmsis_compiler.h"

namespace CORTEX
{

#define COREDEBUG_BASE                 0xe000edf0
#define DWT_BASE                       0xe0001000
#define ITM_BASE                       0xe0000000
#define SCS_BASE                       0xe000e000
#define SCB_BASE                       (SCS_BASE +  0x0D00)
#define SYSTICK_BASE                   (SCS_BASE +  0x0010)
#define NVIC_BASE                      (SCS_BASE +  0x0100)

#define __CONTROL 1
#define __CoreDebug 1
#define __DWT 1
#define __ITM 1
#define __SCB 1
#define __SCS 1
#define __SysTick 1
#define __xPSR 1

	/*CONTROL register*/
	class CONTROL
	{
	private:
		union CONTROL_t
		{
			struct
			{
				std::uint32_t nPRIV          :  1;	/* Thread mode privilege level */
				std::uint32_t SPSEL          :  1;	/* Currently active stack pointer */
				std::uint32_t                : 30;
			} bt;
			uint32_t dw;
		};
	public:
		CONTROL_t value;

		enum class EOffsets: std::uint32_t
		{
			nPRIV_OFFSET           = 0,
			SPSEL_OFFSET           = 1,
		};
		enum class EFields: std::uint32_t
		{
			nPRIV_FIELD            = 0x00000001U,
			SPSEL_FIELD            = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(nPRIV),
			FIELD_MSK(SPSEL),
		};
		static inline std::uint32_t get() { return (CORTEX::get_CONTROL()); }
		inline void read() { value.dw = CORTEX::get_CONTROL(); }
		static inline void set(std::uint32_t set_value) { CORTEX::set_CONTROL(set_value); }
		inline void write() { CORTEX::set_CONTROL(value.dw); }
	};
#define CONTROL_CONTROL_nPRIV
#define CONTROL_CONTROL_SPSEL
#pragma endregion CONTROL

#pragma region COREDEBUG
/* Debug Registers */
class COREDEBUG
{
public:
	struct COREDEBUG_t
	{
		__IO std::uint32_t	DHCSR;
		__IO std::uint32_t	DCRSR;
		__IO std::uint32_t	DCRDR;
		__IO std::uint32_t	DEMCR;
	};
private:
	static inline volatile COREDEBUG_t* get_ptr() { return (reinterpret_cast<COREDEBUG_t*>(COREDEBUG_BASE)); }
public:
	/*Debug Halting Control and Status Register*/
	class DHCSR
	{
	private:
		union DHCSR_t
		{
			struct
			{
				std::uint32_t C_DEBUGEN      :  1;	/* - */
				std::uint32_t C_HALT         :  1;	/* - */
				std::uint32_t C_STEP         :  1;	/* - */
				std::uint32_t C_MASKINTS     :  1;	/* - */
				std::uint32_t                :  1;
				std::uint32_t C_SNAPSTALL    :  1;	/* - */
				std::uint32_t                : 10;
				std::uint32_t S_REGRDY       :  1;	/* - */
				std::uint32_t S_HALT         :  1;	/* - */
				std::uint32_t S_SLEEP        :  1;	/* - */
				std::uint32_t S_LOCKUP       :  1;	/* - */
				std::uint32_t                :  4;
				std::uint32_t S_RETIRE_ST    :  1;	/* - */
				std::uint32_t S_RESET_ST     :  1;	/* - */
				std::uint32_t                :  6;
			} bt;
			uint32_t dw;
		};
	public:
		DHCSR_t value;

		enum class EOffsets: std::uint32_t
		{
			C_DEBUGEN_OFFSET       = 0,
			C_HALT_OFFSET          = 1,
			C_STEP_OFFSET          = 2,
			C_MASKINTS_OFFSET      = 3,
			C_SNAPSTALL_OFFSET     = 5,
			S_REGRDY_OFFSET        = 16,
			S_HALT_OFFSET          = 17,
			S_SLEEP_OFFSET         = 18,
			S_LOCKUP_OFFSET        = 19,
			S_RETIRE_ST_OFFSET     = 24,
			S_RESET_ST_OFFSET      = 25,
		};
		enum class EFields: std::uint32_t
		{
			C_DEBUGEN_FIELD        = 0x00000001U,
			C_HALT_FIELD           = 0x00000001U,
			C_STEP_FIELD           = 0x00000001U,
			C_MASKINTS_FIELD       = 0x00000001U,
			C_SNAPSTALL_FIELD      = 0x00000001U,
			S_REGRDY_FIELD         = 0x00000001U,
			S_HALT_FIELD           = 0x00000001U,
			S_SLEEP_FIELD          = 0x00000001U,
			S_LOCKUP_FIELD         = 0x00000001U,
			S_RETIRE_ST_FIELD      = 0x00000001U,
			S_RESET_ST_FIELD       = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(C_DEBUGEN),
			FIELD_MSK(C_HALT),
			FIELD_MSK(C_STEP),
			FIELD_MSK(C_MASKINTS),
			FIELD_MSK(C_SNAPSTALL),
			FIELD_MSK(S_REGRDY),
			FIELD_MSK(S_HALT),
			FIELD_MSK(S_SLEEP),
			FIELD_MSK(S_LOCKUP),
			FIELD_MSK(S_RETIRE_ST),
			FIELD_MSK(S_RESET_ST),
		};
		static inline std::uint32_t get() { return (get_ptr()->DHCSR); }
		inline void read() { value.dw = get_ptr()->DHCSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->DHCSR = set_value; }
		inline void write() { get_ptr()->DHCSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->DHCSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->DHCSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->DHCSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*Debug Core Register Selector Register*/
	class DCRSR
	{
	private:
		union DCRSR_t
		{
			struct
			{
				std::uint32_t REGSEL         :  1;	/* 0 */
				std::uint32_t                : 15;
				std::uint32_t REGWnR         :  1;	/* 0 */
				std::uint32_t                : 15;
			} bt;
			uint32_t dw;
		};
	public:
		DCRSR_t value;

		enum class EOffsets: std::uint32_t
		{
			REGSEL_OFFSET          = 0,
			REGWnR_OFFSET          = 16,
		};
		enum class EFields: std::uint32_t
		{
			REGSEL_FIELD           = 0x00000001U,
			REGWnR_FIELD           = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(REGSEL),
			FIELD_MSK(REGWnR),
		};
		static inline std::uint32_t get() { return (get_ptr()->DCRSR); }
		inline void read() { value.dw = get_ptr()->DCRSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->DCRSR = set_value; }
		inline void write() { get_ptr()->DCRSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->DCRSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->DCRSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->DCRSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*Debug Core Register Data Register*/
	class DCRDR
	{
	private:
		union DCRDR_t
		{
			struct
			{
				std::uint32_t DATA           : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		DCRDR_t value;

		enum class EOffsets: std::uint32_t
		{
			DATA_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			DATA_FIELD             = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(DATA),
		};
		static inline std::uint32_t get() { return (get_ptr()->DCRDR); }
		inline void read() { value.dw = get_ptr()->DCRDR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->DCRDR = set_value; }
		inline void write() { get_ptr()->DCRDR = value.dw; }
		static inline std::uint32_t get_DATA() { return (reinterpret_cast<volatile DCRDR_t*>(COREDEBUG_BASE + offsetof(COREDEBUG_t, DCRDR))->bt.DATA); }
		static inline void set_DATA(std::uint32_t value) { reinterpret_cast<volatile DCRDR_t*>(COREDEBUG_BASE + offsetof(COREDEBUG_t, DCRDR))->bt.DATA = value & static_cast<std::uint32_t>(EFields::DATA_FIELD); }
	};
	/*Debug Exception and Monitor Control Register*/
	class DEMCR
	{
	private:
		union DEMCR_t
		{
			struct
			{
				std::uint32_t VC_CORERESET   :  1;	/* - */
				std::uint32_t                :  3;
				std::uint32_t VC_MMERR       :  1;	/* - */
				std::uint32_t VC_NOCPERR     :  1;	/* - */
				std::uint32_t VC_CHKERR      :  1;	/* - */
				std::uint32_t VC_STATERR     :  1;	/* - */
				std::uint32_t VC_BUSERR      :  1;	/* - */
				std::uint32_t VC_INTERR      :  1;	/* - */
				std::uint32_t VC_HARDERR     :  1;	/* - */
				std::uint32_t                :  5;
				std::uint32_t MON_EN         :  1;	/* - */
				std::uint32_t MON_PEND       :  1;	/* - */
				std::uint32_t MON_STEP       :  1;	/* - */
				std::uint32_t MON_REQ        :  1;	/* - */
				std::uint32_t                :  4;
				std::uint32_t TRCENA         :  1;	/* - */
				std::uint32_t                :  7;
			} bt;
			uint32_t dw;
		};
	public:
		DEMCR_t value;

		enum class EOffsets: std::uint32_t
		{
			VC_CORERESET_OFFSET    = 0,
			VC_MMERR_OFFSET        = 4,
			VC_NOCPERR_OFFSET      = 5,
			VC_CHKERR_OFFSET       = 6,
			VC_STATERR_OFFSET      = 7,
			VC_BUSERR_OFFSET       = 8,
			VC_INTERR_OFFSET       = 9,
			VC_HARDERR_OFFSET      = 10,
			MON_EN_OFFSET          = 16,
			MON_PEND_OFFSET        = 17,
			MON_STEP_OFFSET        = 18,
			MON_REQ_OFFSET         = 19,
			TRCENA_OFFSET          = 24,
		};
		enum class EFields: std::uint32_t
		{
			VC_CORERESET_FIELD     = 0x00000001U,
			VC_MMERR_FIELD         = 0x00000001U,
			VC_NOCPERR_FIELD       = 0x00000001U,
			VC_CHKERR_FIELD        = 0x00000001U,
			VC_STATERR_FIELD       = 0x00000001U,
			VC_BUSERR_FIELD        = 0x00000001U,
			VC_INTERR_FIELD        = 0x00000001U,
			VC_HARDERR_FIELD       = 0x00000001U,
			MON_EN_FIELD           = 0x00000001U,
			MON_PEND_FIELD         = 0x00000001U,
			MON_STEP_FIELD         = 0x00000001U,
			MON_REQ_FIELD          = 0x00000001U,
			TRCENA_FIELD           = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VC_CORERESET),
			FIELD_MSK(VC_MMERR),
			FIELD_MSK(VC_NOCPERR),
			FIELD_MSK(VC_CHKERR),
			FIELD_MSK(VC_STATERR),
			FIELD_MSK(VC_BUSERR),
			FIELD_MSK(VC_INTERR),
			FIELD_MSK(VC_HARDERR),
			FIELD_MSK(MON_EN),
			FIELD_MSK(MON_PEND),
			FIELD_MSK(MON_STEP),
			FIELD_MSK(MON_REQ),
			FIELD_MSK(TRCENA),
		};
		static inline std::uint32_t get() { return (get_ptr()->DEMCR); }
		inline void read() { value.dw = get_ptr()->DEMCR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->DEMCR = set_value; }
		inline void write() { get_ptr()->DEMCR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->DEMCR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->DEMCR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->DEMCR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
};

#define COREDEBUG_DHCSR_C_DEBUGEN
#define COREDEBUG_DHCSR_C_HALT
#define COREDEBUG_DHCSR_C_STEP
#define COREDEBUG_DHCSR_C_MASKINTS
#define COREDEBUG_DHCSR_C_SNAPSTALL
#define COREDEBUG_DHCSR_S_REGRDY
#define COREDEBUG_DHCSR_S_HALT
#define COREDEBUG_DHCSR_S_SLEEP
#define COREDEBUG_DHCSR_S_LOCKUP
#define COREDEBUG_DHCSR_S_RETIRE_ST
#define COREDEBUG_DHCSR_S_RESET_ST
#define COREDEBUG_DCRSR_REGSEL
#define COREDEBUG_DCRSR_REGWnR
#define COREDEBUG_DCRDR_DATA
#define COREDEBUG_DEMCR_VC_CORERESET
#define COREDEBUG_DEMCR_VC_MMERR
#define COREDEBUG_DEMCR_VC_NOCPERR
#define COREDEBUG_DEMCR_VC_CHKERR
#define COREDEBUG_DEMCR_VC_STATERR
#define COREDEBUG_DEMCR_VC_BUSERR
#define COREDEBUG_DEMCR_VC_INTERR
#define COREDEBUG_DEMCR_VC_HARDERR
#define COREDEBUG_DEMCR_MON_EN
#define COREDEBUG_DEMCR_MON_PEND
#define COREDEBUG_DEMCR_MON_STEP
#define COREDEBUG_DEMCR_MON_REQ
#define COREDEBUG_DEMCR_TRCENA
#pragma endregion COREDEBUG

#pragma region DWT
/* Data watchpoint and trace unit */
class DWT
{
public:
	struct DWT_t
	{
		__IO std::uint32_t	CTRL;
		__IO std::uint32_t	CYCCNT;
		__IO std::uint32_t	CPICNT;
		__IO std::uint32_t	EXCCNT;
		__IO std::uint32_t	SLEEPCNT;
		__IO std::uint32_t	LSUCNT;
		__IO std::uint32_t	FOLDCNT;
		__IO std::uint32_t	PCSR;
		__IO std::uint32_t	COMP0;
		__IO std::uint32_t	MASK0;
		__IO std::uint32_t	FUNCTION0;
			 std::uint32_t	dummy_44;
		__IO std::uint32_t	COMP1;
		__IO std::uint32_t	MASK1;
		__IO std::uint32_t	FUNCTION1;
			 std::uint32_t	dummy_60;
		__IO std::uint32_t	COMP2;
		__IO std::uint32_t	MASK2;
		__IO std::uint32_t	FUNCTION2;
			 std::uint32_t	dummy_76;
		__IO std::uint32_t	COMP3;
		__IO std::uint32_t	MASK3;
		__IO std::uint32_t	FUNCTION3;
			 std::uint32_t	dummy_92[981];
		__I  std::uint32_t	LAR;
		__I  std::uint32_t	LSR;
			 std::uint32_t	dummy_4024[6];
		__I  std::uint32_t	PIDR4;
		__I  std::uint32_t	PIDR5;
		__I  std::uint32_t	PIDR6;
		__I  std::uint32_t	PIDR7;
		__I  std::uint32_t	PIDR0;
		__I  std::uint32_t	PIDR1;
		__I  std::uint32_t	PIDR2;
		__I  std::uint32_t	PIDR3;
		__I  std::uint32_t	CIDR0;
		__I  std::uint32_t	CIDR1;
		__I  std::uint32_t	CIDR2;
		__I  std::uint32_t	CIDR3;
	};
private:
	static inline volatile DWT_t* get_ptr() { return (reinterpret_cast<DWT_t*>(DWT_BASE)); }
public:
	/*DWT control register*/
	class CTRL
	{
	private:
		union CTRL_t
		{
			struct
			{
				std::uint32_t CYCCNTENA      :  1;	/* CYCCNT counter enable */
				std::uint32_t POSTPRESET     :  4;	/* Reload value of the POSTCNT counter */
				std::uint32_t POSTINIT       :  4;	/* Initial value of the POSTCNT counte */
				std::uint32_t CYCTAP         :  1;	/* Position of the POSTCNT tap on the CYCCNT counter */
				std::uint32_t SYNCTAP        :  2;	/* Position of synchronization packet counter tap on CYCCNT counter */
				std::uint32_t PCSAMPLENA     :  1;	/* POSTCNT counter use enable */
				std::uint32_t                :  3;
				std::uint32_t EXCTRCENA      :  1;	/* Enable for exception trace generation */
				std::uint32_t CPIEVTENA      :  1;	/* Enable for CPI counter overflow event generation */
				std::uint32_t EXCEVTENA      :  1;	/* Enable for exception overhead counter overflow event generation */
				std::uint32_t SLEEPEVTENA    :  1;	/* Enable for sleep counter overflow event generation */
				std::uint32_t LSUEVTENA      :  1;	/* Enable for LSU counter overflow event generation */
				std::uint32_t FOLDEVTENA     :  1;	/* Enable for folded instruction counter overflow event generation */
				std::uint32_t CYCEVTENA      :  1;	/* Enable for POSTCNT underflow event counter packet generation */
				std::uint32_t                :  1;
				std::uint32_t NOPRFCNT       :  1;	/* Profiling counter support (read-only) */
				std::uint32_t NOCYCCNT       :  1;	/* Cycle counter support (read-only) */
				std::uint32_t NOEXTTRIG      :  1;	/* External match signal, CMPMATCH support (read-only) */
				std::uint32_t NOTRCPKT       :  1;	/* Trace sampling and exception tracing support (read-only) */
				std::uint32_t NUMCOMP        :  4;	/* Number of comparators implemented (read-only) */
			} bt;
			uint32_t dw;
		};
	public:
		CTRL_t value;

		enum class EOffsets: std::uint32_t
		{
			CYCCNTENA_OFFSET       = 0,
			POSTPRESET_OFFSET      = 1,
			POSTINIT_OFFSET        = 5,
			CYCTAP_OFFSET          = 9,
			SYNCTAP_OFFSET         = 10,
			PCSAMPLENA_OFFSET      = 12,
			EXCTRCENA_OFFSET       = 16,
			CPIEVTENA_OFFSET       = 17,
			EXCEVTENA_OFFSET       = 18,
			SLEEPEVTENA_OFFSET     = 19,
			LSUEVTENA_OFFSET       = 20,
			FOLDEVTENA_OFFSET      = 21,
			CYCEVTENA_OFFSET       = 22,
			NOPRFCNT_OFFSET        = 24,
			NOCYCCNT_OFFSET        = 25,
			NOEXTTRIG_OFFSET       = 26,
			NOTRCPKT_OFFSET        = 27,
			NUMCOMP_OFFSET         = 28,
		};
		enum class EFields: std::uint32_t
		{
			CYCCNTENA_FIELD        = 0x00000001U,
			POSTPRESET_FIELD       = 0x0000000fU,
			POSTINIT_FIELD         = 0x0000000fU,
			CYCTAP_FIELD           = 0x00000001U,
			SYNCTAP_FIELD          = 0x00000003U,
			PCSAMPLENA_FIELD       = 0x00000001U,
			EXCTRCENA_FIELD        = 0x00000001U,
			CPIEVTENA_FIELD        = 0x00000001U,
			EXCEVTENA_FIELD        = 0x00000001U,
			SLEEPEVTENA_FIELD      = 0x00000001U,
			LSUEVTENA_FIELD        = 0x00000001U,
			FOLDEVTENA_FIELD       = 0x00000001U,
			CYCEVTENA_FIELD        = 0x00000001U,
			NOPRFCNT_FIELD         = 0x00000001U,
			NOCYCCNT_FIELD         = 0x00000001U,
			NOEXTTRIG_FIELD        = 0x00000001U,
			NOTRCPKT_FIELD         = 0x00000001U,
			NUMCOMP_FIELD          = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CYCCNTENA),
			FIELD_MSK(POSTPRESET),
			FIELD_MSK(POSTINIT),
			FIELD_MSK(CYCTAP),
			FIELD_MSK(SYNCTAP),
			FIELD_MSK(PCSAMPLENA),
			FIELD_MSK(EXCTRCENA),
			FIELD_MSK(CPIEVTENA),
			FIELD_MSK(EXCEVTENA),
			FIELD_MSK(SLEEPEVTENA),
			FIELD_MSK(LSUEVTENA),
			FIELD_MSK(FOLDEVTENA),
			FIELD_MSK(CYCEVTENA),
			FIELD_MSK(NOPRFCNT),
			FIELD_MSK(NOCYCCNT),
			FIELD_MSK(NOEXTTRIG),
			FIELD_MSK(NOTRCPKT),
			FIELD_MSK(NUMCOMP),
		};
		static inline std::uint32_t get() { return (get_ptr()->CTRL); }
		inline void read() { value.dw = get_ptr()->CTRL; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CTRL = set_value; }
		inline void write() { get_ptr()->CTRL = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->CTRL |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->CTRL &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->CTRL & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_POSTPRESET() { return (reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.POSTPRESET); }
		static inline void set_POSTPRESET(std::uint32_t value) { reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.POSTPRESET = value & static_cast<std::uint32_t>(EFields::POSTPRESET_FIELD); }
		static inline std::uint32_t get_POSTINIT() { return (reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.POSTINIT); }
		static inline void set_POSTINIT(std::uint32_t value) { reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.POSTINIT = value & static_cast<std::uint32_t>(EFields::POSTINIT_FIELD); }
		static inline std::uint32_t get_SYNCTAP() { return (reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.SYNCTAP); }
		static inline void set_SYNCTAP(std::uint32_t value) { reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.SYNCTAP = value & static_cast<std::uint32_t>(EFields::SYNCTAP_FIELD); }
		static inline std::uint32_t get_NUMCOMP() { return (reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.NUMCOMP); }
		static inline void set_NUMCOMP(std::uint32_t value) { reinterpret_cast<volatile CTRL_t*>(DWT_BASE + offsetof(DWT_t, CTRL))->bt.NUMCOMP = value & static_cast<std::uint32_t>(EFields::NUMCOMP_FIELD); }
	};
	/*Cycle Count Register*/
	class CYCCNT
	{
	private:
		union CYCCNT_t
		{
			struct
			{
				std::uint32_t CYCCNT         : 32;	/* Processor clock cycle counter */
			} bt;
			uint32_t dw;
		};
	public:
		CYCCNT_t value;

		enum class EOffsets: std::uint32_t
		{
			CYCCNT_OFFSET          = 0,
		};
		enum class EFields: std::uint32_t
		{
			CYCCNT_FIELD           = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CYCCNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->CYCCNT); }
		inline void read() { value.dw = get_ptr()->CYCCNT; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CYCCNT = set_value; }
		inline void write() { get_ptr()->CYCCNT = value.dw; }
		static inline std::uint32_t get_CYCCNT() { return (reinterpret_cast<volatile CYCCNT_t*>(DWT_BASE + offsetof(DWT_t, CYCCNT))->bt.CYCCNT); }
		static inline void set_CYCCNT(std::uint32_t value) { reinterpret_cast<volatile CYCCNT_t*>(DWT_BASE + offsetof(DWT_t, CYCCNT))->bt.CYCCNT = value & static_cast<std::uint32_t>(EFields::CYCCNT_FIELD); }
	};
	/*CPI Count Register*/
	class CPICNT
	{
	private:
		union CPICNT_t
		{
			struct
			{
				std::uint32_t CPICNT         :  8;	/* CPI counter */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CPICNT_t value;

		enum class EOffsets: std::uint32_t
		{
			CPICNT_OFFSET          = 0,
		};
		enum class EFields: std::uint32_t
		{
			CPICNT_FIELD           = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CPICNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->CPICNT); }
		inline void read() { value.dw = get_ptr()->CPICNT; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CPICNT = set_value; }
		inline void write() { get_ptr()->CPICNT = value.dw; }
		static inline std::uint32_t get_CPICNT() { return (reinterpret_cast<volatile CPICNT_t*>(DWT_BASE + offsetof(DWT_t, CPICNT))->bt.CPICNT); }
		static inline void set_CPICNT(std::uint32_t value) { reinterpret_cast<volatile CPICNT_t*>(DWT_BASE + offsetof(DWT_t, CPICNT))->bt.CPICNT = value & static_cast<std::uint32_t>(EFields::CPICNT_FIELD); }
	};
	/*Exception Overhead Count Register*/
	class EXCCNT
	{
	private:
		union EXCCNT_t
		{
			struct
			{
				std::uint32_t EXCCNT         :  8;	/* Exception overhead cycle counter */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		EXCCNT_t value;

		enum class EOffsets: std::uint32_t
		{
			EXCCNT_OFFSET          = 0,
		};
		enum class EFields: std::uint32_t
		{
			EXCCNT_FIELD           = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(EXCCNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->EXCCNT); }
		inline void read() { value.dw = get_ptr()->EXCCNT; }
		static inline void set(std::uint32_t set_value) { get_ptr()->EXCCNT = set_value; }
		inline void write() { get_ptr()->EXCCNT = value.dw; }
		static inline std::uint32_t get_EXCCNT() { return (reinterpret_cast<volatile EXCCNT_t*>(DWT_BASE + offsetof(DWT_t, EXCCNT))->bt.EXCCNT); }
		static inline void set_EXCCNT(std::uint32_t value) { reinterpret_cast<volatile EXCCNT_t*>(DWT_BASE + offsetof(DWT_t, EXCCNT))->bt.EXCCNT = value & static_cast<std::uint32_t>(EFields::EXCCNT_FIELD); }
	};
	/*Sleep Count Register*/
	class SLEEPCNT
	{
	private:
		union SLEEPCNT_t
		{
			struct
			{
				std::uint32_t SLEEPCNT       :  8;	/* Sleep cycle counter */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		SLEEPCNT_t value;

		enum class EOffsets: std::uint32_t
		{
			SLEEPCNT_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			SLEEPCNT_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(SLEEPCNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->SLEEPCNT); }
		inline void read() { value.dw = get_ptr()->SLEEPCNT; }
		static inline void set(std::uint32_t set_value) { get_ptr()->SLEEPCNT = set_value; }
		inline void write() { get_ptr()->SLEEPCNT = value.dw; }
		static inline std::uint32_t get_SLEEPCNT() { return (reinterpret_cast<volatile SLEEPCNT_t*>(DWT_BASE + offsetof(DWT_t, SLEEPCNT))->bt.SLEEPCNT); }
		static inline void set_SLEEPCNT(std::uint32_t value) { reinterpret_cast<volatile SLEEPCNT_t*>(DWT_BASE + offsetof(DWT_t, SLEEPCNT))->bt.SLEEPCNT = value & static_cast<std::uint32_t>(EFields::SLEEPCNT_FIELD); }
	};
	/*LSU Count Register*/
	class LSUCNT
	{
	private:
		union LSUCNT_t
		{
			struct
			{
				std::uint32_t LSUCNT         :  8;	/* Load store counter */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		LSUCNT_t value;

		enum class EOffsets: std::uint32_t
		{
			LSUCNT_OFFSET          = 0,
		};
		enum class EFields: std::uint32_t
		{
			LSUCNT_FIELD           = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(LSUCNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->LSUCNT); }
		inline void read() { value.dw = get_ptr()->LSUCNT; }
		static inline void set(std::uint32_t set_value) { get_ptr()->LSUCNT = set_value; }
		inline void write() { get_ptr()->LSUCNT = value.dw; }
		static inline std::uint32_t get_LSUCNT() { return (reinterpret_cast<volatile LSUCNT_t*>(DWT_BASE + offsetof(DWT_t, LSUCNT))->bt.LSUCNT); }
		static inline void set_LSUCNT(std::uint32_t value) { reinterpret_cast<volatile LSUCNT_t*>(DWT_BASE + offsetof(DWT_t, LSUCNT))->bt.LSUCNT = value & static_cast<std::uint32_t>(EFields::LSUCNT_FIELD); }
	};
	/*Folded-instruction Count Register*/
	class FOLDCNT
	{
	private:
		union FOLDCNT_t
		{
			struct
			{
				std::uint32_t FOLDCNT        :  8;	/* Folded instruction counter */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		FOLDCNT_t value;

		enum class EOffsets: std::uint32_t
		{
			FOLDCNT_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FOLDCNT_FIELD          = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FOLDCNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->FOLDCNT); }
		inline void read() { value.dw = get_ptr()->FOLDCNT; }
		static inline void set(std::uint32_t set_value) { get_ptr()->FOLDCNT = set_value; }
		inline void write() { get_ptr()->FOLDCNT = value.dw; }
		static inline std::uint32_t get_FOLDCNT() { return (reinterpret_cast<volatile FOLDCNT_t*>(DWT_BASE + offsetof(DWT_t, FOLDCNT))->bt.FOLDCNT); }
		static inline void set_FOLDCNT(std::uint32_t value) { reinterpret_cast<volatile FOLDCNT_t*>(DWT_BASE + offsetof(DWT_t, FOLDCNT))->bt.FOLDCNT = value & static_cast<std::uint32_t>(EFields::FOLDCNT_FIELD); }
	};
	/*Program Counter Sample Register*/
	class PCSR
	{
	private:
		union PCSR_t
		{
			struct
			{
				std::uint32_t EIASAMPLE      : 32;	/* Executed instruction address sample value */
			} bt;
			uint32_t dw;
		};
	public:
		PCSR_t value;

		enum class EOffsets: std::uint32_t
		{
			EIASAMPLE_OFFSET       = 0,
		};
		enum class EFields: std::uint32_t
		{
			EIASAMPLE_FIELD        = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(EIASAMPLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PCSR); }
		inline void read() { value.dw = get_ptr()->PCSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PCSR = set_value; }
		inline void write() { get_ptr()->PCSR = value.dw; }
		static inline std::uint32_t get_EIASAMPLE() { return (reinterpret_cast<volatile PCSR_t*>(DWT_BASE + offsetof(DWT_t, PCSR))->bt.EIASAMPLE); }
		static inline void set_EIASAMPLE(std::uint32_t value) { reinterpret_cast<volatile PCSR_t*>(DWT_BASE + offsetof(DWT_t, PCSR))->bt.EIASAMPLE = value & static_cast<std::uint32_t>(EFields::EIASAMPLE_FIELD); }
	};
	/*Comparator Register 0*/
	class COMP0
	{
	private:
		union COMP0_t
		{
			struct
			{
				std::uint32_t COMP           : 32;	/* Reference value for comparison */
			} bt;
			uint32_t dw;
		};
	public:
		COMP0_t value;

		enum class EOffsets: std::uint32_t
		{
			COMP_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			COMP_FIELD             = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(COMP),
		};
		static inline std::uint32_t get() { return (get_ptr()->COMP0); }
		inline void read() { value.dw = get_ptr()->COMP0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->COMP0 = set_value; }
		inline void write() { get_ptr()->COMP0 = value.dw; }
		static inline std::uint32_t get_COMP() { return (reinterpret_cast<volatile COMP0_t*>(DWT_BASE + offsetof(DWT_t, COMP0))->bt.COMP); }
		static inline void set_COMP(std::uint32_t value) { reinterpret_cast<volatile COMP0_t*>(DWT_BASE + offsetof(DWT_t, COMP0))->bt.COMP = value & static_cast<std::uint32_t>(EFields::COMP_FIELD); }
	};
	/*Mask Register 0*/
	class MASK0
	{
	private:
		union MASK0_t
		{
			struct
			{
				std::uint32_t MASK           :  5;	/* Comparator mask size */
				std::uint32_t                : 27;
			} bt;
			uint32_t dw;
		};
	public:
		MASK0_t value;

		enum class EOffsets: std::uint32_t
		{
			MASK_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			MASK_FIELD             = 0x0000001fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(MASK),
		};
		static inline std::uint32_t get() { return (get_ptr()->MASK0); }
		inline void read() { value.dw = get_ptr()->MASK0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->MASK0 = set_value; }
		inline void write() { get_ptr()->MASK0 = value.dw; }
		static inline std::uint32_t get_MASK() { return (reinterpret_cast<volatile MASK0_t*>(DWT_BASE + offsetof(DWT_t, MASK0))->bt.MASK); }
		static inline void set_MASK(std::uint32_t value) { reinterpret_cast<volatile MASK0_t*>(DWT_BASE + offsetof(DWT_t, MASK0))->bt.MASK = value & static_cast<std::uint32_t>(EFields::MASK_FIELD); }
	};
	/*Function Register 0*/
	class FUNCTION0
	{
	private:
		union FUNCTION0_t
		{
			struct
			{
				std::uint32_t FUNCTION       :  4;	/* Action on comparator match */
				std::uint32_t EMITRANGE      :  1;	/* Data trace address offset packet enable */
				std::uint32_t                :  2;
				std::uint32_t CYCMATCH       :  1;	/* Cycle count comparison enable on comparator */
				std::uint32_t DATAVMATCH     :  1;	/* Cycle comparison enabl */
				std::uint32_t LNK1ENA        :  1;	/* Support of a second linked comparator (read-only) */
				std::uint32_t DATAVSIZE      :  2;	/* Size of required data comparison */
				std::uint32_t DATAVADDR0     :  4;	/* Comparator number of a comparator */
				std::uint32_t DATAVADDR1     :  4;	/* Comparator number of a second comparator */
				std::uint32_t                :  4;
				std::uint32_t MATCHED        :  1;	/* Comparator match (read-only) */
				std::uint32_t                :  7;
			} bt;
			uint32_t dw;
		};
	public:
		FUNCTION0_t value;

		enum class EOffsets: std::uint32_t
		{
			FUNCTION_OFFSET        = 0,
			EMITRANGE_OFFSET       = 4,
			CYCMATCH_OFFSET        = 7,
			DATAVMATCH_OFFSET      = 8,
			LNK1ENA_OFFSET         = 9,
			DATAVSIZE_OFFSET       = 10,
			DATAVADDR0_OFFSET      = 12,
			DATAVADDR1_OFFSET      = 16,
			MATCHED_OFFSET         = 24,
		};
		enum class EFields: std::uint32_t
		{
			FUNCTION_FIELD         = 0x0000000fU,
			EMITRANGE_FIELD        = 0x00000001U,
			CYCMATCH_FIELD         = 0x00000001U,
			DATAVMATCH_FIELD       = 0x00000001U,
			LNK1ENA_FIELD          = 0x00000001U,
			DATAVSIZE_FIELD        = 0x00000003U,
			DATAVADDR0_FIELD       = 0x0000000fU,
			DATAVADDR1_FIELD       = 0x0000000fU,
			MATCHED_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FUNCTION),
			FIELD_MSK(EMITRANGE),
			FIELD_MSK(CYCMATCH),
			FIELD_MSK(DATAVMATCH),
			FIELD_MSK(LNK1ENA),
			FIELD_MSK(DATAVSIZE),
			FIELD_MSK(DATAVADDR0),
			FIELD_MSK(DATAVADDR1),
			FIELD_MSK(MATCHED),
		};
		static inline std::uint32_t get() { return (get_ptr()->FUNCTION0); }
		inline void read() { value.dw = get_ptr()->FUNCTION0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->FUNCTION0 = set_value; }
		inline void write() { get_ptr()->FUNCTION0 = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->FUNCTION0 |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->FUNCTION0 &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->FUNCTION0 & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_FUNCTION() { return (reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.FUNCTION); }
		static inline void set_FUNCTION(std::uint32_t value) { reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.FUNCTION = value & static_cast<std::uint32_t>(EFields::FUNCTION_FIELD); }
		static inline std::uint32_t get_DATAVSIZE() { return (reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.DATAVSIZE); }
		static inline void set_DATAVSIZE(std::uint32_t value) { reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.DATAVSIZE = value & static_cast<std::uint32_t>(EFields::DATAVSIZE_FIELD); }
		static inline std::uint32_t get_DATAVADDR0() { return (reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.DATAVADDR0); }
		static inline void set_DATAVADDR0(std::uint32_t value) { reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.DATAVADDR0 = value & static_cast<std::uint32_t>(EFields::DATAVADDR0_FIELD); }
		static inline std::uint32_t get_DATAVADDR1() { return (reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.DATAVADDR1); }
		static inline void set_DATAVADDR1(std::uint32_t value) { reinterpret_cast<volatile FUNCTION0_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION0))->bt.DATAVADDR1 = value & static_cast<std::uint32_t>(EFields::DATAVADDR1_FIELD); }
	};
	/*Comparator Register 1*/
	class COMP1
	{
	private:
		union COMP1_t
		{
			struct
			{
				std::uint32_t COMP           : 32;	/* Reference value for comparison */
			} bt;
			uint32_t dw;
		};
	public:
		COMP1_t value;

		enum class EOffsets: std::uint32_t
		{
			COMP_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			COMP_FIELD             = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(COMP),
		};
		static inline std::uint32_t get() { return (get_ptr()->COMP1); }
		inline void read() { value.dw = get_ptr()->COMP1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->COMP1 = set_value; }
		inline void write() { get_ptr()->COMP1 = value.dw; }
		static inline std::uint32_t get_COMP() { return (reinterpret_cast<volatile COMP1_t*>(DWT_BASE + offsetof(DWT_t, COMP1))->bt.COMP); }
		static inline void set_COMP(std::uint32_t value) { reinterpret_cast<volatile COMP1_t*>(DWT_BASE + offsetof(DWT_t, COMP1))->bt.COMP = value & static_cast<std::uint32_t>(EFields::COMP_FIELD); }
	};
	/*Mask Register 1*/
	class MASK1
	{
	private:
		union MASK1_t
		{
			struct
			{
				std::uint32_t MASK           :  5;	/* Comparator mask size */
				std::uint32_t                : 27;
			} bt;
			uint32_t dw;
		};
	public:
		MASK1_t value;

		enum class EOffsets: std::uint32_t
		{
			MASK_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			MASK_FIELD             = 0x0000001fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(MASK),
		};
		static inline std::uint32_t get() { return (get_ptr()->MASK1); }
		inline void read() { value.dw = get_ptr()->MASK1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->MASK1 = set_value; }
		inline void write() { get_ptr()->MASK1 = value.dw; }
		static inline std::uint32_t get_MASK() { return (reinterpret_cast<volatile MASK1_t*>(DWT_BASE + offsetof(DWT_t, MASK1))->bt.MASK); }
		static inline void set_MASK(std::uint32_t value) { reinterpret_cast<volatile MASK1_t*>(DWT_BASE + offsetof(DWT_t, MASK1))->bt.MASK = value & static_cast<std::uint32_t>(EFields::MASK_FIELD); }
	};
	/*Function Register 1*/
	class FUNCTION1
	{
	private:
		union FUNCTION1_t
		{
			struct
			{
				std::uint32_t FUNCTION       :  4;	/* Action on comparator match */
				std::uint32_t EMITRANGE      :  1;	/* Data trace address offset packet enable */
				std::uint32_t                :  2;
				std::uint32_t CYCMATCH       :  1;	/* Cycle count comparison enable on comparator */
				std::uint32_t DATAVMATCH     :  1;	/* Cycle comparison enabl */
				std::uint32_t LNK1ENA        :  1;	/* Support of a second linked comparator (read-only) */
				std::uint32_t DATAVSIZE      :  2;	/* Size of required data comparison */
				std::uint32_t DATAVADDR0     :  4;	/* Comparator number of a comparator */
				std::uint32_t DATAVADDR1     :  4;	/* Comparator number of a second comparator */
				std::uint32_t                :  4;
				std::uint32_t MATCHED        :  1;	/* Comparator match (read-only) */
				std::uint32_t                :  7;
			} bt;
			uint32_t dw;
		};
	public:
		FUNCTION1_t value;

		enum class EOffsets: std::uint32_t
		{
			FUNCTION_OFFSET        = 0,
			EMITRANGE_OFFSET       = 4,
			CYCMATCH_OFFSET        = 7,
			DATAVMATCH_OFFSET      = 8,
			LNK1ENA_OFFSET         = 9,
			DATAVSIZE_OFFSET       = 10,
			DATAVADDR0_OFFSET      = 12,
			DATAVADDR1_OFFSET      = 16,
			MATCHED_OFFSET         = 24,
		};
		enum class EFields: std::uint32_t
		{
			FUNCTION_FIELD         = 0x0000000fU,
			EMITRANGE_FIELD        = 0x00000001U,
			CYCMATCH_FIELD         = 0x00000001U,
			DATAVMATCH_FIELD       = 0x00000001U,
			LNK1ENA_FIELD          = 0x00000001U,
			DATAVSIZE_FIELD        = 0x00000003U,
			DATAVADDR0_FIELD       = 0x0000000fU,
			DATAVADDR1_FIELD       = 0x0000000fU,
			MATCHED_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FUNCTION),
			FIELD_MSK(EMITRANGE),
			FIELD_MSK(CYCMATCH),
			FIELD_MSK(DATAVMATCH),
			FIELD_MSK(LNK1ENA),
			FIELD_MSK(DATAVSIZE),
			FIELD_MSK(DATAVADDR0),
			FIELD_MSK(DATAVADDR1),
			FIELD_MSK(MATCHED),
		};
		static inline std::uint32_t get() { return (get_ptr()->FUNCTION1); }
		inline void read() { value.dw = get_ptr()->FUNCTION1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->FUNCTION1 = set_value; }
		inline void write() { get_ptr()->FUNCTION1 = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->FUNCTION1 |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->FUNCTION1 &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->FUNCTION1 & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_FUNCTION() { return (reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.FUNCTION); }
		static inline void set_FUNCTION(std::uint32_t value) { reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.FUNCTION = value & static_cast<std::uint32_t>(EFields::FUNCTION_FIELD); }
		static inline std::uint32_t get_DATAVSIZE() { return (reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.DATAVSIZE); }
		static inline void set_DATAVSIZE(std::uint32_t value) { reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.DATAVSIZE = value & static_cast<std::uint32_t>(EFields::DATAVSIZE_FIELD); }
		static inline std::uint32_t get_DATAVADDR0() { return (reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.DATAVADDR0); }
		static inline void set_DATAVADDR0(std::uint32_t value) { reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.DATAVADDR0 = value & static_cast<std::uint32_t>(EFields::DATAVADDR0_FIELD); }
		static inline std::uint32_t get_DATAVADDR1() { return (reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.DATAVADDR1); }
		static inline void set_DATAVADDR1(std::uint32_t value) { reinterpret_cast<volatile FUNCTION1_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION1))->bt.DATAVADDR1 = value & static_cast<std::uint32_t>(EFields::DATAVADDR1_FIELD); }
	};
	/*Comparator Register 2*/
	class COMP2
	{
	private:
		union COMP2_t
		{
			struct
			{
				std::uint32_t COMP           : 32;	/* Reference value for comparison */
			} bt;
			uint32_t dw;
		};
	public:
		COMP2_t value;

		enum class EOffsets: std::uint32_t
		{
			COMP_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			COMP_FIELD             = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(COMP),
		};
		static inline std::uint32_t get() { return (get_ptr()->COMP2); }
		inline void read() { value.dw = get_ptr()->COMP2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->COMP2 = set_value; }
		inline void write() { get_ptr()->COMP2 = value.dw; }
		static inline std::uint32_t get_COMP() { return (reinterpret_cast<volatile COMP2_t*>(DWT_BASE + offsetof(DWT_t, COMP2))->bt.COMP); }
		static inline void set_COMP(std::uint32_t value) { reinterpret_cast<volatile COMP2_t*>(DWT_BASE + offsetof(DWT_t, COMP2))->bt.COMP = value & static_cast<std::uint32_t>(EFields::COMP_FIELD); }
	};
	/*Mask Register 2*/
	class MASK2
	{
	private:
		union MASK2_t
		{
			struct
			{
				std::uint32_t MASK           :  5;	/* Comparator mask size */
				std::uint32_t                : 27;
			} bt;
			uint32_t dw;
		};
	public:
		MASK2_t value;

		enum class EOffsets: std::uint32_t
		{
			MASK_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			MASK_FIELD             = 0x0000001fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(MASK),
		};
		static inline std::uint32_t get() { return (get_ptr()->MASK2); }
		inline void read() { value.dw = get_ptr()->MASK2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->MASK2 = set_value; }
		inline void write() { get_ptr()->MASK2 = value.dw; }
		static inline std::uint32_t get_MASK() { return (reinterpret_cast<volatile MASK2_t*>(DWT_BASE + offsetof(DWT_t, MASK2))->bt.MASK); }
		static inline void set_MASK(std::uint32_t value) { reinterpret_cast<volatile MASK2_t*>(DWT_BASE + offsetof(DWT_t, MASK2))->bt.MASK = value & static_cast<std::uint32_t>(EFields::MASK_FIELD); }
	};
	/*Function Register 2*/
	class FUNCTION2
	{
	private:
		union FUNCTION2_t
		{
			struct
			{
				std::uint32_t FUNCTION       :  4;	/* Action on comparator match */
				std::uint32_t EMITRANGE      :  1;	/* Data trace address offset packet enable */
				std::uint32_t                :  2;
				std::uint32_t CYCMATCH       :  1;	/* Cycle count comparison enable on comparator */
				std::uint32_t DATAVMATCH     :  1;	/* Cycle comparison enabl */
				std::uint32_t LNK1ENA        :  1;	/* Support of a second linked comparator (read-only) */
				std::uint32_t DATAVSIZE      :  2;	/* Size of required data comparison */
				std::uint32_t DATAVADDR0     :  4;	/* Comparator number of a comparator */
				std::uint32_t DATAVADDR1     :  4;	/* Comparator number of a second comparator */
				std::uint32_t                :  4;
				std::uint32_t MATCHED        :  1;	/* Comparator match (read-only) */
				std::uint32_t                :  7;
			} bt;
			uint32_t dw;
		};
	public:
		FUNCTION2_t value;

		enum class EOffsets: std::uint32_t
		{
			FUNCTION_OFFSET        = 0,
			EMITRANGE_OFFSET       = 4,
			CYCMATCH_OFFSET        = 7,
			DATAVMATCH_OFFSET      = 8,
			LNK1ENA_OFFSET         = 9,
			DATAVSIZE_OFFSET       = 10,
			DATAVADDR0_OFFSET      = 12,
			DATAVADDR1_OFFSET      = 16,
			MATCHED_OFFSET         = 24,
		};
		enum class EFields: std::uint32_t
		{
			FUNCTION_FIELD         = 0x0000000fU,
			EMITRANGE_FIELD        = 0x00000001U,
			CYCMATCH_FIELD         = 0x00000001U,
			DATAVMATCH_FIELD       = 0x00000001U,
			LNK1ENA_FIELD          = 0x00000001U,
			DATAVSIZE_FIELD        = 0x00000003U,
			DATAVADDR0_FIELD       = 0x0000000fU,
			DATAVADDR1_FIELD       = 0x0000000fU,
			MATCHED_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FUNCTION),
			FIELD_MSK(EMITRANGE),
			FIELD_MSK(CYCMATCH),
			FIELD_MSK(DATAVMATCH),
			FIELD_MSK(LNK1ENA),
			FIELD_MSK(DATAVSIZE),
			FIELD_MSK(DATAVADDR0),
			FIELD_MSK(DATAVADDR1),
			FIELD_MSK(MATCHED),
		};
		static inline std::uint32_t get() { return (get_ptr()->FUNCTION2); }
		inline void read() { value.dw = get_ptr()->FUNCTION2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->FUNCTION2 = set_value; }
		inline void write() { get_ptr()->FUNCTION2 = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->FUNCTION2 |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->FUNCTION2 &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->FUNCTION2 & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_FUNCTION() { return (reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.FUNCTION); }
		static inline void set_FUNCTION(std::uint32_t value) { reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.FUNCTION = value & static_cast<std::uint32_t>(EFields::FUNCTION_FIELD); }
		static inline std::uint32_t get_DATAVSIZE() { return (reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.DATAVSIZE); }
		static inline void set_DATAVSIZE(std::uint32_t value) { reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.DATAVSIZE = value & static_cast<std::uint32_t>(EFields::DATAVSIZE_FIELD); }
		static inline std::uint32_t get_DATAVADDR0() { return (reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.DATAVADDR0); }
		static inline void set_DATAVADDR0(std::uint32_t value) { reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.DATAVADDR0 = value & static_cast<std::uint32_t>(EFields::DATAVADDR0_FIELD); }
		static inline std::uint32_t get_DATAVADDR1() { return (reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.DATAVADDR1); }
		static inline void set_DATAVADDR1(std::uint32_t value) { reinterpret_cast<volatile FUNCTION2_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION2))->bt.DATAVADDR1 = value & static_cast<std::uint32_t>(EFields::DATAVADDR1_FIELD); }
	};
	/*Comparator Register 3*/
	class COMP3
	{
	private:
		union COMP3_t
		{
			struct
			{
				std::uint32_t COMP           : 32;	/* Reference value for comparison */
			} bt;
			uint32_t dw;
		};
	public:
		COMP3_t value;

		enum class EOffsets: std::uint32_t
		{
			COMP_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			COMP_FIELD             = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(COMP),
		};
		static inline std::uint32_t get() { return (get_ptr()->COMP3); }
		inline void read() { value.dw = get_ptr()->COMP3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->COMP3 = set_value; }
		inline void write() { get_ptr()->COMP3 = value.dw; }
		static inline std::uint32_t get_COMP() { return (reinterpret_cast<volatile COMP3_t*>(DWT_BASE + offsetof(DWT_t, COMP3))->bt.COMP); }
		static inline void set_COMP(std::uint32_t value) { reinterpret_cast<volatile COMP3_t*>(DWT_BASE + offsetof(DWT_t, COMP3))->bt.COMP = value & static_cast<std::uint32_t>(EFields::COMP_FIELD); }
	};
	/*Mask Register 3*/
	class MASK3
	{
	private:
		union MASK3_t
		{
			struct
			{
				std::uint32_t MASK           :  5;	/* Comparator mask size */
				std::uint32_t                : 27;
			} bt;
			uint32_t dw;
		};
	public:
		MASK3_t value;

		enum class EOffsets: std::uint32_t
		{
			MASK_OFFSET            = 0,
		};
		enum class EFields: std::uint32_t
		{
			MASK_FIELD             = 0x0000001fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(MASK),
		};
		static inline std::uint32_t get() { return (get_ptr()->MASK3); }
		inline void read() { value.dw = get_ptr()->MASK3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->MASK3 = set_value; }
		inline void write() { get_ptr()->MASK3 = value.dw; }
		static inline std::uint32_t get_MASK() { return (reinterpret_cast<volatile MASK3_t*>(DWT_BASE + offsetof(DWT_t, MASK3))->bt.MASK); }
		static inline void set_MASK(std::uint32_t value) { reinterpret_cast<volatile MASK3_t*>(DWT_BASE + offsetof(DWT_t, MASK3))->bt.MASK = value & static_cast<std::uint32_t>(EFields::MASK_FIELD); }
	};
	/*Function Register 3*/
	class FUNCTION3
	{
	private:
		union FUNCTION3_t
		{
			struct
			{
				std::uint32_t FUNCTION       :  4;	/* Action on comparator match */
				std::uint32_t EMITRANGE      :  1;	/* Data trace address offset packet enable */
				std::uint32_t                :  2;
				std::uint32_t CYCMATCH       :  1;	/* Cycle count comparison enable on comparator */
				std::uint32_t DATAVMATCH     :  1;	/* Cycle comparison enabl */
				std::uint32_t LNK1ENA        :  1;	/* Support of a second linked comparator (read-only) */
				std::uint32_t DATAVSIZE      :  2;	/* Size of required data comparison */
				std::uint32_t DATAVADDR0     :  4;	/* Comparator number of a comparator */
				std::uint32_t DATAVADDR1     :  4;	/* Comparator number of a second comparator */
				std::uint32_t                :  4;
				std::uint32_t MATCHED        :  1;	/* Comparator match (read-only) */
				std::uint32_t                :  7;
			} bt;
			uint32_t dw;
		};
	public:
		FUNCTION3_t value;

		enum class EOffsets: std::uint32_t
		{
			FUNCTION_OFFSET        = 0,
			EMITRANGE_OFFSET       = 4,
			CYCMATCH_OFFSET        = 7,
			DATAVMATCH_OFFSET      = 8,
			LNK1ENA_OFFSET         = 9,
			DATAVSIZE_OFFSET       = 10,
			DATAVADDR0_OFFSET      = 12,
			DATAVADDR1_OFFSET      = 16,
			MATCHED_OFFSET         = 24,
		};
		enum class EFields: std::uint32_t
		{
			FUNCTION_FIELD         = 0x0000000fU,
			EMITRANGE_FIELD        = 0x00000001U,
			CYCMATCH_FIELD         = 0x00000001U,
			DATAVMATCH_FIELD       = 0x00000001U,
			LNK1ENA_FIELD          = 0x00000001U,
			DATAVSIZE_FIELD        = 0x00000003U,
			DATAVADDR0_FIELD       = 0x0000000fU,
			DATAVADDR1_FIELD       = 0x0000000fU,
			MATCHED_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FUNCTION),
			FIELD_MSK(EMITRANGE),
			FIELD_MSK(CYCMATCH),
			FIELD_MSK(DATAVMATCH),
			FIELD_MSK(LNK1ENA),
			FIELD_MSK(DATAVSIZE),
			FIELD_MSK(DATAVADDR0),
			FIELD_MSK(DATAVADDR1),
			FIELD_MSK(MATCHED),
		};
		static inline std::uint32_t get() { return (get_ptr()->FUNCTION3); }
		inline void read() { value.dw = get_ptr()->FUNCTION3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->FUNCTION3 = set_value; }
		inline void write() { get_ptr()->FUNCTION3 = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->FUNCTION3 |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->FUNCTION3 &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->FUNCTION3 & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_FUNCTION() { return (reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.FUNCTION); }
		static inline void set_FUNCTION(std::uint32_t value) { reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.FUNCTION = value & static_cast<std::uint32_t>(EFields::FUNCTION_FIELD); }
		static inline std::uint32_t get_DATAVSIZE() { return (reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.DATAVSIZE); }
		static inline void set_DATAVSIZE(std::uint32_t value) { reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.DATAVSIZE = value & static_cast<std::uint32_t>(EFields::DATAVSIZE_FIELD); }
		static inline std::uint32_t get_DATAVADDR0() { return (reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.DATAVADDR0); }
		static inline void set_DATAVADDR0(std::uint32_t value) { reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.DATAVADDR0 = value & static_cast<std::uint32_t>(EFields::DATAVADDR0_FIELD); }
		static inline std::uint32_t get_DATAVADDR1() { return (reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.DATAVADDR1); }
		static inline void set_DATAVADDR1(std::uint32_t value) { reinterpret_cast<volatile FUNCTION3_t*>(DWT_BASE + offsetof(DWT_t, FUNCTION3))->bt.DATAVADDR1 = value & static_cast<std::uint32_t>(EFields::DATAVADDR1_FIELD); }
	};
	/*Lock Access Register*/
	class LAR
	{
	private:
		union LAR_t
		{
			struct
			{
				std::uint32_t Present        :  1;	/* - */
				std::uint32_t Access         :  1;	/* - */
				std::uint32_t ByteAcc        :  1;	/* - */
				std::uint32_t                : 29;
			} bt;
			uint32_t dw;
		};
	public:
		LAR_t value;

		enum class EOffsets: std::uint32_t
		{
			Present_OFFSET         = 0,
			Access_OFFSET          = 1,
			ByteAcc_OFFSET         = 2,
		};
		enum class EFields: std::uint32_t
		{
			Present_FIELD          = 0x00000001U,
			Access_FIELD           = 0x00000001U,
			ByteAcc_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(Present),
			FIELD_MSK(Access),
			FIELD_MSK(ByteAcc),
		};
		static inline std::uint32_t get() { return (get_ptr()->LAR); }
		inline void read() { value.dw = get_ptr()->LAR; }
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->LAR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*Lock Status Register*/
	class LSR
	{
	private:
		union LSR_t
		{
			struct
			{
				std::uint32_t Present        :  1;	/* - */
				std::uint32_t Access         :  1;	/* - */
				std::uint32_t ByteAcc        :  1;	/* - */
				std::uint32_t                : 29;
			} bt;
			uint32_t dw;
		};
	public:
		LSR_t value;

		enum class EOffsets: std::uint32_t
		{
			Present_OFFSET         = 0,
			Access_OFFSET          = 1,
			ByteAcc_OFFSET         = 2,
		};
		enum class EFields: std::uint32_t
		{
			Present_FIELD          = 0x00000001U,
			Access_FIELD           = 0x00000001U,
			ByteAcc_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(Present),
			FIELD_MSK(Access),
			FIELD_MSK(ByteAcc),
		};
		static inline std::uint32_t get() { return (get_ptr()->LSR); }
		inline void read() { value.dw = get_ptr()->LSR; }
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->LSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*CoreSight peripheral identity register 4*/
	class PIDR4
	{
	private:
		union PIDR4_t
		{
			struct
			{
				std::uint32_t JEP106CON      :  4;	/* JEP106 continuation code */
				std::uint32_t _4KCOUNT       :  4;	/* Register file size */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR4_t value;

		enum class EOffsets: std::uint32_t
		{
			JEP106CON_OFFSET       = 0,
			_4KCOUNT_OFFSET        = 4,
		};
		enum class EFields: std::uint32_t
		{
			JEP106CON_FIELD        = 0x0000000fU,
			_4KCOUNT_FIELD         = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(JEP106CON),
			FIELD_MSK(_4KCOUNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR4); }
		inline void read() { value.dw = get_ptr()->PIDR4; }
	};
	/*CoreSight peripheral identity register 5*/
	class PIDR5
	{
	private:
		union PIDR5_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR5_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR5); }
		inline void read() { value.dw = get_ptr()->PIDR5; }
	};
	/*CoreSight peripheral identity register 6*/
	class PIDR6
	{
	private:
		union PIDR6_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR6_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR6); }
		inline void read() { value.dw = get_ptr()->PIDR6; }
	};
	/*CoreSight peripheral identity register 7*/
	class PIDR7
	{
	private:
		union PIDR7_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR7_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR7); }
		inline void read() { value.dw = get_ptr()->PIDR7; }
	};
	/*CoreSight peripheral identity register 0*/
	class PIDR0
	{
	private:
		union PIDR0_t
		{
			struct
			{
				std::uint32_t PARTNUM        :  8;	/* Part number field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR0_t value;

		enum class EOffsets: std::uint32_t
		{
			PARTNUM_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			PARTNUM_FIELD          = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PARTNUM),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR0); }
		inline void read() { value.dw = get_ptr()->PIDR0; }
		static inline std::uint32_t get_PARTNUM() { return (reinterpret_cast<volatile PIDR0_t*>(DWT_BASE + offsetof(DWT_t, PIDR0))->bt.PARTNUM); }
	};
	/*CoreSight peripheral identity register 1*/
	class PIDR1
	{
	private:
		union PIDR1_t
		{
			struct
			{
				std::uint32_t JEP106ID       :  4;	/* JEP106 identity code */
				std::uint32_t PARTNUM        :  4;	/* Part number field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR1_t value;

		enum class EOffsets: std::uint32_t
		{
			JEP106ID_OFFSET        = 0,
			PARTNUM_OFFSET         = 4,
		};
		enum class EFields: std::uint32_t
		{
			JEP106ID_FIELD         = 0x0000000fU,
			PARTNUM_FIELD          = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(JEP106ID),
			FIELD_MSK(PARTNUM),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR1); }
		inline void read() { value.dw = get_ptr()->PIDR1; }
		static inline std::uint32_t get_JEP106ID() { return (reinterpret_cast<volatile PIDR1_t*>(DWT_BASE + offsetof(DWT_t, PIDR1))->bt.JEP106ID); }
		static inline std::uint32_t get_PARTNUM() { return (reinterpret_cast<volatile PIDR1_t*>(DWT_BASE + offsetof(DWT_t, PIDR1))->bt.PARTNUM); }
	};
	/*CoreSight peripheral identity register 2*/
	class PIDR2
	{
	private:
		union PIDR2_t
		{
			struct
			{
				std::uint32_t JEP106ID       :  3;	/* JEP106 identity code */
				std::uint32_t                :  1;
				std::uint32_t JEDEC          :  1;	/* JEDEC assigned value */
				std::uint32_t REVISION       :  4;	/* Component revision number */
				std::uint32_t                : 23;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR2_t value;

		enum class EOffsets: std::uint32_t
		{
			JEP106ID_OFFSET        = 0,
			JEDEC_OFFSET           = 4,
			REVISION_OFFSET        = 5,
		};
		enum class EFields: std::uint32_t
		{
			JEP106ID_FIELD         = 0x00000007U,
			JEDEC_FIELD            = 0x00000001U,
			REVISION_FIELD         = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(JEP106ID),
			FIELD_MSK(JEDEC),
			FIELD_MSK(REVISION),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR2); }
		inline void read() { value.dw = get_ptr()->PIDR2; }
		static inline std::uint32_t get_JEP106ID() { return (reinterpret_cast<volatile PIDR2_t*>(DWT_BASE + offsetof(DWT_t, PIDR2))->bt.JEP106ID); }
		static inline std::uint32_t get_REVISION() { return (reinterpret_cast<volatile PIDR2_t*>(DWT_BASE + offsetof(DWT_t, PIDR2))->bt.REVISION); }
	};
	/*CoreSight peripheral identity register 3*/
	class PIDR3
	{
	private:
		union PIDR3_t
		{
			struct
			{
				std::uint32_t CMOD           :  4;	/* Customer modified */
				std::uint32_t REVAND         :  4;	/* Metal fix version */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR3_t value;

		enum class EOffsets: std::uint32_t
		{
			CMOD_OFFSET            = 0,
			REVAND_OFFSET          = 4,
		};
		enum class EFields: std::uint32_t
		{
			CMOD_FIELD             = 0x0000000fU,
			REVAND_FIELD           = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CMOD),
			FIELD_MSK(REVAND),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR3); }
		inline void read() { value.dw = get_ptr()->PIDR3; }
		static inline std::uint32_t get_CMOD() { return (reinterpret_cast<volatile PIDR3_t*>(DWT_BASE + offsetof(DWT_t, PIDR3))->bt.CMOD); }
		static inline std::uint32_t get_REVAND() { return (reinterpret_cast<volatile PIDR3_t*>(DWT_BASE + offsetof(DWT_t, PIDR3))->bt.REVAND); }
	};
	/*CoreSight component identity register 0*/
	class CIDR0
	{
	private:
		union CIDR0_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  8;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR0_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR0); }
		inline void read() { value.dw = get_ptr()->CIDR0; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR0_t*>(DWT_BASE + offsetof(DWT_t, CIDR0))->bt.PREAMBLE); }
	};
	/*CoreSight component identity register 1*/
	class CIDR1
	{
	private:
		union CIDR1_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  4;	/* Component ID field - component class */
				std::uint32_t CLASS          :  4;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR1_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
			CLASS_OFFSET           = 4,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x0000000fU,
			CLASS_FIELD            = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
			FIELD_MSK(CLASS),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR1); }
		inline void read() { value.dw = get_ptr()->CIDR1; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR1_t*>(DWT_BASE + offsetof(DWT_t, CIDR1))->bt.PREAMBLE); }
		static inline std::uint32_t get_CLASS() { return (reinterpret_cast<volatile CIDR1_t*>(DWT_BASE + offsetof(DWT_t, CIDR1))->bt.CLASS); }
	};
	/*CoreSight component identity register 2*/
	class CIDR2
	{
	private:
		union CIDR2_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  8;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR2_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR2); }
		inline void read() { value.dw = get_ptr()->CIDR2; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR2_t*>(DWT_BASE + offsetof(DWT_t, CIDR2))->bt.PREAMBLE); }
	};
	/*CoreSight component identity register 3*/
	class CIDR3
	{
	private:
		union CIDR3_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  8;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR3_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR3); }
		inline void read() { value.dw = get_ptr()->CIDR3; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR3_t*>(DWT_BASE + offsetof(DWT_t, CIDR3))->bt.PREAMBLE); }
	};
};

#define DWT_CTRL_CYCCNTENA
#define DWT_CTRL_POSTPRESET
#define DWT_CTRL_POSTINIT
#define DWT_CTRL_CYCTAP
#define DWT_CTRL_SYNCTAP
#define DWT_CTRL_PCSAMPLENA
#define DWT_CTRL_EXCTRCENA
#define DWT_CTRL_CPIEVTENA
#define DWT_CTRL_EXCEVTENA
#define DWT_CTRL_SLEEPEVTENA
#define DWT_CTRL_LSUEVTENA
#define DWT_CTRL_FOLDEVTENA
#define DWT_CTRL_CYCEVTENA
#define DWT_CTRL_NOPRFCNT
#define DWT_CTRL_NOCYCCNT
#define DWT_CTRL_NOEXTTRIG
#define DWT_CTRL_NOTRCPKT
#define DWT_CTRL_NUMCOMP
#define DWT_CYCCNT_CYCCNT
#define DWT_CPICNT_CPICNT
#define DWT_EXCCNT_EXCCNT
#define DWT_SLEEPCNT_SLEEPCNT
#define DWT_LSUCNT_LSUCNT
#define DWT_FOLDCNT_FOLDCNT
#define DWT_PCSR_EIASAMPLE
#define DWT_COMP0_COMP
#define DWT_MASK0_MASK
#define DWT_FUNCTION0_FUNCTION
#define DWT_FUNCTION0_EMITRANGE
#define DWT_FUNCTION0_CYCMATCH
#define DWT_FUNCTION0_DATAVMATCH
#define DWT_FUNCTION0_LNK1ENA
#define DWT_FUNCTION0_DATAVSIZE
#define DWT_FUNCTION0_DATAVADDR0
#define DWT_FUNCTION0_DATAVADDR1
#define DWT_FUNCTION0_MATCHED
#define DWT_COMP1_COMP
#define DWT_MASK1_MASK
#define DWT_FUNCTION1_FUNCTION
#define DWT_FUNCTION1_EMITRANGE
#define DWT_FUNCTION1_CYCMATCH
#define DWT_FUNCTION1_DATAVMATCH
#define DWT_FUNCTION1_LNK1ENA
#define DWT_FUNCTION1_DATAVSIZE
#define DWT_FUNCTION1_DATAVADDR0
#define DWT_FUNCTION1_DATAVADDR1
#define DWT_FUNCTION1_MATCHED
#define DWT_COMP2_COMP
#define DWT_MASK2_MASK
#define DWT_FUNCTION2_FUNCTION
#define DWT_FUNCTION2_EMITRANGE
#define DWT_FUNCTION2_CYCMATCH
#define DWT_FUNCTION2_DATAVMATCH
#define DWT_FUNCTION2_LNK1ENA
#define DWT_FUNCTION2_DATAVSIZE
#define DWT_FUNCTION2_DATAVADDR0
#define DWT_FUNCTION2_DATAVADDR1
#define DWT_FUNCTION2_MATCHED
#define DWT_COMP3_COMP
#define DWT_MASK3_MASK
#define DWT_FUNCTION3_FUNCTION
#define DWT_FUNCTION3_EMITRANGE
#define DWT_FUNCTION3_CYCMATCH
#define DWT_FUNCTION3_DATAVMATCH
#define DWT_FUNCTION3_LNK1ENA
#define DWT_FUNCTION3_DATAVSIZE
#define DWT_FUNCTION3_DATAVADDR0
#define DWT_FUNCTION3_DATAVADDR1
#define DWT_FUNCTION3_MATCHED
#define DWT_LAR_Present
#define DWT_LAR_Access
#define DWT_LAR_ByteAcc
#define DWT_LSR_Present
#define DWT_LSR_Access
#define DWT_LSR_ByteAcc
#define DWT_PIDR4_JEP106CON
#define DWT_PIDR4__4KCOUNT
#define DWT_PIDR0_PARTNUM
#define DWT_PIDR1_JEP106ID
#define DWT_PIDR1_PARTNUM
#define DWT_PIDR2_JEP106ID
#define DWT_PIDR2_JEDEC
#define DWT_PIDR2_REVISION
#define DWT_PIDR3_CMOD
#define DWT_PIDR3_REVAND
#define DWT_CIDR0_PREAMBLE
#define DWT_CIDR1_PREAMBLE
#define DWT_CIDR1_CLASS
#define DWT_CIDR2_PREAMBLE
#define DWT_CIDR3_PREAMBLE
#pragma endregion DWT

#pragma region ITM
/* Instrumentation trace macrocell */
class ITM
{
public:
	struct ITM_t
	{
		__IO std::uint32_t	PORT0;
		__IO std::uint32_t	PORT1;
		__IO std::uint32_t	PORT2;
		__IO std::uint32_t	PORT3;
		__IO std::uint32_t	PORT4;
		__IO std::uint32_t	PORT5;
		__IO std::uint32_t	PORT6;
		__IO std::uint32_t	PORT7;
			 std::uint32_t	dummy_32[888];
		__IO std::uint32_t	TER;
			 std::uint32_t	dummy_3588[15];
		__IO std::uint32_t	TPR;
			 std::uint32_t	dummy_3652[15];
		__IO std::uint32_t	TCR;
			 std::uint32_t	dummy_3716[29];
		__IO std::uint32_t	IWR;
		__IO std::uint32_t	IRR;
		__IO std::uint32_t	IMCR;
			 std::uint32_t	dummy_3844[43];
		__IO std::uint32_t	LAR;
		__IO std::uint32_t	LSR;
			 std::uint32_t	dummy_4024[6];
		__I  std::uint32_t	PIDR4;
		__I  std::uint32_t	PIDR5;
		__I  std::uint32_t	PIDR6;
		__I  std::uint32_t	PIDR7;
		__I  std::uint32_t	PIDR0;
		__I  std::uint32_t	PIDR1;
		__I  std::uint32_t	PIDR2;
		__I  std::uint32_t	PIDR3;
		__I  std::uint32_t	CIDR0;
		__I  std::uint32_t	CIDR1;
		__I  std::uint32_t	CIDR2;
		__I  std::uint32_t	CIDR3;
	};
private:
	static inline volatile ITM_t* get_ptr() { return (reinterpret_cast<ITM_t*>(ITM_BASE)); }
public:
	/*ITM stimulus register 0*/
	class PORT0
	{
	private:
		union PORT0_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT0_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT0); }
		inline void read() { value.dw = get_ptr()->PORT0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT0 = set_value; }
		inline void write() { get_ptr()->PORT0 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT0_t*>(ITM_BASE + offsetof(ITM_t, PORT0))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT0_t*>(ITM_BASE + offsetof(ITM_t, PORT0))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 1*/
	class PORT1
	{
	private:
		union PORT1_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT1_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT1); }
		inline void read() { value.dw = get_ptr()->PORT1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT1 = set_value; }
		inline void write() { get_ptr()->PORT1 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT1_t*>(ITM_BASE + offsetof(ITM_t, PORT1))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT1_t*>(ITM_BASE + offsetof(ITM_t, PORT1))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 2*/
	class PORT2
	{
	private:
		union PORT2_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT2_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT2); }
		inline void read() { value.dw = get_ptr()->PORT2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT2 = set_value; }
		inline void write() { get_ptr()->PORT2 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT2_t*>(ITM_BASE + offsetof(ITM_t, PORT2))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT2_t*>(ITM_BASE + offsetof(ITM_t, PORT2))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 3*/
	class PORT3
	{
	private:
		union PORT3_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT3_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT3); }
		inline void read() { value.dw = get_ptr()->PORT3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT3 = set_value; }
		inline void write() { get_ptr()->PORT3 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT3_t*>(ITM_BASE + offsetof(ITM_t, PORT3))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT3_t*>(ITM_BASE + offsetof(ITM_t, PORT3))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 4*/
	class PORT4
	{
	private:
		union PORT4_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT4_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT4); }
		inline void read() { value.dw = get_ptr()->PORT4; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT4 = set_value; }
		inline void write() { get_ptr()->PORT4 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT4_t*>(ITM_BASE + offsetof(ITM_t, PORT4))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT4_t*>(ITM_BASE + offsetof(ITM_t, PORT4))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 5*/
	class PORT5
	{
	private:
		union PORT5_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT5_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT5); }
		inline void read() { value.dw = get_ptr()->PORT5; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT5 = set_value; }
		inline void write() { get_ptr()->PORT5 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT5_t*>(ITM_BASE + offsetof(ITM_t, PORT5))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT5_t*>(ITM_BASE + offsetof(ITM_t, PORT5))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 6*/
	class PORT6
	{
	private:
		union PORT6_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT6_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT6); }
		inline void read() { value.dw = get_ptr()->PORT6; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT6 = set_value; }
		inline void write() { get_ptr()->PORT6 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT6_t*>(ITM_BASE + offsetof(ITM_t, PORT6))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT6_t*>(ITM_BASE + offsetof(ITM_t, PORT6))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM stimulus register 7*/
	class PORT7
	{
	private:
		union PORT7_t
		{
			struct
			{
				std::uint32_t VALUE          : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		PORT7_t value;

		enum class EOffsets: std::uint32_t
		{
			VALUE_OFFSET           = 0,
		};
		enum class EFields: std::uint32_t
		{
			VALUE_FIELD            = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VALUE),
		};
		static inline std::uint32_t get() { return (get_ptr()->PORT7); }
		inline void read() { value.dw = get_ptr()->PORT7; }
		static inline void set(std::uint32_t set_value) { get_ptr()->PORT7 = set_value; }
		inline void write() { get_ptr()->PORT7 = value.dw; }
		static inline std::uint32_t get_VALUE() { return (reinterpret_cast<volatile PORT7_t*>(ITM_BASE + offsetof(ITM_t, PORT7))->bt.VALUE); }
		static inline void set_VALUE(std::uint32_t value) { reinterpret_cast<volatile PORT7_t*>(ITM_BASE + offsetof(ITM_t, PORT7))->bt.VALUE = value & static_cast<std::uint32_t>(EFields::VALUE_FIELD); }
	};
	/*ITM trace enable register*/
	class TER
	{
	private:
		union TER_t
		{
			struct
			{
				std::uint32_t STIMENA0       :  1;	/* - */
				std::uint32_t STIMENA1       :  1;	/* - */
				std::uint32_t STIMENA2       :  1;	/* - */
				std::uint32_t STIMENA3       :  1;	/* - */
				std::uint32_t STIMENA4       :  1;	/* - */
				std::uint32_t STIMENA5       :  1;	/* - */
				std::uint32_t STIMENA6       :  1;	/* - */
				std::uint32_t STIMENA7       :  1;	/* - */
				std::uint32_t STIMENA8       :  1;	/* - */
				std::uint32_t STIMENA9       :  1;	/* - */
				std::uint32_t STIMENA10      :  1;	/* - */
				std::uint32_t STIMENA11      :  1;	/* - */
				std::uint32_t STIMENA12      :  1;	/* - */
				std::uint32_t STIMENA13      :  1;	/* - */
				std::uint32_t STIMENA14      :  1;	/* - */
				std::uint32_t STIMENA15      :  1;	/* - */
				std::uint32_t STIMENA16      :  1;	/* - */
				std::uint32_t STIMENA17      :  1;	/* - */
				std::uint32_t STIMENA18      :  1;	/* - */
				std::uint32_t STIMENA19      :  1;	/* - */
				std::uint32_t STIMENA20      :  1;	/* - */
				std::uint32_t STIMENA21      :  1;	/* - */
				std::uint32_t STIMENA22      :  1;	/* - */
				std::uint32_t STIMENA23      :  1;	/* - */
				std::uint32_t STIMENA24      :  1;	/* - */
				std::uint32_t STIMENA25      :  1;	/* - */
				std::uint32_t STIMENA26      :  1;	/* - */
				std::uint32_t STIMENA27      :  1;	/* - */
				std::uint32_t STIMENA28      :  1;	/* - */
				std::uint32_t STIMENA29      :  1;	/* - */
				std::uint32_t STIMENA30      :  1;	/* - */
				std::uint32_t STIMENA31      :  1;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		TER_t value;

		enum class EOffsets: std::uint32_t
		{
			STIMENA0_OFFSET        = 0,
			STIMENA1_OFFSET        = 1,
			STIMENA2_OFFSET        = 2,
			STIMENA3_OFFSET        = 3,
			STIMENA4_OFFSET        = 4,
			STIMENA5_OFFSET        = 5,
			STIMENA6_OFFSET        = 6,
			STIMENA7_OFFSET        = 7,
			STIMENA8_OFFSET        = 8,
			STIMENA9_OFFSET        = 9,
			STIMENA10_OFFSET       = 10,
			STIMENA11_OFFSET       = 11,
			STIMENA12_OFFSET       = 12,
			STIMENA13_OFFSET       = 13,
			STIMENA14_OFFSET       = 14,
			STIMENA15_OFFSET       = 15,
			STIMENA16_OFFSET       = 16,
			STIMENA17_OFFSET       = 17,
			STIMENA18_OFFSET       = 18,
			STIMENA19_OFFSET       = 19,
			STIMENA20_OFFSET       = 20,
			STIMENA21_OFFSET       = 21,
			STIMENA22_OFFSET       = 22,
			STIMENA23_OFFSET       = 23,
			STIMENA24_OFFSET       = 24,
			STIMENA25_OFFSET       = 25,
			STIMENA26_OFFSET       = 26,
			STIMENA27_OFFSET       = 27,
			STIMENA28_OFFSET       = 28,
			STIMENA29_OFFSET       = 29,
			STIMENA30_OFFSET       = 30,
			STIMENA31_OFFSET       = 31,
		};
		enum class EFields: std::uint32_t
		{
			STIMENA0_FIELD         = 0x00000001U,
			STIMENA1_FIELD         = 0x00000001U,
			STIMENA2_FIELD         = 0x00000001U,
			STIMENA3_FIELD         = 0x00000001U,
			STIMENA4_FIELD         = 0x00000001U,
			STIMENA5_FIELD         = 0x00000001U,
			STIMENA6_FIELD         = 0x00000001U,
			STIMENA7_FIELD         = 0x00000001U,
			STIMENA8_FIELD         = 0x00000001U,
			STIMENA9_FIELD         = 0x00000001U,
			STIMENA10_FIELD        = 0x00000001U,
			STIMENA11_FIELD        = 0x00000001U,
			STIMENA12_FIELD        = 0x00000001U,
			STIMENA13_FIELD        = 0x00000001U,
			STIMENA14_FIELD        = 0x00000001U,
			STIMENA15_FIELD        = 0x00000001U,
			STIMENA16_FIELD        = 0x00000001U,
			STIMENA17_FIELD        = 0x00000001U,
			STIMENA18_FIELD        = 0x00000001U,
			STIMENA19_FIELD        = 0x00000001U,
			STIMENA20_FIELD        = 0x00000001U,
			STIMENA21_FIELD        = 0x00000001U,
			STIMENA22_FIELD        = 0x00000001U,
			STIMENA23_FIELD        = 0x00000001U,
			STIMENA24_FIELD        = 0x00000001U,
			STIMENA25_FIELD        = 0x00000001U,
			STIMENA26_FIELD        = 0x00000001U,
			STIMENA27_FIELD        = 0x00000001U,
			STIMENA28_FIELD        = 0x00000001U,
			STIMENA29_FIELD        = 0x00000001U,
			STIMENA30_FIELD        = 0x00000001U,
			STIMENA31_FIELD        = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(STIMENA0),
			FIELD_MSK(STIMENA1),
			FIELD_MSK(STIMENA2),
			FIELD_MSK(STIMENA3),
			FIELD_MSK(STIMENA4),
			FIELD_MSK(STIMENA5),
			FIELD_MSK(STIMENA6),
			FIELD_MSK(STIMENA7),
			FIELD_MSK(STIMENA8),
			FIELD_MSK(STIMENA9),
			FIELD_MSK(STIMENA10),
			FIELD_MSK(STIMENA11),
			FIELD_MSK(STIMENA12),
			FIELD_MSK(STIMENA13),
			FIELD_MSK(STIMENA14),
			FIELD_MSK(STIMENA15),
			FIELD_MSK(STIMENA16),
			FIELD_MSK(STIMENA17),
			FIELD_MSK(STIMENA18),
			FIELD_MSK(STIMENA19),
			FIELD_MSK(STIMENA20),
			FIELD_MSK(STIMENA21),
			FIELD_MSK(STIMENA22),
			FIELD_MSK(STIMENA23),
			FIELD_MSK(STIMENA24),
			FIELD_MSK(STIMENA25),
			FIELD_MSK(STIMENA26),
			FIELD_MSK(STIMENA27),
			FIELD_MSK(STIMENA28),
			FIELD_MSK(STIMENA29),
			FIELD_MSK(STIMENA30),
			FIELD_MSK(STIMENA31),
		};
		static inline std::uint32_t get() { return (get_ptr()->TER); }
		inline void read() { value.dw = get_ptr()->TER; }
		static inline void set(std::uint32_t set_value) { get_ptr()->TER = set_value; }
		inline void write() { get_ptr()->TER = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->TER |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->TER &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->TER & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*ITM trace privilege registers*/
	class TPR
	{
	private:
		union TPR_t
		{
			struct
			{
				std::uint32_t PRIVMASK       :  4;	/* Enable unprivileged access to ITM stimulus ports */
				std::uint32_t                : 28;
			} bt;
			uint32_t dw;
		};
	public:
		TPR_t value;

		enum class EOffsets: std::uint32_t
		{
			PRIVMASK_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PRIVMASK_FIELD         = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PRIVMASK),
		};
		static inline std::uint32_t get() { return (get_ptr()->TPR); }
		inline void read() { value.dw = get_ptr()->TPR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->TPR = set_value; }
		inline void write() { get_ptr()->TPR = value.dw; }
		static inline std::uint32_t get_PRIVMASK() { return (reinterpret_cast<volatile TPR_t*>(ITM_BASE + offsetof(ITM_t, TPR))->bt.PRIVMASK); }
		static inline void set_PRIVMASK(std::uint32_t value) { reinterpret_cast<volatile TPR_t*>(ITM_BASE + offsetof(ITM_t, TPR))->bt.PRIVMASK = value & static_cast<std::uint32_t>(EFields::PRIVMASK_FIELD); }
	};
	/*ITM trace control registers*/
	class TCR
	{
	private:
		union TCR_t
		{
			struct
			{
				std::uint32_t ITMENA         :  1;	/* ITM enable */
				std::uint32_t TSENA          :  1;	/* Local timestamp generation enable */
				std::uint32_t SYNCENA        :  1;	/* Synchronization packet transmission enable */
				std::uint32_t TXENA          :  1;	/* Hardware event packet forwarding enable */
				std::uint32_t SWOENA         :  1;	/* Asynchronous clocking enable for the timestamp counter (read-only) */
				std::uint32_t                :  3;
				std::uint32_t TSPRESCALE     :  2;	/* Local timestamp prescale */
				std::uint32_t GTSFREQ        :  2;	/* Global timestamp frequency */
				std::uint32_t                :  4;
				std::uint32_t TRACEBUSID     :  7;	/* Identifier for multi-source trace stream formatting */
				std::uint32_t BUSY           :  1;	/* ITM busy */
				std::uint32_t                :  8;
			} bt;
			uint32_t dw;
		};
	public:
		TCR_t value;

		enum class EOffsets: std::uint32_t
		{
			ITMENA_OFFSET          = 0,
			TSENA_OFFSET           = 1,
			SYNCENA_OFFSET         = 2,
			TXENA_OFFSET           = 3,
			SWOENA_OFFSET          = 4,
			TSPRESCALE_OFFSET      = 8,
			GTSFREQ_OFFSET         = 10,
			TRACEBUSID_OFFSET      = 16,
			BUSY_OFFSET            = 23,
		};
		enum class EFields: std::uint32_t
		{
			ITMENA_FIELD           = 0x00000001U,
			TSENA_FIELD            = 0x00000001U,
			SYNCENA_FIELD          = 0x00000001U,
			TXENA_FIELD            = 0x00000001U,
			SWOENA_FIELD           = 0x00000001U,
			TSPRESCALE_FIELD       = 0x00000003U,
			GTSFREQ_FIELD          = 0x00000003U,
			TRACEBUSID_FIELD       = 0x0000007fU,
			BUSY_FIELD             = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ITMENA),
			FIELD_MSK(TSENA),
			FIELD_MSK(SYNCENA),
			FIELD_MSK(TXENA),
			FIELD_MSK(SWOENA),
			FIELD_MSK(TSPRESCALE),
			FIELD_MSK(GTSFREQ),
			FIELD_MSK(TRACEBUSID),
			FIELD_MSK(BUSY),
		};
		static inline std::uint32_t get() { return (get_ptr()->TCR); }
		inline void read() { value.dw = get_ptr()->TCR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->TCR = set_value; }
		inline void write() { get_ptr()->TCR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->TCR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->TCR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->TCR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_TSPRESCALE() { return (reinterpret_cast<volatile TCR_t*>(ITM_BASE + offsetof(ITM_t, TCR))->bt.TSPRESCALE); }
		static inline void set_TSPRESCALE(std::uint32_t value) { reinterpret_cast<volatile TCR_t*>(ITM_BASE + offsetof(ITM_t, TCR))->bt.TSPRESCALE = value & static_cast<std::uint32_t>(EFields::TSPRESCALE_FIELD); }
		static inline std::uint32_t get_GTSFREQ() { return (reinterpret_cast<volatile TCR_t*>(ITM_BASE + offsetof(ITM_t, TCR))->bt.GTSFREQ); }
		static inline void set_GTSFREQ(std::uint32_t value) { reinterpret_cast<volatile TCR_t*>(ITM_BASE + offsetof(ITM_t, TCR))->bt.GTSFREQ = value & static_cast<std::uint32_t>(EFields::GTSFREQ_FIELD); }
		static inline std::uint32_t get_TRACEBUSID() { return (reinterpret_cast<volatile TCR_t*>(ITM_BASE + offsetof(ITM_t, TCR))->bt.TRACEBUSID); }
		static inline void set_TRACEBUSID(std::uint32_t value) { reinterpret_cast<volatile TCR_t*>(ITM_BASE + offsetof(ITM_t, TCR))->bt.TRACEBUSID = value & static_cast<std::uint32_t>(EFields::TRACEBUSID_FIELD); }
	};
	/*ITM Integration Write Register*/
	class IWR
	{
	private:
		union IWR_t
		{
			struct
			{
				std::uint32_t ATVALIDM       :  1;	/* - */
				std::uint32_t                : 31;
			} bt;
			uint32_t dw;
		};
	public:
		IWR_t value;

		enum class EOffsets: std::uint32_t
		{
			ATVALIDM_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			ATVALIDM_FIELD         = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ATVALIDM),
		};
		static inline std::uint32_t get() { return (get_ptr()->IWR); }
		inline void read() { value.dw = get_ptr()->IWR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->IWR = set_value; }
		inline void write() { get_ptr()->IWR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->IWR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->IWR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->IWR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*ITM Integration Read Register*/
	class IRR
	{
	private:
		union IRR_t
		{
			struct
			{
				std::uint32_t ATREADYM       :  1;	/* - */
				std::uint32_t                : 31;
			} bt;
			uint32_t dw;
		};
	public:
		IRR_t value;

		enum class EOffsets: std::uint32_t
		{
			ATREADYM_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			ATREADYM_FIELD         = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ATREADYM),
		};
		static inline std::uint32_t get() { return (get_ptr()->IRR); }
		inline void read() { value.dw = get_ptr()->IRR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->IRR = set_value; }
		inline void write() { get_ptr()->IRR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->IRR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->IRR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->IRR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*ITM Integration Mode Control Register*/
	class IMCR
	{
	private:
		union IMCR_t
		{
			struct
			{
				std::uint32_t INTEGRATION    :  1;	/* - */
				std::uint32_t                : 31;
			} bt;
			uint32_t dw;
		};
	public:
		IMCR_t value;

		enum class EOffsets: std::uint32_t
		{
			INTEGRATION_OFFSET     = 0,
		};
		enum class EFields: std::uint32_t
		{
			INTEGRATION_FIELD      = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(INTEGRATION),
		};
		static inline std::uint32_t get() { return (get_ptr()->IMCR); }
		inline void read() { value.dw = get_ptr()->IMCR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->IMCR = set_value; }
		inline void write() { get_ptr()->IMCR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->IMCR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->IMCR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->IMCR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*ITM Lock Access Register*/
	class LAR
	{
	private:
		union LAR_t
		{
			struct
			{
				std::uint32_t Present        :  1;	/* - */
				std::uint32_t Access         :  1;	/* - */
				std::uint32_t ByteAcc        :  1;	/* - */
				std::uint32_t                : 29;
			} bt;
			uint32_t dw;
		};
	public:
		LAR_t value;

		enum class EOffsets: std::uint32_t
		{
			Present_OFFSET         = 0,
			Access_OFFSET          = 1,
			ByteAcc_OFFSET         = 2,
		};
		enum class EFields: std::uint32_t
		{
			Present_FIELD          = 0x00000001U,
			Access_FIELD           = 0x00000001U,
			ByteAcc_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(Present),
			FIELD_MSK(Access),
			FIELD_MSK(ByteAcc),
		};
		static inline std::uint32_t get() { return (get_ptr()->LAR); }
		inline void read() { value.dw = get_ptr()->LAR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->LAR = set_value; }
		inline void write() { get_ptr()->LAR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->LAR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->LAR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->LAR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*ITM Lock Status Register*/
	class LSR
	{
	private:
		union LSR_t
		{
			struct
			{
				std::uint32_t Present        :  1;	/* - */
				std::uint32_t Access         :  1;	/* - */
				std::uint32_t ByteAcc        :  1;	/* - */
				std::uint32_t                : 29;
			} bt;
			uint32_t dw;
		};
	public:
		LSR_t value;

		enum class EOffsets: std::uint32_t
		{
			Present_OFFSET         = 0,
			Access_OFFSET          = 1,
			ByteAcc_OFFSET         = 2,
		};
		enum class EFields: std::uint32_t
		{
			Present_FIELD          = 0x00000001U,
			Access_FIELD           = 0x00000001U,
			ByteAcc_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(Present),
			FIELD_MSK(Access),
			FIELD_MSK(ByteAcc),
		};
		static inline std::uint32_t get() { return (get_ptr()->LSR); }
		inline void read() { value.dw = get_ptr()->LSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->LSR = set_value; }
		inline void write() { get_ptr()->LSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->LSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->LSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->LSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*ITM CoreSight peripheral identity register 4*/
	class PIDR4
	{
	private:
		union PIDR4_t
		{
			struct
			{
				std::uint32_t JEP106CON      :  4;	/* JEP106 continuation code */
				std::uint32_t _4KCOUNT       :  4;	/* Register file size */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR4_t value;

		enum class EOffsets: std::uint32_t
		{
			JEP106CON_OFFSET       = 0,
			_4KCOUNT_OFFSET        = 4,
		};
		enum class EFields: std::uint32_t
		{
			JEP106CON_FIELD        = 0x0000000fU,
			_4KCOUNT_FIELD         = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(JEP106CON),
			FIELD_MSK(_4KCOUNT),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR4); }
		inline void read() { value.dw = get_ptr()->PIDR4; }
		static inline std::uint32_t get_JEP106CON() { return (reinterpret_cast<volatile PIDR4_t*>(ITM_BASE + offsetof(ITM_t, PIDR4))->bt.JEP106CON); }
		static inline std::uint32_t get__4KCOUNT() { return (reinterpret_cast<volatile PIDR4_t*>(ITM_BASE + offsetof(ITM_t, PIDR4))->bt._4KCOUNT); }
	};
	/*ITM CoreSight peripheral identity register 5*/
	class PIDR5
	{
	private:
		union PIDR5_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR5_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR5); }
		inline void read() { value.dw = get_ptr()->PIDR5; }
	};
	/*ITM CoreSight peripheral identity register 6*/
	class PIDR6
	{
	private:
		union PIDR6_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR6_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR6); }
		inline void read() { value.dw = get_ptr()->PIDR6; }
	};
	/*ITM CoreSight peripheral identity register 7*/
	class PIDR7
	{
	private:
		union PIDR7_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR7_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR7); }
		inline void read() { value.dw = get_ptr()->PIDR7; }
	};
	/*ITM CoreSight peripheral identity register 0*/
	class PIDR0
	{
	private:
		union PIDR0_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR0_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR0); }
		inline void read() { value.dw = get_ptr()->PIDR0; }
	};
	/*ITM CoreSight peripheral identity register 1*/
	class PIDR1
	{
	private:
		union PIDR1_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR1_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR1); }
		inline void read() { value.dw = get_ptr()->PIDR1; }
	};
	/*ITM CoreSight peripheral identity register 2*/
	class PIDR2
	{
	private:
		union PIDR2_t
		{
			struct
			{
				std::uint32_t                : 32;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR2_t value;

		enum class EOffsets: std::uint32_t
		{
		};
		enum class EFields: std::uint32_t
		{
		};
		enum class EMasks: std::uint32_t
		{
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR2); }
		inline void read() { value.dw = get_ptr()->PIDR2; }
	};
	/*ITM CoreSight peripheral identity register 3*/
	class PIDR3
	{
	private:
		union PIDR3_t
		{
			struct
			{
				std::uint32_t CMOD           :  4;	/* Customer modified */
				std::uint32_t REVAND         :  4;	/* Metal fix version */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		PIDR3_t value;

		enum class EOffsets: std::uint32_t
		{
			CMOD_OFFSET            = 0,
			REVAND_OFFSET          = 4,
		};
		enum class EFields: std::uint32_t
		{
			CMOD_FIELD             = 0x0000000fU,
			REVAND_FIELD           = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CMOD),
			FIELD_MSK(REVAND),
		};
		static inline std::uint32_t get() { return (get_ptr()->PIDR3); }
		inline void read() { value.dw = get_ptr()->PIDR3; }
		static inline std::uint32_t get_CMOD() { return (reinterpret_cast<volatile PIDR3_t*>(ITM_BASE + offsetof(ITM_t, PIDR3))->bt.CMOD); }
		static inline std::uint32_t get_REVAND() { return (reinterpret_cast<volatile PIDR3_t*>(ITM_BASE + offsetof(ITM_t, PIDR3))->bt.REVAND); }
	};
	/*ITM CoreSight component identity register 0*/
	class CIDR0
	{
	private:
		union CIDR0_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  8;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR0_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR0); }
		inline void read() { value.dw = get_ptr()->CIDR0; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR0_t*>(ITM_BASE + offsetof(ITM_t, CIDR0))->bt.PREAMBLE); }
	};
	/*ITM CoreSight component identity register 1*/
	class CIDR1
	{
	private:
		union CIDR1_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  4;	/* Component ID field - component class */
				std::uint32_t CLASS          :  4;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR1_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
			CLASS_OFFSET           = 4,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x0000000fU,
			CLASS_FIELD            = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
			FIELD_MSK(CLASS),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR1); }
		inline void read() { value.dw = get_ptr()->CIDR1; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR1_t*>(ITM_BASE + offsetof(ITM_t, CIDR1))->bt.PREAMBLE); }
		static inline std::uint32_t get_CLASS() { return (reinterpret_cast<volatile CIDR1_t*>(ITM_BASE + offsetof(ITM_t, CIDR1))->bt.CLASS); }
	};
	/*ITM CoreSight component identity register 2*/
	class CIDR2
	{
	private:
		union CIDR2_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  8;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR2_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR2); }
		inline void read() { value.dw = get_ptr()->CIDR2; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR2_t*>(ITM_BASE + offsetof(ITM_t, CIDR2))->bt.PREAMBLE); }
	};
	/*ITM CoreSight component identity register 3*/
	class CIDR3
	{
	private:
		union CIDR3_t
		{
			struct
			{
				std::uint32_t PREAMBLE       :  8;	/* Component ID field */
				std::uint32_t                : 24;
			} bt;
			uint32_t dw;
		};
	public:
		CIDR3_t value;

		enum class EOffsets: std::uint32_t
		{
			PREAMBLE_OFFSET        = 0,
		};
		enum class EFields: std::uint32_t
		{
			PREAMBLE_FIELD         = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PREAMBLE),
		};
		static inline std::uint32_t get() { return (get_ptr()->CIDR3); }
		inline void read() { value.dw = get_ptr()->CIDR3; }
		static inline std::uint32_t get_PREAMBLE() { return (reinterpret_cast<volatile CIDR3_t*>(ITM_BASE + offsetof(ITM_t, CIDR3))->bt.PREAMBLE); }
	};
};

#define ITM_PORT0_VALUE
#define ITM_PORT1_VALUE
#define ITM_PORT2_VALUE
#define ITM_PORT3_VALUE
#define ITM_PORT4_VALUE
#define ITM_PORT5_VALUE
#define ITM_PORT6_VALUE
#define ITM_PORT7_VALUE
#define ITM_TER_STIMENA0
#define ITM_TER_STIMENA1
#define ITM_TER_STIMENA2
#define ITM_TER_STIMENA3
#define ITM_TER_STIMENA4
#define ITM_TER_STIMENA5
#define ITM_TER_STIMENA6
#define ITM_TER_STIMENA7
#define ITM_TER_STIMENA8
#define ITM_TER_STIMENA9
#define ITM_TER_STIMENA10
#define ITM_TER_STIMENA11
#define ITM_TER_STIMENA12
#define ITM_TER_STIMENA13
#define ITM_TER_STIMENA14
#define ITM_TER_STIMENA15
#define ITM_TER_STIMENA16
#define ITM_TER_STIMENA17
#define ITM_TER_STIMENA18
#define ITM_TER_STIMENA19
#define ITM_TER_STIMENA20
#define ITM_TER_STIMENA21
#define ITM_TER_STIMENA22
#define ITM_TER_STIMENA23
#define ITM_TER_STIMENA24
#define ITM_TER_STIMENA25
#define ITM_TER_STIMENA26
#define ITM_TER_STIMENA27
#define ITM_TER_STIMENA28
#define ITM_TER_STIMENA29
#define ITM_TER_STIMENA30
#define ITM_TER_STIMENA31
#define ITM_TPR_PRIVMASK
#define ITM_TCR_ITMENA
#define ITM_TCR_TSENA
#define ITM_TCR_SYNCENA
#define ITM_TCR_TXENA
#define ITM_TCR_SWOENA
#define ITM_TCR_TSPRESCALE
#define ITM_TCR_GTSFREQ
#define ITM_TCR_TRACEBUSID
#define ITM_TCR_BUSY
#define ITM_IWR_ATVALIDM
#define ITM_IRR_ATREADYM
#define ITM_IMCR_INTEGRATION
#define ITM_LAR_Present
#define ITM_LAR_Access
#define ITM_LAR_ByteAcc
#define ITM_LSR_Present
#define ITM_LSR_Access
#define ITM_LSR_ByteAcc
#define ITM_PIDR4_JEP106CON
#define ITM_PIDR4__4KCOUNT
#define ITM_PIDR3_CMOD
#define ITM_PIDR3_REVAND
#define ITM_CIDR0_PREAMBLE
#define ITM_CIDR1_PREAMBLE
#define ITM_CIDR1_CLASS
#define ITM_CIDR2_PREAMBLE
#define ITM_CIDR3_PREAMBLE
#pragma endregion ITM

#pragma region SCB
/* System Control Block */
class SCB
{
public:
	struct SCB_t
	{
		__I  std::uint32_t	CPUID;
		__IO std::uint32_t	ICSR;
		__IO std::uint32_t	VTOR;
		__IO std::uint32_t	AIRCR;
		__IO std::uint32_t	SCR;
		__IO std::uint32_t	CCR;
		__IO std::uint32_t	SHPR1;
		__IO std::uint32_t	SHPR2;
		__IO std::uint32_t	SHPR3;
		__IO std::uint32_t	SHCSR;
		__IO std::uint32_t	CFSR;
		__IO std::uint32_t	HFSR;
		__IO std::uint32_t	DFSR;
		__IO std::uint32_t	MMFAR;
		__IO std::uint32_t	BFAR;
		__IO std::uint32_t	AFSR;
		__IO std::uint32_t	ID_PFR0;
		__IO std::uint32_t	ID_PFR1;
		__IO std::uint32_t	ID_DFR0;
		__IO std::uint32_t	ID_AFR0;
		__IO std::uint32_t	ID_MMFR0;
		__IO std::uint32_t	ID_MMFR1;
		__IO std::uint32_t	ID_MMFR2;
		__IO std::uint32_t	ID_MMFR3;
		__IO std::uint32_t	ID_ISAR0;
		__IO std::uint32_t	ID_ISAR1;
		__IO std::uint32_t	ID_ISAR2;
		__IO std::uint32_t	ID_ISAR3;
		__IO std::uint32_t	ID_ISAR4;
			 std::uint32_t	dummy_116[5];
		__IO std::uint32_t	CPACR;
	};
private:
	static inline volatile SCB_t* get_ptr() { return (reinterpret_cast<SCB_t*>(SCB_BASE)); }
public:
	/*CPUID Base Register*/
	class CPUID
	{
	private:
		union CPUID_t
		{
			struct
			{
				std::uint32_t Revision       :  4;	/* Revision number, the p value in the rnpn product revision identifier */
				std::uint32_t PartNo         : 12;	/* Part number of the processor */
				std::uint32_t                :  4;
				std::uint32_t Variant        :  4;	/* Variant number, the r value in the rnpn product revision identifier */
				std::uint32_t Implementer    :  8;	/* Implementer code */
			} bt;
			uint32_t dw;
		};
	public:
		CPUID_t value;

		enum class EOffsets: std::uint32_t
		{
			Revision_OFFSET        = 0,
			PartNo_OFFSET          = 4,
			Variant_OFFSET         = 20,
			Implementer_OFFSET     = 24,
		};
		enum class EFields: std::uint32_t
		{
			Revision_FIELD         = 0x0000000fU,
			PartNo_FIELD           = 0x00000fffU,
			Variant_FIELD          = 0x0000000fU,
			Implementer_FIELD      = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(Revision),
			FIELD_MSK(PartNo),
			FIELD_MSK(Variant),
			FIELD_MSK(Implementer),
		};
		static inline std::uint32_t get() { return (get_ptr()->CPUID); }
		inline void read() { value.dw = get_ptr()->CPUID; }
		static inline std::uint32_t get_Revision() { return (reinterpret_cast<volatile CPUID_t*>(SCB_BASE + offsetof(SCB_t, CPUID))->bt.Revision); }
		static inline std::uint32_t get_PartNo() { return (reinterpret_cast<volatile CPUID_t*>(SCB_BASE + offsetof(SCB_t, CPUID))->bt.PartNo); }
		static inline std::uint32_t get_Variant() { return (reinterpret_cast<volatile CPUID_t*>(SCB_BASE + offsetof(SCB_t, CPUID))->bt.Variant); }
		static inline std::uint32_t get_Implementer() { return (reinterpret_cast<volatile CPUID_t*>(SCB_BASE + offsetof(SCB_t, CPUID))->bt.Implementer); }
	};
	/*Interrupt control and state register*/
	class ICSR
	{
	private:
		union ICSR_t
		{
			struct
			{
				std::uint32_t VECTACTIVE     :  9;	/* Contains the active exception number */
				std::uint32_t                :  2;
				std::uint32_t RETTOBASE      :  1;	/* Indicates whether there are preempted active exceptions */
				std::uint32_t VECTPENDING    :  9;	/* Indicates the exception number of the highest priority pending enabled exception */
				std::uint32_t                :  1;
				std::uint32_t ISRPENDING     :  1;	/* Interrupt pending flag, excluding NMI and Faults */
				std::uint32_t ISRPREEMPT     :  1;	/*  */
				std::uint32_t                :  1;
				std::uint32_t PENDSTCLR      :  1;	/* SysTick exception clear-pending bit */
				std::uint32_t PENDSTSET      :  1;	/* SysTick exception set-pending bit */
				std::uint32_t PENDSVCLR      :  1;	/* PendSV clear-pending bit */
				std::uint32_t PENDSVSET      :  1;	/* PendSV set-pending bit */
				std::uint32_t                :  2;
				std::uint32_t NMIPENDSET     :  1;	/* NMI set-pending bit */
			} bt;
			uint32_t dw;
		};
	public:
		ICSR_t value;

		enum class EOffsets: std::uint32_t
		{
			VECTACTIVE_OFFSET      = 0,
			RETTOBASE_OFFSET       = 11,
			VECTPENDING_OFFSET     = 12,
			ISRPENDING_OFFSET      = 22,
			ISRPREEMPT_OFFSET      = 23,
			PENDSTCLR_OFFSET       = 25,
			PENDSTSET_OFFSET       = 26,
			PENDSVCLR_OFFSET       = 27,
			PENDSVSET_OFFSET       = 28,
			NMIPENDSET_OFFSET      = 31,
		};
		enum class EFields: std::uint32_t
		{
			VECTACTIVE_FIELD       = 0x000001ffU,
			RETTOBASE_FIELD        = 0x00000001U,
			VECTPENDING_FIELD      = 0x000001ffU,
			ISRPENDING_FIELD       = 0x00000001U,
			ISRPREEMPT_FIELD       = 0x00000001U,
			PENDSTCLR_FIELD        = 0x00000001U,
			PENDSTSET_FIELD        = 0x00000001U,
			PENDSVCLR_FIELD        = 0x00000001U,
			PENDSVSET_FIELD        = 0x00000001U,
			NMIPENDSET_FIELD       = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VECTACTIVE),
			FIELD_MSK(RETTOBASE),
			FIELD_MSK(VECTPENDING),
			FIELD_MSK(ISRPENDING),
			FIELD_MSK(ISRPREEMPT),
			FIELD_MSK(PENDSTCLR),
			FIELD_MSK(PENDSTSET),
			FIELD_MSK(PENDSVCLR),
			FIELD_MSK(PENDSVSET),
			FIELD_MSK(NMIPENDSET),
		};
		static inline std::uint32_t get() { return (get_ptr()->ICSR); }
		inline void read() { value.dw = get_ptr()->ICSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ICSR = set_value; }
		inline void write() { get_ptr()->ICSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->ICSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->ICSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->ICSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_VECTACTIVE() { return (reinterpret_cast<volatile ICSR_t*>(SCB_BASE + offsetof(SCB_t, ICSR))->bt.VECTACTIVE); }
		static inline void set_VECTACTIVE(std::uint32_t value) { reinterpret_cast<volatile ICSR_t*>(SCB_BASE + offsetof(SCB_t, ICSR))->bt.VECTACTIVE = value & static_cast<std::uint32_t>(EFields::VECTACTIVE_FIELD); }
		static inline std::uint32_t get_VECTPENDING() { return (reinterpret_cast<volatile ICSR_t*>(SCB_BASE + offsetof(SCB_t, ICSR))->bt.VECTPENDING); }
		static inline void set_VECTPENDING(std::uint32_t value) { reinterpret_cast<volatile ICSR_t*>(SCB_BASE + offsetof(SCB_t, ICSR))->bt.VECTPENDING = value & static_cast<std::uint32_t>(EFields::VECTPENDING_FIELD); }
	};
	/*Vector table offset register*/
	class VTOR
	{
	private:
		union VTOR_t
		{
			struct
			{
				std::uint32_t                :  7;
				std::uint32_t TBLOFF         : 25;	/* Vector table base offset field */
			} bt;
			uint32_t dw;
		};
	public:
		VTOR_t value;

		enum class EOffsets: std::uint32_t
		{
			TBLOFF_OFFSET          = 7,
		};
		enum class EFields: std::uint32_t
		{
			TBLOFF_FIELD           = 0x01ffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(TBLOFF),
		};
		static inline std::uint32_t get() { return (get_ptr()->VTOR); }
		inline void read() { value.dw = get_ptr()->VTOR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->VTOR = set_value; }
		inline void write() { get_ptr()->VTOR = value.dw; }
		static inline std::uint32_t get_TBLOFF() { return (reinterpret_cast<volatile VTOR_t*>(SCB_BASE + offsetof(SCB_t, VTOR))->bt.TBLOFF); }
		static inline void set_TBLOFF(std::uint32_t value) { reinterpret_cast<volatile VTOR_t*>(SCB_BASE + offsetof(SCB_t, VTOR))->bt.TBLOFF = value & static_cast<std::uint32_t>(EFields::TBLOFF_FIELD); }
	};
	/*Application interrupt and reset control register*/
	class AIRCR
	{
	private:
		union AIRCR_t
		{
			struct
			{
				std::uint32_t VECTRESET      :  1;	/*  */
				std::uint32_t VECTCLRACTIVE  :  1;	/*  */
				std::uint32_t SYSRESETREQ    :  1;	/* System reset request */
				std::uint32_t                :  5;
				std::uint32_t PRIGROUP       :  3;	/* Interrupt priority grouping field */
				std::uint32_t                :  4;
				std::uint32_t ENDIANNESS     :  1;	/* Data endianness bit */
				std::uint32_t VECTKEY        : 16;	/* Register key */
			} bt;
			uint32_t dw;
		};
	public:
		AIRCR_t value;

		enum class EOffsets: std::uint32_t
		{
			VECTRESET_OFFSET       = 0,
			VECTCLRACTIVE_OFFSET   = 1,
			SYSRESETREQ_OFFSET     = 2,
			PRIGROUP_OFFSET        = 8,
			ENDIANNESS_OFFSET      = 15,
			VECTKEY_OFFSET         = 16,
		};
		enum class EFields: std::uint32_t
		{
			VECTRESET_FIELD        = 0x00000001U,
			VECTCLRACTIVE_FIELD    = 0x00000001U,
			SYSRESETREQ_FIELD      = 0x00000001U,
			PRIGROUP_FIELD         = 0x00000007U,
			ENDIANNESS_FIELD       = 0x00000001U,
			VECTKEY_FIELD          = 0x0000ffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VECTRESET),
			FIELD_MSK(VECTCLRACTIVE),
			FIELD_MSK(SYSRESETREQ),
			FIELD_MSK(PRIGROUP),
			FIELD_MSK(ENDIANNESS),
			FIELD_MSK(VECTKEY),
		};
		static inline std::uint32_t get() { return (get_ptr()->AIRCR); }
		inline void read() { value.dw = get_ptr()->AIRCR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->AIRCR = set_value; }
		inline void write() { get_ptr()->AIRCR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->AIRCR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->AIRCR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->AIRCR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_PRIGROUP() { return (reinterpret_cast<volatile AIRCR_t*>(SCB_BASE + offsetof(SCB_t, AIRCR))->bt.PRIGROUP); }
		static inline void set_PRIGROUP(std::uint32_t value) { reinterpret_cast<volatile AIRCR_t*>(SCB_BASE + offsetof(SCB_t, AIRCR))->bt.PRIGROUP = value & static_cast<std::uint32_t>(EFields::PRIGROUP_FIELD); }
		static inline std::uint32_t get_VECTKEY() { return (reinterpret_cast<volatile AIRCR_t*>(SCB_BASE + offsetof(SCB_t, AIRCR))->bt.VECTKEY); }
		static inline void set_VECTKEY(std::uint32_t value) { reinterpret_cast<volatile AIRCR_t*>(SCB_BASE + offsetof(SCB_t, AIRCR))->bt.VECTKEY = value & static_cast<std::uint32_t>(EFields::VECTKEY_FIELD); }
	};
	/*System control register*/
	class SCR
	{
	private:
		union SCR_t
		{
			struct
			{
				std::uint32_t                :  1;
				std::uint32_t SLEEPONEXIT    :  1;	/* Indicates sleep-on-exit when returning from Handler mode to Thread mode */
				std::uint32_t SLEEPDEEP      :  1;	/* Controls whether the processor uses sleep or deep sleep as its Low-power mode */
				std::uint32_t                :  1;
				std::uint32_t SEVONPEND      :  1;	/* Send Event on Pending bit */
				std::uint32_t                : 27;
			} bt;
			uint32_t dw;
		};
	public:
		SCR_t value;

		enum class EOffsets: std::uint32_t
		{
			SLEEPONEXIT_OFFSET     = 1,
			SLEEPDEEP_OFFSET       = 2,
			SEVONPEND_OFFSET       = 4,
		};
		enum class EFields: std::uint32_t
		{
			SLEEPONEXIT_FIELD      = 0x00000001U,
			SLEEPDEEP_FIELD        = 0x00000001U,
			SEVONPEND_FIELD        = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(SLEEPONEXIT),
			FIELD_MSK(SLEEPDEEP),
			FIELD_MSK(SEVONPEND),
		};
		static inline std::uint32_t get() { return (get_ptr()->SCR); }
		inline void read() { value.dw = get_ptr()->SCR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->SCR = set_value; }
		inline void write() { get_ptr()->SCR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->SCR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->SCR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->SCR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*Configuration and control register*/
	class CCR
	{
	private:
		union CCR_t
		{
			struct
			{
				std::uint32_t NONBASETHRDENA :  1;	/* Indicates how the processor enters Thread mode */
				std::uint32_t USERSETMPEND   :  1;	/* Enables unprivileged software access to the STIR */
				std::uint32_t                :  1;
				std::uint32_t UNALIGN_TRP    :  1;	/* Enables unaligned access traps */
				std::uint32_t DIV_0_TRP      :  1;	/* Enables faulting or halting when the processor executes an SDIV or UDIV instruction with a divisor of 0 */
				std::uint32_t                :  3;
				std::uint32_t BFHFNMIGN      :  1;	/* Enables handlers with priority -1 or -2 to ignore data BusFaults caused by load and store instructions */
				std::uint32_t STKALIGN       :  1;	/*  It indicates stack alignment on exception entry is 8-byte aligned */
				std::uint32_t                : 22;
			} bt;
			uint32_t dw;
		};
	public:
		CCR_t value;

		enum class EOffsets: std::uint32_t
		{
			NONBASETHRDENA_OFFSET  = 0,
			USERSETMPEND_OFFSET    = 1,
			UNALIGN_TRP_OFFSET     = 3,
			DIV_0_TRP_OFFSET       = 4,
			BFHFNMIGN_OFFSET       = 8,
			STKALIGN_OFFSET        = 9,
		};
		enum class EFields: std::uint32_t
		{
			NONBASETHRDENA_FIELD   = 0x00000001U,
			USERSETMPEND_FIELD     = 0x00000001U,
			UNALIGN_TRP_FIELD      = 0x00000001U,
			DIV_0_TRP_FIELD        = 0x00000001U,
			BFHFNMIGN_FIELD        = 0x00000001U,
			STKALIGN_FIELD         = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(NONBASETHRDENA),
			FIELD_MSK(USERSETMPEND),
			FIELD_MSK(UNALIGN_TRP),
			FIELD_MSK(DIV_0_TRP),
			FIELD_MSK(BFHFNMIGN),
			FIELD_MSK(STKALIGN),
		};
		static inline std::uint32_t get() { return (get_ptr()->CCR); }
		inline void read() { value.dw = get_ptr()->CCR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CCR = set_value; }
		inline void write() { get_ptr()->CCR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->CCR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->CCR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->CCR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*System handler priority register 1*/
	class SHPR1
	{
	private:
		union SHPR1_t
		{
			struct
			{
				std::uint32_t PRI_4          :  8;	/* Priority of system handler 4, MemManage */
				std::uint32_t PRI_5          :  8;	/* Priority of system handler 5, BusFault */
				std::uint32_t PRI_6          :  8;	/* Priority of system handler 6, UsageFault */
				std::uint32_t                :  8;
			} bt;
			uint32_t dw;
		};
	public:
		SHPR1_t value;

		enum class EOffsets: std::uint32_t
		{
			PRI_4_OFFSET           = 0,
			PRI_5_OFFSET           = 8,
			PRI_6_OFFSET           = 16,
		};
		enum class EFields: std::uint32_t
		{
			PRI_4_FIELD            = 0x000000ffU,
			PRI_5_FIELD            = 0x000000ffU,
			PRI_6_FIELD            = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PRI_4),
			FIELD_MSK(PRI_5),
			FIELD_MSK(PRI_6),
		};
		static inline std::uint32_t get() { return (get_ptr()->SHPR1); }
		inline void read() { value.dw = get_ptr()->SHPR1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->SHPR1 = set_value; }
		inline void write() { get_ptr()->SHPR1 = value.dw; }
		static inline std::uint32_t get_PRI_4() { return (reinterpret_cast<volatile SHPR1_t*>(SCB_BASE + offsetof(SCB_t, SHPR1))->bt.PRI_4); }
		static inline void set_PRI_4(std::uint32_t value) { reinterpret_cast<volatile SHPR1_t*>(SCB_BASE + offsetof(SCB_t, SHPR1))->bt.PRI_4 = value & static_cast<std::uint32_t>(EFields::PRI_4_FIELD); }
		static inline std::uint32_t get_PRI_5() { return (reinterpret_cast<volatile SHPR1_t*>(SCB_BASE + offsetof(SCB_t, SHPR1))->bt.PRI_5); }
		static inline void set_PRI_5(std::uint32_t value) { reinterpret_cast<volatile SHPR1_t*>(SCB_BASE + offsetof(SCB_t, SHPR1))->bt.PRI_5 = value & static_cast<std::uint32_t>(EFields::PRI_5_FIELD); }
		static inline std::uint32_t get_PRI_6() { return (reinterpret_cast<volatile SHPR1_t*>(SCB_BASE + offsetof(SCB_t, SHPR1))->bt.PRI_6); }
		static inline void set_PRI_6(std::uint32_t value) { reinterpret_cast<volatile SHPR1_t*>(SCB_BASE + offsetof(SCB_t, SHPR1))->bt.PRI_6 = value & static_cast<std::uint32_t>(EFields::PRI_6_FIELD); }
	};
	/*System handler priority register 2*/
	class SHPR2
	{
	private:
		union SHPR2_t
		{
			struct
			{
				std::uint32_t                : 24;
				std::uint32_t PRI_11         :  8;	/* Priority of system handler 11, SVCall */
			} bt;
			uint32_t dw;
		};
	public:
		SHPR2_t value;

		enum class EOffsets: std::uint32_t
		{
			PRI_11_OFFSET          = 24,
		};
		enum class EFields: std::uint32_t
		{
			PRI_11_FIELD           = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PRI_11),
		};
		static inline std::uint32_t get() { return (get_ptr()->SHPR2); }
		inline void read() { value.dw = get_ptr()->SHPR2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->SHPR2 = set_value; }
		inline void write() { get_ptr()->SHPR2 = value.dw; }
		static inline std::uint32_t get_PRI_11() { return (reinterpret_cast<volatile SHPR2_t*>(SCB_BASE + offsetof(SCB_t, SHPR2))->bt.PRI_11); }
		static inline void set_PRI_11(std::uint32_t value) { reinterpret_cast<volatile SHPR2_t*>(SCB_BASE + offsetof(SCB_t, SHPR2))->bt.PRI_11 = value & static_cast<std::uint32_t>(EFields::PRI_11_FIELD); }
	};
	/*System handler priority register 3*/
	class SHPR3
	{
	private:
		union SHPR3_t
		{
			struct
			{
				std::uint32_t                : 16;
				std::uint32_t PRI_14         :  8;	/* Priority of system handler 14, PendSV */
				std::uint32_t PRI_16         :  8;	/* Priority of system handler 15, SysTick exception */
			} bt;
			uint32_t dw;
		};
	public:
		SHPR3_t value;

		enum class EOffsets: std::uint32_t
		{
			PRI_14_OFFSET          = 16,
			PRI_16_OFFSET          = 24,
		};
		enum class EFields: std::uint32_t
		{
			PRI_14_FIELD           = 0x000000ffU,
			PRI_16_FIELD           = 0x000000ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(PRI_14),
			FIELD_MSK(PRI_16),
		};
		static inline std::uint32_t get() { return (get_ptr()->SHPR3); }
		inline void read() { value.dw = get_ptr()->SHPR3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->SHPR3 = set_value; }
		inline void write() { get_ptr()->SHPR3 = value.dw; }
		static inline std::uint32_t get_PRI_14() { return (reinterpret_cast<volatile SHPR3_t*>(SCB_BASE + offsetof(SCB_t, SHPR3))->bt.PRI_14); }
		static inline void set_PRI_14(std::uint32_t value) { reinterpret_cast<volatile SHPR3_t*>(SCB_BASE + offsetof(SCB_t, SHPR3))->bt.PRI_14 = value & static_cast<std::uint32_t>(EFields::PRI_14_FIELD); }
		static inline std::uint32_t get_PRI_16() { return (reinterpret_cast<volatile SHPR3_t*>(SCB_BASE + offsetof(SCB_t, SHPR3))->bt.PRI_16); }
		static inline void set_PRI_16(std::uint32_t value) { reinterpret_cast<volatile SHPR3_t*>(SCB_BASE + offsetof(SCB_t, SHPR3))->bt.PRI_16 = value & static_cast<std::uint32_t>(EFields::PRI_16_FIELD); }
	};
	/*System handler control and state register*/
	class SHCSR
	{
	private:
		union SHCSR_t
		{
			struct
			{
				std::uint32_t MEMFAULTACT    :  1;	/* MemManage exception active bit, reads as 1 if exception is active */
				std::uint32_t BUSFAULTACT    :  1;	/* BusFault exception active bit, reads as 1 if exception is active */
				std::uint32_t                :  1;
				std::uint32_t USGFAULTACT    :  1;	/* UsageFault exception active bit, reads as 1 if exception is active */
				std::uint32_t                :  3;
				std::uint32_t SVCALLACT      :  1;	/* SVCall active bit, reads as 1 if SVC call is active */
				std::uint32_t MONITORACT     :  1;	/* Debug monitor active bit, reads as 1 if Debug monitor is active */
				std::uint32_t                :  1;
				std::uint32_t PENDSVACT      :  1;	/* PendSV exception active bit, reads as 1 if exception is active */
				std::uint32_t SYSTICKACT     :  1;	/* SysTick exception active bit, reads as 1 if exception is active */
				std::uint32_t USGFAULTPENDED :  1;	/* UsageFault exception pending bit, reads as 1 if exception is pending */
				std::uint32_t MEMFAULTPENDED :  1;	/* MemManage exception pending bit, reads as 1 if exception is pending */
				std::uint32_t BUSFAULTPENDED :  1;	/* BusFault exception pending bit, reads as 1 if exception is pending */
				std::uint32_t SVCALLPENDED   :  1;	/* SVCall pending bit, reads as 1 if exception is pending */
				std::uint32_t MEMFAULTENA    :  1;	/* MemManage enable bit, set to 1 to enable */
				std::uint32_t BUSFAULTENA    :  1;	/* BusFault enable bit, set to 1 to enable */
				std::uint32_t USGFAULTENA    :  1;	/* UsageFault enable bit, set to 1 to enable */
				std::uint32_t                : 13;
			} bt;
			uint32_t dw;
		};
	public:
		SHCSR_t value;

		enum class EOffsets: std::uint32_t
		{
			MEMFAULTACT_OFFSET     = 0,
			BUSFAULTACT_OFFSET     = 1,
			USGFAULTACT_OFFSET     = 3,
			SVCALLACT_OFFSET       = 7,
			MONITORACT_OFFSET      = 8,
			PENDSVACT_OFFSET       = 10,
			SYSTICKACT_OFFSET      = 11,
			USGFAULTPENDED_OFFSET  = 12,
			MEMFAULTPENDED_OFFSET  = 13,
			BUSFAULTPENDED_OFFSET  = 14,
			SVCALLPENDED_OFFSET    = 15,
			MEMFAULTENA_OFFSET     = 16,
			BUSFAULTENA_OFFSET     = 17,
			USGFAULTENA_OFFSET     = 18,
		};
		enum class EFields: std::uint32_t
		{
			MEMFAULTACT_FIELD      = 0x00000001U,
			BUSFAULTACT_FIELD      = 0x00000001U,
			USGFAULTACT_FIELD      = 0x00000001U,
			SVCALLACT_FIELD        = 0x00000001U,
			MONITORACT_FIELD       = 0x00000001U,
			PENDSVACT_FIELD        = 0x00000001U,
			SYSTICKACT_FIELD       = 0x00000001U,
			USGFAULTPENDED_FIELD   = 0x00000001U,
			MEMFAULTPENDED_FIELD   = 0x00000001U,
			BUSFAULTPENDED_FIELD   = 0x00000001U,
			SVCALLPENDED_FIELD     = 0x00000001U,
			MEMFAULTENA_FIELD      = 0x00000001U,
			BUSFAULTENA_FIELD      = 0x00000001U,
			USGFAULTENA_FIELD      = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(MEMFAULTACT),
			FIELD_MSK(BUSFAULTACT),
			FIELD_MSK(USGFAULTACT),
			FIELD_MSK(SVCALLACT),
			FIELD_MSK(MONITORACT),
			FIELD_MSK(PENDSVACT),
			FIELD_MSK(SYSTICKACT),
			FIELD_MSK(USGFAULTPENDED),
			FIELD_MSK(MEMFAULTPENDED),
			FIELD_MSK(BUSFAULTPENDED),
			FIELD_MSK(SVCALLPENDED),
			FIELD_MSK(MEMFAULTENA),
			FIELD_MSK(BUSFAULTENA),
			FIELD_MSK(USGFAULTENA),
		};
		static inline std::uint32_t get() { return (get_ptr()->SHCSR); }
		inline void read() { value.dw = get_ptr()->SHCSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->SHCSR = set_value; }
		inline void write() { get_ptr()->SHCSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->SHCSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->SHCSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->SHCSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*Configurable fault status register*/
	class CFSR
	{
	private:
		union CFSR_t
		{
			struct
			{
				std::uint32_t IACCVIOL       :  1;	/* Instruction access violation flag */
				std::uint32_t DACCVIOL       :  1;	/* Data access violation flag */
				std::uint32_t                :  1;
				std::uint32_t MUNSTKERR      :  1;	/* MemManage fault on unstacking for a return from exception */
				std::uint32_t MSTKERR        :  1;	/* MemManage fault on stacking for exception entry */
				std::uint32_t                :  2;
				std::uint32_t MMARVALID      :  1;	/* MemManage Fault Address register (MMFAR) valid flag */
				std::uint32_t IBUSERR        :  1;	/* Instruction bus error */
				std::uint32_t PRECISERR      :  1;	/* Precise data bus error */
				std::uint32_t IMPRECISERR    :  1;	/* Imprecise data bus error */
				std::uint32_t UNSTKERR       :  1;	/* BusFault on unstacking for a return from exception */
				std::uint32_t STKERR         :  1;	/* BusFault on stacking for exception entry */
				std::uint32_t                :  2;
				std::uint32_t BFARVALID      :  1;	/* BusFault Address register (BFAR) valid flag */
				std::uint32_t UNDEFINSTR     :  1;	/* Undefined instruction UsageFault */
				std::uint32_t INVSTATE       :  1;	/* Invalid state UsageFault */
				std::uint32_t INVPC          :  1;	/* Invalid PC load UsageFault, caused by an invalid PC load by EXC_RETURN */
				std::uint32_t NOCP           :  1;	/* No coprocessor UsageFault */
				std::uint32_t                :  4;
				std::uint32_t UNALIGNED      :  1;	/* Unaligned access UsageFault */
				std::uint32_t DIVBYZERO      :  1;	/* Divide by zero UsageFault */
				std::uint32_t                :  6;
			} bt;
			uint32_t dw;
		};
	public:
		CFSR_t value;

		enum class EOffsets: std::uint32_t
		{
			IACCVIOL_OFFSET        = 0,
			DACCVIOL_OFFSET        = 1,
			MUNSTKERR_OFFSET       = 3,
			MSTKERR_OFFSET         = 4,
			MMARVALID_OFFSET       = 7,
			IBUSERR_OFFSET         = 8,
			PRECISERR_OFFSET       = 9,
			IMPRECISERR_OFFSET     = 10,
			UNSTKERR_OFFSET        = 11,
			STKERR_OFFSET          = 12,
			BFARVALID_OFFSET       = 15,
			UNDEFINSTR_OFFSET      = 16,
			INVSTATE_OFFSET        = 17,
			INVPC_OFFSET           = 18,
			NOCP_OFFSET            = 19,
			UNALIGNED_OFFSET       = 24,
			DIVBYZERO_OFFSET       = 25,
		};
		enum class EFields: std::uint32_t
		{
			IACCVIOL_FIELD         = 0x00000001U,
			DACCVIOL_FIELD         = 0x00000001U,
			MUNSTKERR_FIELD        = 0x00000001U,
			MSTKERR_FIELD          = 0x00000001U,
			MMARVALID_FIELD        = 0x00000001U,
			IBUSERR_FIELD          = 0x00000001U,
			PRECISERR_FIELD        = 0x00000001U,
			IMPRECISERR_FIELD      = 0x00000001U,
			UNSTKERR_FIELD         = 0x00000001U,
			STKERR_FIELD           = 0x00000001U,
			BFARVALID_FIELD        = 0x00000001U,
			UNDEFINSTR_FIELD       = 0x00000001U,
			INVSTATE_FIELD         = 0x00000001U,
			INVPC_FIELD            = 0x00000001U,
			NOCP_FIELD             = 0x00000001U,
			UNALIGNED_FIELD        = 0x00000001U,
			DIVBYZERO_FIELD        = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(IACCVIOL),
			FIELD_MSK(DACCVIOL),
			FIELD_MSK(MUNSTKERR),
			FIELD_MSK(MSTKERR),
			FIELD_MSK(MMARVALID),
			FIELD_MSK(IBUSERR),
			FIELD_MSK(PRECISERR),
			FIELD_MSK(IMPRECISERR),
			FIELD_MSK(UNSTKERR),
			FIELD_MSK(STKERR),
			FIELD_MSK(BFARVALID),
			FIELD_MSK(UNDEFINSTR),
			FIELD_MSK(INVSTATE),
			FIELD_MSK(INVPC),
			FIELD_MSK(NOCP),
			FIELD_MSK(UNALIGNED),
			FIELD_MSK(DIVBYZERO),
		};
		static inline std::uint32_t get() { return (get_ptr()->CFSR); }
		inline void read() { value.dw = get_ptr()->CFSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CFSR = set_value; }
		inline void write() { get_ptr()->CFSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->CFSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->CFSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->CFSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*HardFault status register*/
	class HFSR
	{
	private:
		union HFSR_t
		{
			struct
			{
				std::uint32_t                :  1;
				std::uint32_t VECTTBL        :  1;	/* Indicates a BusFault on a vector table read during exception processing */
				std::uint32_t                : 28;
				std::uint32_t FORCED         :  1;	/* Indicates a forced hard fault, generated by escalation of a fault with configurable priority that cannot be handled, either because of priority or because it is disabled */
				std::uint32_t DEBUGEVT       :  1;	/* Reserved for Debug use. When writing to the register the user must write 1 to this bit, otherwise behavior is UNPREDICTABLE */
			} bt;
			uint32_t dw;
		};
	public:
		HFSR_t value;

		enum class EOffsets: std::uint32_t
		{
			VECTTBL_OFFSET         = 1,
			FORCED_OFFSET          = 30,
			DEBUGEVT_OFFSET        = 31,
		};
		enum class EFields: std::uint32_t
		{
			VECTTBL_FIELD          = 0x00000001U,
			FORCED_FIELD           = 0x00000001U,
			DEBUGEVT_FIELD         = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(VECTTBL),
			FIELD_MSK(FORCED),
			FIELD_MSK(DEBUGEVT),
		};
		static inline std::uint32_t get() { return (get_ptr()->HFSR); }
		inline void read() { value.dw = get_ptr()->HFSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->HFSR = set_value; }
		inline void write() { get_ptr()->HFSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->HFSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->HFSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->HFSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*Debug Fault Status Register*/
	class DFSR
	{
	private:
		union DFSR_t
		{
			struct
			{
				std::uint32_t HALTED         :  1;	/* - */
				std::uint32_t BKPT           :  1;	/* - */
				std::uint32_t DWTTRAP        :  1;	/* - */
				std::uint32_t VCATCH         :  1;	/* - */
				std::uint32_t EXTERNAL       :  1;	/* - */
				std::uint32_t                : 27;
			} bt;
			uint32_t dw;
		};
	public:
		DFSR_t value;

		enum class EOffsets: std::uint32_t
		{
			HALTED_OFFSET          = 0,
			BKPT_OFFSET            = 1,
			DWTTRAP_OFFSET         = 2,
			VCATCH_OFFSET          = 3,
			EXTERNAL_OFFSET        = 4,
		};
		enum class EFields: std::uint32_t
		{
			HALTED_FIELD           = 0x00000001U,
			BKPT_FIELD             = 0x00000001U,
			DWTTRAP_FIELD          = 0x00000001U,
			VCATCH_FIELD           = 0x00000001U,
			EXTERNAL_FIELD         = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(HALTED),
			FIELD_MSK(BKPT),
			FIELD_MSK(DWTTRAP),
			FIELD_MSK(VCATCH),
			FIELD_MSK(EXTERNAL),
		};
		static inline std::uint32_t get() { return (get_ptr()->DFSR); }
		inline void read() { value.dw = get_ptr()->DFSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->DFSR = set_value; }
		inline void write() { get_ptr()->DFSR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->DFSR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->DFSR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->DFSR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*MemManage fault address register*/
	class MMFAR
	{
	private:
		union MMFAR_t
		{
			struct
			{
				std::uint32_t ADDRESS        : 32;	/* When the MMARVALID bit of the MMFSR is set to 1, this field holds the address of the location that generated the MemManage fault */
			} bt;
			uint32_t dw;
		};
	public:
		MMFAR_t value;

		enum class EOffsets: std::uint32_t
		{
			ADDRESS_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			ADDRESS_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ADDRESS),
		};
		static inline std::uint32_t get() { return (get_ptr()->MMFAR); }
		inline void read() { value.dw = get_ptr()->MMFAR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->MMFAR = set_value; }
		inline void write() { get_ptr()->MMFAR = value.dw; }
		static inline std::uint32_t get_ADDRESS() { return (reinterpret_cast<volatile MMFAR_t*>(SCB_BASE + offsetof(SCB_t, MMFAR))->bt.ADDRESS); }
		static inline void set_ADDRESS(std::uint32_t value) { reinterpret_cast<volatile MMFAR_t*>(SCB_BASE + offsetof(SCB_t, MMFAR))->bt.ADDRESS = value & static_cast<std::uint32_t>(EFields::ADDRESS_FIELD); }
	};
	/*BusFault fault address register*/
	class BFAR
	{
	private:
		union BFAR_t
		{
			struct
			{
				std::uint32_t ADDRESS        : 32;	/* When the BFARVALID bit of the BFSR is set to 1, this field holds the address of the location that generated the BusFault */
			} bt;
			uint32_t dw;
		};
	public:
		BFAR_t value;

		enum class EOffsets: std::uint32_t
		{
			ADDRESS_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			ADDRESS_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ADDRESS),
		};
		static inline std::uint32_t get() { return (get_ptr()->BFAR); }
		inline void read() { value.dw = get_ptr()->BFAR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->BFAR = set_value; }
		inline void write() { get_ptr()->BFAR = value.dw; }
		static inline std::uint32_t get_ADDRESS() { return (reinterpret_cast<volatile BFAR_t*>(SCB_BASE + offsetof(SCB_t, BFAR))->bt.ADDRESS); }
		static inline void set_ADDRESS(std::uint32_t value) { reinterpret_cast<volatile BFAR_t*>(SCB_BASE + offsetof(SCB_t, BFAR))->bt.ADDRESS = value & static_cast<std::uint32_t>(EFields::ADDRESS_FIELD); }
	};
	/*Auxiliary fault status register*/
	class AFSR
	{
	private:
		union AFSR_t
		{
			struct
			{
				std::uint32_t IMPDEF         : 32;	/* Implementation defined. The AFSR contains additional system fault information. The bits map to the AUXFAULT input signals */
			} bt;
			uint32_t dw;
		};
	public:
		AFSR_t value;

		enum class EOffsets: std::uint32_t
		{
			IMPDEF_OFFSET          = 0,
		};
		enum class EFields: std::uint32_t
		{
			IMPDEF_FIELD           = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(IMPDEF),
		};
		static inline std::uint32_t get() { return (get_ptr()->AFSR); }
		inline void read() { value.dw = get_ptr()->AFSR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->AFSR = set_value; }
		inline void write() { get_ptr()->AFSR = value.dw; }
		static inline std::uint32_t get_IMPDEF() { return (reinterpret_cast<volatile AFSR_t*>(SCB_BASE + offsetof(SCB_t, AFSR))->bt.IMPDEF); }
		static inline void set_IMPDEF(std::uint32_t value) { reinterpret_cast<volatile AFSR_t*>(SCB_BASE + offsetof(SCB_t, AFSR))->bt.IMPDEF = value & static_cast<std::uint32_t>(EFields::IMPDEF_FIELD); }
	};
	/*Processor Feature Register 0*/
	class ID_PFR0
	{
	private:
		union ID_PFR0_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_PFR0_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_PFR0); }
		inline void read() { value.dw = get_ptr()->ID_PFR0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_PFR0 = set_value; }
		inline void write() { get_ptr()->ID_PFR0 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_PFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_PFR0))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_PFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_PFR0))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Processor Feature Register 1*/
	class ID_PFR1
	{
	private:
		union ID_PFR1_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_PFR1_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_PFR1); }
		inline void read() { value.dw = get_ptr()->ID_PFR1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_PFR1 = set_value; }
		inline void write() { get_ptr()->ID_PFR1 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_PFR1_t*>(SCB_BASE + offsetof(SCB_t, ID_PFR1))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_PFR1_t*>(SCB_BASE + offsetof(SCB_t, ID_PFR1))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Debug Feature Register 0*/
	class ID_DFR0
	{
	private:
		union ID_DFR0_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_DFR0_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_DFR0); }
		inline void read() { value.dw = get_ptr()->ID_DFR0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_DFR0 = set_value; }
		inline void write() { get_ptr()->ID_DFR0 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_DFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_DFR0))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_DFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_DFR0))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Auxiliary Feature Register 0*/
	class ID_AFR0
	{
	private:
		union ID_AFR0_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_AFR0_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_AFR0); }
		inline void read() { value.dw = get_ptr()->ID_AFR0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_AFR0 = set_value; }
		inline void write() { get_ptr()->ID_AFR0 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_AFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_AFR0))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_AFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_AFR0))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Memory Feature Register 0*/
	class ID_MMFR0
	{
	private:
		union ID_MMFR0_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_MMFR0_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_MMFR0); }
		inline void read() { value.dw = get_ptr()->ID_MMFR0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_MMFR0 = set_value; }
		inline void write() { get_ptr()->ID_MMFR0 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_MMFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR0))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_MMFR0_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR0))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Memory Feature Register 1*/
	class ID_MMFR1
	{
	private:
		union ID_MMFR1_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_MMFR1_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_MMFR1); }
		inline void read() { value.dw = get_ptr()->ID_MMFR1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_MMFR1 = set_value; }
		inline void write() { get_ptr()->ID_MMFR1 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_MMFR1_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR1))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_MMFR1_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR1))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Memory Feature Register 2*/
	class ID_MMFR2
	{
	private:
		union ID_MMFR2_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_MMFR2_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_MMFR2); }
		inline void read() { value.dw = get_ptr()->ID_MMFR2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_MMFR2 = set_value; }
		inline void write() { get_ptr()->ID_MMFR2 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_MMFR2_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR2))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_MMFR2_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR2))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Memory Feature Register 3*/
	class ID_MMFR3
	{
	private:
		union ID_MMFR3_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_MMFR3_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_MMFR3); }
		inline void read() { value.dw = get_ptr()->ID_MMFR3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_MMFR3 = set_value; }
		inline void write() { get_ptr()->ID_MMFR3 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_MMFR3_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR3))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_MMFR3_t*>(SCB_BASE + offsetof(SCB_t, ID_MMFR3))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Instruction Set Feature Register 0*/
	class ID_ISAR0
	{
	private:
		union ID_ISAR0_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_ISAR0_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_ISAR0); }
		inline void read() { value.dw = get_ptr()->ID_ISAR0; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_ISAR0 = set_value; }
		inline void write() { get_ptr()->ID_ISAR0 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_ISAR0_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR0))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_ISAR0_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR0))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Instruction Set Feature Register 1*/
	class ID_ISAR1
	{
	private:
		union ID_ISAR1_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_ISAR1_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_ISAR1); }
		inline void read() { value.dw = get_ptr()->ID_ISAR1; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_ISAR1 = set_value; }
		inline void write() { get_ptr()->ID_ISAR1 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_ISAR1_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR1))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_ISAR1_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR1))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Instruction Set Feature Register 2*/
	class ID_ISAR2
	{
	private:
		union ID_ISAR2_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_ISAR2_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_ISAR2); }
		inline void read() { value.dw = get_ptr()->ID_ISAR2; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_ISAR2 = set_value; }
		inline void write() { get_ptr()->ID_ISAR2 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_ISAR2_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR2))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_ISAR2_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR2))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Instruction Set Feature Register 3*/
	class ID_ISAR3
	{
	private:
		union ID_ISAR3_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_ISAR3_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_ISAR3); }
		inline void read() { value.dw = get_ptr()->ID_ISAR3; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_ISAR3 = set_value; }
		inline void write() { get_ptr()->ID_ISAR3 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_ISAR3_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR3))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_ISAR3_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR3))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Instruction Set Feature Register 4*/
	class ID_ISAR4
	{
	private:
		union ID_ISAR4_t
		{
			struct
			{
				std::uint32_t FEATURE        : 32;	/* - */
			} bt;
			uint32_t dw;
		};
	public:
		ID_ISAR4_t value;

		enum class EOffsets: std::uint32_t
		{
			FEATURE_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			FEATURE_FIELD          = 0x7fffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(FEATURE),
		};
		static inline std::uint32_t get() { return (get_ptr()->ID_ISAR4); }
		inline void read() { value.dw = get_ptr()->ID_ISAR4; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ID_ISAR4 = set_value; }
		inline void write() { get_ptr()->ID_ISAR4 = value.dw; }
		static inline std::uint32_t get_FEATURE() { return (reinterpret_cast<volatile ID_ISAR4_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR4))->bt.FEATURE); }
		static inline void set_FEATURE(std::uint32_t value) { reinterpret_cast<volatile ID_ISAR4_t*>(SCB_BASE + offsetof(SCB_t, ID_ISAR4))->bt.FEATURE = value & static_cast<std::uint32_t>(EFields::FEATURE_FIELD); }
	};
	/*Coprocessor access control register*/
	class CPACR
	{
	private:
		union CPACR_t
		{
			struct
			{
				std::uint32_t                : 20;
				std::uint32_t CP10           :  2;	/* Access privileges for coprocessor 10 */
				std::uint32_t CP11           :  2;	/* Access privileges for coprocessor 11 */
				std::uint32_t                :  8;
			} bt;
			uint32_t dw;
		};
	public:
		CPACR_t value;

		enum class EOffsets: std::uint32_t
		{
			CP10_OFFSET            = 20,
			CP11_OFFSET            = 22,
		};
		enum class EFields: std::uint32_t
		{
			CP10_FIELD             = 0x00000003U,
			CP11_FIELD             = 0x00000003U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CP10),
			FIELD_MSK(CP11),
		};
		static inline std::uint32_t get() { return (get_ptr()->CPACR); }
		inline void read() { value.dw = get_ptr()->CPACR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CPACR = set_value; }
		inline void write() { get_ptr()->CPACR = value.dw; }
		static inline std::uint32_t get_CP10() { return (reinterpret_cast<volatile CPACR_t*>(SCB_BASE + offsetof(SCB_t, CPACR))->bt.CP10); }
		static inline void set_CP10(std::uint32_t value) { reinterpret_cast<volatile CPACR_t*>(SCB_BASE + offsetof(SCB_t, CPACR))->bt.CP10 = value & static_cast<std::uint32_t>(EFields::CP10_FIELD); }
		static inline std::uint32_t get_CP11() { return (reinterpret_cast<volatile CPACR_t*>(SCB_BASE + offsetof(SCB_t, CPACR))->bt.CP11); }
		static inline void set_CP11(std::uint32_t value) { reinterpret_cast<volatile CPACR_t*>(SCB_BASE + offsetof(SCB_t, CPACR))->bt.CP11 = value & static_cast<std::uint32_t>(EFields::CP11_FIELD); }
	};
};

#define SCB_CPUID_Revision
#define SCB_CPUID_PartNo
#define SCB_CPUID_Variant
#define SCB_CPUID_Implementer
#define SCB_ICSR_VECTACTIVE
#define SCB_ICSR_RETTOBASE
#define SCB_ICSR_VECTPENDING
#define SCB_ICSR_ISRPENDING
#define SCB_ICSR_ISRPREEMPT
#define SCB_ICSR_PENDSTCLR
#define SCB_ICSR_PENDSTSET
#define SCB_ICSR_PENDSVCLR
#define SCB_ICSR_PENDSVSET
#define SCB_ICSR_NMIPENDSET
#define SCB_VTOR_TBLOFF
#define SCB_AIRCR_VECTRESET
#define SCB_AIRCR_VECTCLRACTIVE
#define SCB_AIRCR_SYSRESETREQ
#define SCB_AIRCR_PRIGROUP
#define SCB_AIRCR_ENDIANNESS
#define SCB_AIRCR_VECTKEY
#define SCB_SCR_SLEEPONEXIT
#define SCB_SCR_SLEEPDEEP
#define SCB_SCR_SEVONPEND
#define SCB_CCR_NONBASETHRDENA
#define SCB_CCR_USERSETMPEND
#define SCB_CCR_UNALIGN_TRP
#define SCB_CCR_DIV_0_TRP
#define SCB_CCR_BFHFNMIGN
#define SCB_CCR_STKALIGN
#define SCB_SHPR1_PRI_4
#define SCB_SHPR1_PRI_5
#define SCB_SHPR1_PRI_6
#define SCB_SHPR2_PRI_11
#define SCB_SHPR3_PRI_14
#define SCB_SHPR3_PRI_16
#define SCB_SHCSR_MEMFAULTACT
#define SCB_SHCSR_BUSFAULTACT
#define SCB_SHCSR_USGFAULTACT
#define SCB_SHCSR_SVCALLACT
#define SCB_SHCSR_MONITORACT
#define SCB_SHCSR_PENDSVACT
#define SCB_SHCSR_SYSTICKACT
#define SCB_SHCSR_USGFAULTPENDED
#define SCB_SHCSR_MEMFAULTPENDED
#define SCB_SHCSR_BUSFAULTPENDED
#define SCB_SHCSR_SVCALLPENDED
#define SCB_SHCSR_MEMFAULTENA
#define SCB_SHCSR_BUSFAULTENA
#define SCB_SHCSR_USGFAULTENA
#define SCB_CFSR_IACCVIOL
#define SCB_CFSR_DACCVIOL
#define SCB_CFSR_MUNSTKERR
#define SCB_CFSR_MSTKERR
#define SCB_CFSR_MMARVALID
#define SCB_CFSR_IBUSERR
#define SCB_CFSR_PRECISERR
#define SCB_CFSR_IMPRECISERR
#define SCB_CFSR_UNSTKERR
#define SCB_CFSR_STKERR
#define SCB_CFSR_BFARVALID
#define SCB_CFSR_UNDEFINSTR
#define SCB_CFSR_INVSTATE
#define SCB_CFSR_INVPC
#define SCB_CFSR_NOCP
#define SCB_CFSR_UNALIGNED
#define SCB_CFSR_DIVBYZERO
#define SCB_HFSR_VECTTBL
#define SCB_HFSR_FORCED
#define SCB_HFSR_DEBUGEVT
#define SCB_DFSR_HALTED
#define SCB_DFSR_BKPT
#define SCB_DFSR_DWTTRAP
#define SCB_DFSR_VCATCH
#define SCB_DFSR_EXTERNAL
#define SCB_MMFAR_ADDRESS
#define SCB_BFAR_ADDRESS
#define SCB_AFSR_IMPDEF
#define SCB_ID_PFR0_FEATURE
#define SCB_ID_PFR1_FEATURE
#define SCB_ID_DFR0_FEATURE
#define SCB_ID_AFR0_FEATURE
#define SCB_ID_MMFR0_FEATURE
#define SCB_ID_MMFR1_FEATURE
#define SCB_ID_MMFR2_FEATURE
#define SCB_ID_MMFR3_FEATURE
#define SCB_ID_ISAR0_FEATURE
#define SCB_ID_ISAR1_FEATURE
#define SCB_ID_ISAR2_FEATURE
#define SCB_ID_ISAR3_FEATURE
#define SCB_ID_ISAR4_FEATURE
#define SCB_CPACR_CP10
#define SCB_CPACR_CP11
#pragma endregion SCB

#pragma region SCS
/* System control Register not in SCB */
class SCS
{
public:
	struct SCS_t
	{
			 std::uint32_t	dummy_0;
		__IO std::uint32_t	ICTR;
		__IO std::uint32_t	ACTLR;
	};
private:
	static inline volatile SCS_t* get_ptr() { return (reinterpret_cast<SCS_t*>(SCS_BASE)); }
public:
	/*Interrupt Controller Type Register*/
	class ICTR
	{
	private:
		union ICTR_t
		{
			struct
			{
				std::uint32_t INTLINESNUM    :  4;	/* Total number of interrupt lines in groups of 32 */
				std::uint32_t                : 28;
			} bt;
			uint32_t dw;
		};
	public:
		ICTR_t value;

		enum class EOffsets: std::uint32_t
		{
			INTLINESNUM_OFFSET     = 0,
		};
		enum class EFields: std::uint32_t
		{
			INTLINESNUM_FIELD      = 0x0000000fU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(INTLINESNUM),
		};
		static inline std::uint32_t get() { return (get_ptr()->ICTR); }
		inline void read() { value.dw = get_ptr()->ICTR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ICTR = set_value; }
		inline void write() { get_ptr()->ICTR = value.dw; }
		static inline std::uint32_t get_INTLINESNUM() { return (reinterpret_cast<volatile ICTR_t*>(SCS_BASE + offsetof(SCS_t, ICTR))->bt.INTLINESNUM); }
		static inline void set_INTLINESNUM(std::uint32_t value) { reinterpret_cast<volatile ICTR_t*>(SCS_BASE + offsetof(SCS_t, ICTR))->bt.INTLINESNUM = value & static_cast<std::uint32_t>(EFields::INTLINESNUM_FIELD); }
	};
	/*Auxiliary Control Register*/
	class ACTLR
	{
	private:
		union ACTLR_t
		{
			struct
			{
				std::uint32_t DISMCYCINT     :  1;	/* Disables interrupt of multi-cycle instructions */
				std::uint32_t DISDEFWBUF     :  1;	/* This bit only affects write buffers implemented in the Cortex-M4 processor */
				std::uint32_t DISFOLD        :  1;	/* Disables dual-issue functionality */
				std::uint32_t                : 29;
			} bt;
			uint32_t dw;
		};
	public:
		ACTLR_t value;

		enum class EOffsets: std::uint32_t
		{
			DISMCYCINT_OFFSET      = 0,
			DISDEFWBUF_OFFSET      = 1,
			DISFOLD_OFFSET         = 2,
		};
		enum class EFields: std::uint32_t
		{
			DISMCYCINT_FIELD       = 0x00000001U,
			DISDEFWBUF_FIELD       = 0x00000001U,
			DISFOLD_FIELD          = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(DISMCYCINT),
			FIELD_MSK(DISDEFWBUF),
			FIELD_MSK(DISFOLD),
		};
		static inline std::uint32_t get() { return (get_ptr()->ACTLR); }
		inline void read() { value.dw = get_ptr()->ACTLR; }
		static inline void set(std::uint32_t set_value) { get_ptr()->ACTLR = set_value; }
		inline void write() { get_ptr()->ACTLR = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->ACTLR |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->ACTLR &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->ACTLR & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
};

#define SCS_ICTR_INTLINESNUM
#define SCS_ACTLR_DISMCYCINT
#define SCS_ACTLR_DISDEFWBUF
#define SCS_ACTLR_DISFOLD
#pragma endregion SCS

#pragma region SYSTICK
/* System Tick Timer (SysTick) */
class SYSTICK
{
public:
	struct SYSTICK_t
	{
		__IO std::uint32_t	CTRL;
		__IO std::uint32_t	LOAD;
		__IO std::uint32_t	VAL;
		__IO std::uint32_t	CALIB;
	};
private:
	static inline volatile SYSTICK_t* get_ptr() { return (reinterpret_cast<SYSTICK_t*>(SYSTICK_BASE)); }
public:
	/*SysTick Control and Status Register*/
	class CTRL
	{
	private:
		union CTRL_t
		{
			struct
			{
				std::uint32_t ENABLE         :  1;	/* Enables the counter */
				std::uint32_t TICKINT        :  1;	/* Enables SysTick exception request */
				std::uint32_t CLKSOURCE      :  1;	/* Indicates the clock source */
				std::uint32_t                : 13;
				std::uint32_t COUNTFLAG      :  1;	/* Returns 1 if timer counted to 0 since last time this was read */
				std::uint32_t                : 15;
			} bt;
			uint32_t dw;
		};
	public:
		CTRL_t value;

		enum class EOffsets: std::uint32_t
		{
			ENABLE_OFFSET          = 0,
			TICKINT_OFFSET         = 1,
			CLKSOURCE_OFFSET       = 2,
			COUNTFLAG_OFFSET       = 16,
		};
		enum class EFields: std::uint32_t
		{
			ENABLE_FIELD           = 0x00000001U,
			TICKINT_FIELD          = 0x00000001U,
			CLKSOURCE_FIELD        = 0x00000001U,
			COUNTFLAG_FIELD        = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ENABLE),
			FIELD_MSK(TICKINT),
			FIELD_MSK(CLKSOURCE),
			FIELD_MSK(COUNTFLAG),
		};
		static inline std::uint32_t get() { return (get_ptr()->CTRL); }
		inline void read() { value.dw = get_ptr()->CTRL; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CTRL = set_value; }
		inline void write() { get_ptr()->CTRL = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->CTRL |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->CTRL &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->CTRL & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
	};
	/*SysTick Reload Value Register*/
	class LOAD
	{
	private:
		union LOAD_t
		{
			struct
			{
				std::uint32_t RELOAD         : 24;	/* Value to load into the SYST_CVR register when the counter is enabled and when it reaches 0 */
				std::uint32_t                :  8;
			} bt;
			uint32_t dw;
		};
	public:
		LOAD_t value;

		enum class EOffsets: std::uint32_t
		{
			RELOAD_OFFSET          = 0,
		};
		enum class EFields: std::uint32_t
		{
			RELOAD_FIELD           = 0x00ffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(RELOAD),
		};
		static inline std::uint32_t get() { return (get_ptr()->LOAD); }
		inline void read() { value.dw = get_ptr()->LOAD; }
		static inline void set(std::uint32_t set_value) { get_ptr()->LOAD = set_value; }
		inline void write() { get_ptr()->LOAD = value.dw; }
		static inline std::uint32_t get_RELOAD() { return (reinterpret_cast<volatile LOAD_t*>(SYSTICK_BASE + offsetof(SYSTICK_t, LOAD))->bt.RELOAD); }
		static inline void set_RELOAD(std::uint32_t value) { reinterpret_cast<volatile LOAD_t*>(SYSTICK_BASE + offsetof(SYSTICK_t, LOAD))->bt.RELOAD = value & static_cast<std::uint32_t>(EFields::RELOAD_FIELD); }
	};
	/*SysTick current value register*/
	class VAL
	{
	private:
		union VAL_t
		{
			struct
			{
				std::uint32_t CURRENT        : 24;	/* Reads return the current value of the SysTick counter */
				std::uint32_t                :  8;
			} bt;
			uint32_t dw;
		};
	public:
		VAL_t value;

		enum class EOffsets: std::uint32_t
		{
			CURRENT_OFFSET         = 0,
		};
		enum class EFields: std::uint32_t
		{
			CURRENT_FIELD          = 0x00ffffffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(CURRENT),
		};
		static inline std::uint32_t get() { return (get_ptr()->VAL); }
		inline void read() { value.dw = get_ptr()->VAL; }
		static inline void set(std::uint32_t set_value) { get_ptr()->VAL = set_value; }
		inline void write() { get_ptr()->VAL = value.dw; }
		static inline std::uint32_t get_CURRENT() { return (reinterpret_cast<volatile VAL_t*>(SYSTICK_BASE + offsetof(SYSTICK_t, VAL))->bt.CURRENT); }
		static inline void set_CURRENT(std::uint32_t value) { reinterpret_cast<volatile VAL_t*>(SYSTICK_BASE + offsetof(SYSTICK_t, VAL))->bt.CURRENT = value & static_cast<std::uint32_t>(EFields::CURRENT_FIELD); }
	};
	/*SysTick calibration value register*/
	class CALIB
	{
	private:
		union CALIB_t
		{
			struct
			{
				std::uint32_t TENMS          : 24;	/* Reload value for 10ms (100Hz) timing, subject to system clock skew errors */
				std::uint32_t                :  6;
				std::uint32_t SKEW           :  1;	/* Indicates whether the TENMS value is exact */
				std::uint32_t NOREF          :  1;	/* Indicates whether the device provides a reference clock to the processor */
			} bt;
			uint32_t dw;
		};
	public:
		CALIB_t value;

		enum class EOffsets: std::uint32_t
		{
			TENMS_OFFSET           = 0,
			SKEW_OFFSET            = 30,
			NOREF_OFFSET           = 31,
		};
		enum class EFields: std::uint32_t
		{
			TENMS_FIELD            = 0x00ffffffU,
			SKEW_FIELD             = 0x00000001U,
			NOREF_FIELD            = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(TENMS),
			FIELD_MSK(SKEW),
			FIELD_MSK(NOREF),
		};
		static inline std::uint32_t get() { return (get_ptr()->CALIB); }
		inline void read() { value.dw = get_ptr()->CALIB; }
		static inline void set(std::uint32_t set_value) { get_ptr()->CALIB = set_value; }
		inline void write() { get_ptr()->CALIB = value.dw; }
		template <EMasks ... flags>
		static inline void set_flags()
		{
			get_ptr()->CALIB |= SetBits<static_cast<std::uint32_t>(flags)...>();
		}
		template <EMasks ... flags>
		static inline void clear_flags()
		{
			get_ptr()->CALIB &= ~(SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		template <EMasks ... flags>
		static inline bool get_flags()
		{
			return (get_ptr()->CALIB & SetBits<static_cast<std::uint32_t>(flags)...>());
		}
		static inline std::uint32_t get_TENMS() { return (reinterpret_cast<volatile CALIB_t*>(SYSTICK_BASE + offsetof(SYSTICK_t, CALIB))->bt.TENMS); }
		static inline void set_TENMS(std::uint32_t value) { reinterpret_cast<volatile CALIB_t*>(SYSTICK_BASE + offsetof(SYSTICK_t, CALIB))->bt.TENMS = value & static_cast<std::uint32_t>(EFields::TENMS_FIELD); }
	};
};

#define SYSTICK_CTRL_ENABLE
#define SYSTICK_CTRL_TICKINT
#define SYSTICK_CTRL_CLKSOURCE
#define SYSTICK_CTRL_COUNTFLAG
#define SYSTICK_LOAD_RELOAD
#define SYSTICK_VAL_CURRENT
#define SYSTICK_CALIB_TENMS
#define SYSTICK_CALIB_SKEW
#define SYSTICK_CALIB_NOREF
#pragma endregion SYSTICK

#pragma region XPSR
/* Program status register */
class XPSR
{
public:
	struct XPSR_t
	{
		__IO std::uint32_t	APSR;
		__I  std::uint32_t	IPSR;
		__I  std::uint32_t	xPSR;
	};
private:
public:
	/*Application program status register*/
	class APSR
	{
	private:
		union APSR_t
		{
			struct
			{
				std::uint32_t                : 27;
				std::uint32_t Q              :  1;	/* DSP overflow and saturation flag */
				std::uint32_t V              :  1;	/* Overflow flag */
				std::uint32_t C              :  1;	/* Carry or borrow flag */
				std::uint32_t Z              :  1;	/* Zero flag */
				std::uint32_t N              :  1;	/* Negative flag */
			} bt;
			uint32_t dw;
		};
	public:
		APSR_t value;

		enum class EOffsets: std::uint32_t
		{
			Q_OFFSET               = 27,
			V_OFFSET               = 28,
			C_OFFSET               = 29,
			Z_OFFSET               = 30,
			N_OFFSET               = 31,
		};
		enum class EFields: std::uint32_t
		{
			Q_FIELD                = 0x00000001U,
			V_FIELD                = 0x00000001U,
			C_FIELD                = 0x00000001U,
			Z_FIELD                = 0x00000001U,
			N_FIELD                = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(Q),
			FIELD_MSK(V),
			FIELD_MSK(C),
			FIELD_MSK(Z),
			FIELD_MSK(N),
		};
		static inline std::uint32_t get() { return (CORTEX::get_APSR()); }
		inline void read() { value.dw = CORTEX::get_APSR(); }
		static inline void set(std::uint32_t set_value) { CORTEX::set_APSR(set_value); }
		inline void write() { CORTEX::set_APSR(value.dw); }
	};
	/*Interrupt program status register*/
	class IPSR
	{
	private:
		union IPSR_t
		{
			struct
			{
				std::uint32_t ISR_NUMBER     :  9;	/* This is the number of the current exception */
				std::uint32_t                : 23;
			} bt;
			uint32_t dw;
		};
	public:
		IPSR_t value;

		enum class EOffsets: std::uint32_t
		{
			ISR_NUMBER_OFFSET      = 0,
		};
		enum class EFields: std::uint32_t
		{
			ISR_NUMBER_FIELD       = 0x000001ffU,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ISR_NUMBER),
		};
		static inline std::uint32_t get() { return (CORTEX::get_IPSR()); }
		inline void read() { value.dw = CORTEX::get_IPSR(); }
	};
	/*Execution program status register*/
	class xPSR
	{
	private:
		union xPSR_t
		{
			struct
			{
				std::uint32_t                : 10;
				std::uint32_t ICI_IT_1       :  6;	/* Interruptible-continuable instruction bits OR Indicates the execution state bits of the IT instruction */
				std::uint32_t                :  8;
				std::uint32_t T              :  1;	/* Thumb state bit */
				std::uint32_t ICI_IT_2       :  2;	/* Interruptible-continuable instruction bits OR Indicates the execution state bits of the IT instruction */
				std::uint32_t Q              :  1;	/* DSP overflow and saturation flag */
				std::uint32_t V              :  1;	/* Overflow flag */
				std::uint32_t C              :  1;	/* Carry or borrow flag */
				std::uint32_t Z              :  1;	/* Zero flag */
				std::uint32_t N              :  1;	/* Negative flag */
			} bt;
			uint32_t dw;
		};
	public:
		xPSR_t value;

		enum class EOffsets: std::uint32_t
		{
			ICI_IT_1_OFFSET        = 10,
			T_OFFSET               = 24,
			ICI_IT_2_OFFSET        = 25,
			Q_OFFSET               = 27,
			V_OFFSET               = 28,
			C_OFFSET               = 29,
			Z_OFFSET               = 30,
			N_OFFSET               = 31,
		};
		enum class EFields: std::uint32_t
		{
			ICI_IT_1_FIELD         = 0x0000003fU,
			T_FIELD                = 0x00000001U,
			ICI_IT_2_FIELD         = 0x00000003U,
			Q_FIELD                = 0x00000001U,
			V_FIELD                = 0x00000001U,
			C_FIELD                = 0x00000001U,
			Z_FIELD                = 0x00000001U,
			N_FIELD                = 0x00000001U,
		};
		enum class EMasks: std::uint32_t
		{
			FIELD_MSK(ICI_IT_1),
			FIELD_MSK(T),
			FIELD_MSK(ICI_IT_2),
			FIELD_MSK(Q),
			FIELD_MSK(V),
			FIELD_MSK(C),
			FIELD_MSK(Z),
			FIELD_MSK(N),
		};
		static inline std::uint32_t get() { return (CORTEX::get_xPSR()); }
		inline void read() { value.dw = CORTEX::get_xPSR(); }
	};
};

#define XPSR_APSR_Q
#define XPSR_APSR_V
#define XPSR_APSR_C
#define XPSR_APSR_Z
#define XPSR_APSR_N
#define XPSR_IPSR_ISR_NUMBER
#define XPSR_xPSR_ICI_IT_1
#define XPSR_xPSR_T
#define XPSR_xPSR_ICI_IT_2
#define XPSR_xPSR_Q
#define XPSR_xPSR_V
#define XPSR_xPSR_C
#define XPSR_xPSR_Z
#define XPSR_xPSR_N
#pragma endregion XPSR

}

#include "core_cm3_funcs.h"

