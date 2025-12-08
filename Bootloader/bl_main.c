#include "bl_main.h"

void Bootloader_Init()
{

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
