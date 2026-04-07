/* Minimal RISC-V Linker Script */

SECTIONS
{
    . = 0x00000000;         /* Start at address 0 for ROM */
    
    .text : {
        KEEP(*(.text._start))   /* Ensure _start is first */
        *(.text*)               /* Program code */
        *(.rodata*)             /* Read-only data */
    }
    
    . = ALIGN(4096);        /* Page align to separate text/data */
    
    .data : {
        *(.data*)               /* Initialized data (stack included) */
    }
}

