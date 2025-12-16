/* ======================================================= */
/*  vectors.S — minimal IVOR vector table for MPC5777M     */
/* ======================================================= */

    .section .vectors, "ax"
    .align 16

    /* IVOR0 — Critical Input */
IVOR0_Handler:
    b IVOR0_Handler     /* infinite loop */

    /* IVOR2 — Data Storage */
IVOR2_Handler:
    b IVOR2_Handler

/* IVOR3 — Instruction Storage */
IVOR3_Handler:
    b IVOR3_Handler

/* IVOR4 — External Input Interrupt */
IVOR4_Handler:
    b IVOR4_Handler

/* IVOR5 — Alignment */
IVOR5_Handler:
    b IVOR5_Handler

/* IVOR6 — Program Exception */
IVOR6_Handler:
    b IVOR6_Handler

/* IVOR7 — Floating Point Exception */
IVOR7_Handler:
    b IVOR7_Handler

/* ... ... */
