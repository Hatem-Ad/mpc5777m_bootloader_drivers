#include "bl_main.h"

void Bootloader_Init()
{
    /*  init clock, uart, gpio, flash */
    BL_CLOCK_init();
    BL_GPIO_init_all();
    BL_UART_init();
    BL_FLASH_init();
}

void Bootloader_Config()
{

}

void Bootloader_JumpToApp()
{
    
}

void Bootloader_Run()
{
    
    Bootloader_Config();
    Bootloader_JumpToApp();

}


int main(void)
{
    Bootloader_Init();
    Bootloader_Run();

    while (1) {
        /* Should never exit */
    }
}
