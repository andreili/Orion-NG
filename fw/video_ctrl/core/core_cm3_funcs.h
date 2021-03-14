#pragma once

#if defined (__VFP_FP__) && !defined(__SOFTFP__)
	#if defined (__FPU_PRESENT) && (__FPU_PRESENT == 1U)
		#define __FPU_USED       1U
	#else
		#error "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESENT)"
		#define __FPU_USED       0U
	#endif
#else
	#define __FPU_USED         0U
#endif

namespace CORTEX
{

    #define NVIC_USER_IRQ_OFFSET          16
    #define MPU_TYPE_RALIASES             4U

    static inline std::uint32_t CTZ(std::uint32_t value)
    {
        std::uint32_t c = __CLZ(value & -value);
        return (value ? (31 - c) : c);
    }

    class SCBex
    {
    public:
        class SHPR
        {
            struct SCB_t
            {
                __I  std::uint32_t	CPUID;
                __IO std::uint32_t	ICSR;
                __IO std::uint32_t	VTOR;
                __IO std::uint32_t	AIRCR;
                __IO std::uint32_t	SCR;
                __IO std::uint32_t	CCR;
                __IO std::uint8_t	SHPR[12];
            };
        public:
            enum class EPriority: std::uint32_t
            {
                MEM_MANAGE = 0,
                BUS_FAULT = 1,
                USAGE_FAULT = 2,
                SV_CALL = 7,
                PEND_SV = 10,
                SYS_TICK = 11,
            };
            static std::uint32_t get(EPriority prior) { return (reinterpret_cast<SCB_t*>(SCB_BASE)->SHPR[static_cast<std::uint32_t>(prior)]); }
            static void set(EPriority prior, std::uint32_t priority) { reinterpret_cast<SCB_t*>(SCB_BASE)->SHPR[static_cast<std::uint32_t>(prior)] = priority & 0xff; }
        };
    };

    class NVIC
    {
    private:
        typedef struct
        {
            __IOM std::uint32_t		 ISER[8];  /*!< Offset: 0x000 (R/W)  Interrupt Set Enable Register */
                std::uint32_t RESERVED0[24];
            __IOM std::uint32_t		 ICER[8];  /*!< Offset: 0x080 (R/W)  Interrupt Clear Enable Register */
                std::uint32_t RESERVED1[24];
            __IOM std::uint32_t		 ISPR[8];  /*!< Offset: 0x100 (R/W)  Interrupt Set Pending Register */
                std::uint32_t RESERVED2[24];
            __IOM std::uint32_t		 ICPR[8];  /*!< Offset: 0x180 (R/W)  Interrupt Clear Pending Register */
                std::uint32_t RESERVED3[24];
            __IOM std::uint32_t		 IABR[8];  /*!< Offset: 0x200 (R/W)  Interrupt Active bit Register */
                std::uint32_t RESERVED4[56];
            __IOM std::uint8_t		   IP[240];/*!< Offset: 0x300 (R/W)  Interrupt Priority Register (8Bit wide) */
                std::uint32_t RESERVED5[644];
            __IOM std::uint32_t		 STIR;     /*!< Offset: 0xE00 ( /W)  Software Trigger Interrupt Register */
        } NVIC_t;
    public:
        class ISER
        {
        public:
            static inline void set(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISER[val >> 5] = (1 << (val & 0x1f)); }
            static inline void clear(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISER[val >> 5] &= ~(1 << (val & 0x1f)); }
            static inline bool get(std::uint32_t val) { return (reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISER[val >> 5] & (1 << (val & 0x1f))); }
            static inline void set_value(std::uint32_t idx, std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISER[idx] = val; }
        };
        class ICER
        {
        public:
            static inline void set(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICER[val >> 5] = (1 << (val & 0x1f)); }
            static inline void clear(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICER[val >> 5] &= ~(1 << (val & 0x1f)); }
            static inline bool get(std::uint32_t val) { return (reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICER[val >> 5] & (1 << (val & 0x1f))); }
            static inline void set_value(std::uint32_t idx, std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICER[idx] = val; }
        };
        class ISPR
        {
        public:
            static inline void set(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISPR[val >> 5] = (1 << (val & 0x1f)); }
            static inline void clear(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISPR[val >> 5] &= ~(1 << (val & 0x1f)); }
            static inline bool get(std::uint32_t val) { return (reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISPR[val >> 5] & (1 << (val & 0x1f))); }
            static inline void set_value(std::uint32_t idx, std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ISPR[idx] = val; }
        };
        class ICPR
        {
        public:
            static inline void set(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICPR[val >> 5] = (1 << (val & 0x1f)); }
            static inline void clear(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICPR[val >> 5] &= ~(1 << (val & 0x1f)); }
            static inline bool get(std::uint32_t val) { return (reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICPR[val >> 5] & (1 << (val & 0x1f))); }
            static inline void set_value(std::uint32_t idx, std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->ICPR[idx] = val; }
        };
        class IABR
        {
        public:
            static inline void set(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->IABR[val >> 5] = (1 << (val & 0x1f)); }
            static inline void clear(std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->IABR[val >> 5] &= ~(1 << (val & 0x1f)); }
            static inline bool get(std::uint32_t val) { return (reinterpret_cast<NVIC_t*>(NVIC_BASE)->IABR[val >> 5] & (1 << (val & 0x1f))); }
            static inline void set_value(std::uint32_t idx, std::uint32_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->IABR[idx] = val; }
        };
        class IP
        {
        public:
            static inline void set(std::uint32_t idx, std::uint8_t val) { reinterpret_cast<NVIC_t*>(NVIC_BASE)->IP[idx] = val; }
            static inline std::uint8_t get(std::uint32_t idx) { return (reinterpret_cast<NVIC_t*>(NVIC_BASE)->IP[idx]); }
        };
        class STIR
        {
        private:
        public:
            union STIR_t
            {
                struct
                {
                    std::uint32_t INTID		:  9;
                    std::uint32_t           : 22;
                } bt;
                std::uint32_t dw;
            };
            enum class EOffsets: std::uint32_t
            {
                INTID_OFFSET           = 0,
            };
            enum class EFields: std::uint32_t
            {
                INTID_FIELD            = 0x000001ffU,
            };
            enum class EMasks: std::uint32_t
            {
                INTID                  = (static_cast<std::uint32_t>(EFields::INTID_FIELD) << static_cast<std::uint32_t>(EOffsets::INTID_OFFSET)),
            };
        };

