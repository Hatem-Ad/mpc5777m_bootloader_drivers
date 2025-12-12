#ifndef BL_CONFIG_H
#define BL_CONFIG_H

#include <stdint.h>

/* ================================
 * Flash layout (EDIT THESE)
 * ================================ */
#define BL_FLASH_BASE        (0x00F80000UL)
#define BL_FLASH_SIZE        (256UL * 1024UL)

/* Put your APP just after bootloader by default */
#define APP_FLASH_BASE       (BL_FLASH_BASE + BL_FLASH_SIZE)

/* Application entry point = start of App image ( _start placed at APP_FLASH_BASE ) */
#define APP_ENTRY_ADDR       (APP_FLASH_BASE)

#endif /* BL_CONFIG_H */
