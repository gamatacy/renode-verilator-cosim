//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'LICENSE' file.
//
#include <verilated.h>
#include "Vapb_spi_top.h"
#include <bitset>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
#include "src/buses/axi.h"
#include "src/buses/apb3.h"
#include "src/renode.h"

RenodeAgent *apb_spi = nullptr;
Vapb_spi_top *top = new Vapb_spi_top;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
        main_time++;
        tfp->dump(main_time);
        tfp->flush();
#endif
    top->eval();
}

RenodeAgent *Init() {
    APB3* bus = new APB3();

    //=================================================
    // Init bus signals
    //=================================================
    bus->pclk = &top->HCLK;
    bus->prst = &top->HRESETn;
    bus->paddr = (uint8_t *)&top->PADDR;
    bus->psel = &top->PSEL;
    bus->penable = &top->PENABLE;
    bus->pwrite = &top->PWRITE;
    bus->pwdata = (uint32_t *)&top->PWDATA;
    bus->pready = &top->PREADY;
    bus->prdata = (uint32_t *)&top->PRDATA;

    //=================================================
    // Init eval function
    //=================================================
    bus->evaluateModel = &eval;

    //=================================================
    // Init peripheral
    //=================================================
    apb_spi = new RenodeAgent(bus);
    bus->setAgent(apb_spi);
    return apb_spi;
}

int main(int argc, char **argv, char **env) {
    if(argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort} [{address}]\n", argv[0]);
        exit(-1);
    }
    const char *address = argc < 4 ? "127.0.0.1" : argv[3];

    Verilated::commandArgs(argc, argv);
#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif
    Init();
    apb_spi->simulate(atoi(argv[1]), atoi(argv[2]), address);
    top->final();
    exit(0);
}
