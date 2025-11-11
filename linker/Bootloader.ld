/* Bootloader.ld — MPC5777M (e200z7) — bare-metal, no HAL */

/* =========[ MEMORY MAP ]========= */

MEMORY
{
  FLASH (rx)  : ORIGIN = 0x00F80000, LENGTH = 256K   /* Bootloader region in internal Flash */
  SRAM  (rwx) : ORIGIN = 0x40000000, LENGTH = 128K   /* Use a safe slice; resize later */
}

/* =========[ ENTRY ]========= */
ENTRY(_start)

/* =========[ SDA BASES for EABI ]========= */
_SDA_BASE_  = __sdata_start__;   /* r13 base (writable small data)   */
_SDA2_BASE_ = __sdata2_start__;  /* r2  base (RO small data/consts)  */

/* =========[ IVPR BASE ]========= */

__IVPR_BASE__ = 0x00000000;