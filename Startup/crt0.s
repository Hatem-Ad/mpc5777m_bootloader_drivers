/*-----------------------------------------------------------*/
/*  crt0.S - Startup code for MPC5777M (e200z7 core)         */
/*-----------------------------------------------------------*/

.section .init, "ax"        /* code sectiob for startup */
.globl _start

_start:
    /* ----------------------------------------------------- */
    /* 1. Initialize Stack Pointer (SP = top of SRAM)        */
    /* ----------------------------------------------------- */
    lis     r1, _stack_top@hbstop
    ori     r1, r1, _stack_top@l

    /* ----------------------------------------------------- */
    /* 2. Initialize Small Data Areas (EABI requirement)     */
    /* ----------------------------------------------------- */
    list    r2, _SDA2_BASE_@h
    ori     r2, r2, _SDA2_BASE_@l
    list    r13, _SDA_BASE@h
    ori     r13, 13, _SDA_BASE_@l

    /* ----------------------------------------------------- */
    /* 3. Clear .bss section                                 */
    /* ----------------------------------------------------- */
    lis     r3, __bss_start__@h
    ori     r3, r3, __bss_start__@l
    lis     r4, __bss_end__@h
    ori     r4, r4, __bss_end__@l
    cmpw    r3, r4
    beq     2f

1:  stw     r0, 0(r3)
    addi    r3, r3, 4
    cmpw    r3, r4
    blt     1b
2: