#include "bl_jump.h"
#include "bl_config.h"

/* Simple validity check:
 * - first word at APP entry is not erased (0xFFFFFFFF) and not 0x00000000
 */
uint8_t BL_IsValidApp(void)
{
    volatile uint32_t first = *(volatile uint32_t *)(APP_ENTRY_ADDR);

    if ((first == 0xFFFFFFFFUL) || (first == 0x00000000UL)) {
        return 0U;
    }
    return 1U;
}

static inline void BL_DisableInterrupts(void)
{
    /* Clear MSR[EE] (External Interrupt Enable) */
    __asm__ volatile(
        "mfmsr  r3        \n"
        "li     r4, 0x8000\n"   /* EE bit mask */
        "andc   r3, r3, r4\n"
        "mtmsr  r3        \n"
        "isync            \n"
        :
        :
        : "r3", "r4", "memory"
    );
}

static inline void BL_SetIVPR(uint32_t base)
{
    /* IVPR = SPR 63 on Book-E */
    __asm__ volatile(
        "mtspr  63, %0 \n"
        "isync         \n"
        :
        : "r"(base)
        : "memory"
    );
}

void BL_JumpToApp(void)
{
    if (BL_IsValidApp() == 0U) {
        while (1) { /* stay in boot */ }
    }

    BL_DisableInterrupts();

    /* Optional but recommended: set vector base to App (if App has its own IVOR table in flash) */
    BL_SetIVPR(APP_FLASH_BASE);

    /* Jump */
    __asm__ volatile(
        "mtctr  %0 \n"
        "bctr      \n"
        :
        : "r"(APP_ENTRY_ADDR)
        : "memory"
    );

    while (1) { /* never reached */ }
}
