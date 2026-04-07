# RISC-V Bare-Metal Hello World - Quick Start

Minimal bare-metal firmware for RISC-V that prints "hello" to a memory-mapped console.

## Setup

Install RISC-V toolchain:
```bash
sudo apt-get install gcc-riscv64-unknown-elf
```

## Build

```bash
make              # Build firmware.elf
make clean        # Clean build artifacts
```

## Project Files

- `src/startup.S` - Startup code (stack init, jump to main)
- `src/main.c` - Application (hello world to console)
- `linker/riscv.ld` - Memory layout
- `Makefile` - Build rules

## How It Works

1. CPU starts at 0x00000000 (startup.S)
2. Stack pointer initialized
3. Jump to main()
4. main() writes "hello\n" to address 0x90000000
5. Infinite loop

## RTL Integration

In your Verilog testbench, monitor the console address:

```verilog
always @(*) begin
    if (mem_write_en && mem_addr == 32'h90000000) begin
        $display("%c", mem_write_data[7:0]);
    end
end
```

Load `build/firmware.elf` into your simulator's instruction memory.