        enum class EPriorityGroup: std::uint32_t
        {
            GROUP_0 = 7, /*!< 0 bits for pre-emption priority
                            4 bits for subpriority */
            GROUP_1 = 6, /*!< 1 bits for pre-emption priority
                            3 bits for subpriority */
            GROUP_2 = 5, /*!< 2 bits for pre-emption priority
                            2 bits for subpriority */
            GROUP_3 = 4, /*!< 3 bits for pre-emption priority
                            1 bits for subpriority */
            GROUP_4 = 3, /*!< 4 bits for pre-emption priority
                            0 bits for subpriority */
        };

        static inline void enable_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { ISER::set(IRQn); } }
        static inline void disable_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { ISER::set(IRQn); } }
        static inline void disable_all_IRQs()
        {
            ICER::set_value(0, 0xFFFFFFFF);
            ICER::set_value(1, 0xFFFFFFFF);
            ICER::set_value(2, 0xFFFFFFFF);
            ICER::set_value(3, 0xFFFFFFFF);
            ICER::set_value(4, 0xFFFFFFFF);
        }
        static inline bool get_enable_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { return (ISER::get(IRQn)); } else { return (false); } }
        static inline void get_disable_IRQ(std::int32_t IRQn)
        {
            if (IRQn > 0 )
            {
                ICER::set(IRQn);
                DSB();
                ISB();
            }
        }
        static inline bool get_pending_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { return (ISPR::get(IRQn)); } else { return (false); } }
        static inline void set_pending_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { ISPR::set(IRQn); } }
        static void clear_all_pending_IRQs()
        {
            ICPR::set_value(0, 0xFFFFFFFF);
            ICPR::set_value(1, 0xFFFFFFFF);
            ICPR::set_value(2, 0xFFFFFFFF);
            ICPR::set_value(3, 0xFFFFFFFF);
            ICPR::set_value(4, 0xFFFFFFFF);
        }
        static inline bool clear_pending_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { return (ICPR::get(IRQn)); } else { return (false); } }
        static inline bool get_active_IRQ(std::int32_t IRQn) { if (IRQn > 0 ) { return (IABR::get(IRQn)); } else { return (false); } }
        static inline std::uint32_t encode_priority(std::uint32_t group, std::uint32_t preempt, std::uint32_t sub)
        {
            std::uint32_t PriorityGroupTmp = (group & (std::uint32_t)0x07UL);   /* only values 0..7 are used          */
            std::uint32_t PreemptPriorityBits;
            std::uint32_t SubPriorityBits;
            PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (std::uint32_t)(__NVIC_PRIO_BITS)) ? (std::uint32_t)(__NVIC_PRIO_BITS) : (std::uint32_t)(7UL - PriorityGroupTmp);
            SubPriorityBits     = ((PriorityGroupTmp + (std::uint32_t)(__NVIC_PRIO_BITS)) < (std::uint32_t)7UL) ? (std::uint32_t)0UL : (std::uint32_t)((PriorityGroupTmp - 7UL) + (std::uint32_t)(__NVIC_PRIO_BITS));
            return (
                ((preempt & (std::uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
                ((sub     & (std::uint32_t)((1UL << (SubPriorityBits    )) - 1UL)))
            );
        }
        static inline void decode_priority(std::uint32_t Priority, std::uint32_t PriorityGroup, std::uint32_t &PreemptPriority, std::uint32_t &SubPriority)
        {
            uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);   /* only values 0..7 are used          */
            uint32_t PreemptPriorityBits;
            uint32_t SubPriorityBits;
            PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(__NVIC_PRIO_BITS)) ? (uint32_t)(__NVIC_PRIO_BITS) : (uint32_t)(7UL - PriorityGroupTmp);
            SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(__NVIC_PRIO_BITS)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(__NVIC_PRIO_BITS));
            PreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
            SubPriority     = (Priority                   ) & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL);
        }
        static inline void set_priority(std::int32_t IRQn, std::uint32_t priority)
        {
            if (IRQn >= 0)
            {
                NVIC::IP::set(IRQn, static_cast<uint8_t>((priority << (8U - __NVIC_PRIO_BITS)) & 0xFFUL));
            }
            else
            {
                SCBex::SHPR::set(static_cast<SCBex::SHPR::EPriority>((IRQn & 0xFUL)-4UL), (priority << (8U - __NVIC_PRIO_BITS)) & (uint32_t)0xFFUL);
            }
        }
        static inline std::uint32_t get_priority(std::int32_t IRQn)
        {
            if (IRQn >= 0)
            {
                return (NVIC::IP::get(IRQn) >> (8U - __NVIC_PRIO_BITS));
            }
            else
            {
                return (SCBex::SHPR::get(static_cast<SCBex::SHPR::EPriority>((IRQn & 0xFUL)-4UL)) >> (8U - __NVIC_PRIO_BITS));
            }
        }
        static inline void enable_and_set_prior_IRQ(std::int32_t IRQn, std::uint32_t preempt, std::uint32_t sub)
        {
            set_priority(IRQn, encode_priority(get_priority_grouping(), preempt, sub));
            enable_IRQ(IRQn);
        }
        static inline void set_vector(std::int32_t IRQn, std::uint32_t vector)
        {
            std::uint32_t *vectors = reinterpret_cast<uint32_t*>(SCB::VTOR::get());
            vectors[IRQn + NVIC_USER_IRQ_OFFSET] = vector;
        }
        static inline std::uint32_t get_vector(std::int32_t IRQn)
        {
            std::uint32_t *vectors = reinterpret_cast<uint32_t*>(SCB::VTOR::get());
            return (vectors[IRQn + NVIC_USER_IRQ_OFFSET]);
        }
        static inline void set_priority_grouping(EPriorityGroup PriorityGroup)
        {
            SCB::AIRCR aircr;
            aircr.read();
            aircr.value.bt.VECTKEY = 0x5FAUL;
            aircr.value.bt.PRIGROUP = (static_cast<std::uint32_t>(PriorityGroup) & (uint32_t)0x07UL);                    /* only values 0..7 are used          */
            aircr.write();
        }
        static inline std::uint32_t get_priority_grouping()
        {
            return (SCB::AIRCR::get_PRIGROUP());
        }
        __NO_RETURN static inline void system_reset()
        {
            DSB();

            SCB::AIRCR aircr;
            aircr.read();
            aircr.value.bt.VECTKEY = 0x5FAUL;
            aircr.value.bt.SYSRESETREQ = true;
            aircr.write();

            DSB();
            /* wait until reset */
            for(;;)
            {
                NOP();
            }
        }
    };

    static inline void SysTick_config(std::uint32_t ticks)
    {
        SYSTICK::LOAD::set(ticks - 1);
        NVIC::set_priority(SysTick_IRQn, (1 << __NVIC_PRIO_BITS) - 1);
        SYSTICK::VAL::set(0);
        SYSTICK::CTRL::set_flags<SYSTICK::CTRL::EMasks::CLKSOURCE,
                                SYSTICK::CTRL::EMasks::TICKINT,
                                SYSTICK::CTRL::EMasks::ENABLE>();
    }

}
