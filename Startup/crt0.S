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