/* App.ld — MPC5777M (e200z4) — bare-metal */

/* =========[ ENTRY ]========= */
ENTRY(_start)

/* =========[ MEMORY MAP ]========= */

MEMORY
{
  FLASH (rx)  : ORIGIN = 0x, LENGTH = K
  SRAM  (rwx) : ORIGIN = 0x, LENGTH = K
}