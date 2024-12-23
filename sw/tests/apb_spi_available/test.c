#include "mem.h"
#include "sc_print.h"

#define APB_SPI_BASE 0xF0000000

int main()
{
    uint32_t val;
    val = READ_MEMORY(APB_SPI_BASE + 0x0C, 16);
    sc_printf("APB_SPI read at %p: 0x%x", APB_SPI_BASE, val);
    val = READ_MEMORY(APB_SPI_BASE + 0x10, 16);
    sc_printf("APB_SPI read at %p: 0x%x", APB_SPI_BASE, val);
    // for (int i = 0; i < 32; ++i){
    //     val = READ_MEMORY(APB_SPI_BASE + i * 32, 32);
    //     sc_printf("APB_SPI read at %p: 0x%x", APB_SPI_BASE, val);
    // }

    // for (int i = 0; i < 32; ++i){
    //     WRITE_MEMORY(APB_SPI_BASE + i * 32, 32, i);
    // }

    // for (int i = 0; i < 32; ++i){
    //     val = READ_MEMORY(APB_SPI_BASE + i * 32, 32);
    //     sc_printf("APB_SPI read at %p: 0x%x", APB_SPI_BASE, val);
    // }
    
    return 0;
}
