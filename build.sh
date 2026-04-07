#!/bin/bash
# Build script for RISC-V Bare-Metal Hello World project

set -e  # Exit on any error

echo "RISC-V Bare-Metal Build Script"

# Check if cross-compiler is installed
if ! command -v riscv-none-elf-gcc &> /dev/null; then
    echo "ERROR: riscv-none-elf-gcc not found"
    echo "Install with: sudo apt-get install gcc-riscv64-unknown-elf"
    exit 1
fi

echo "[1/3] Checking toolchain..."
echo "  GCC: $(riscv-none-elf-gcc --version | head -1)"
echo "  AS:  $(riscv-none-elf-as --version | head -1)"
echo "  LD:  $(riscv-none-elf-ld --version | head -1)"
echo ""

echo "[2/3] Building..."
make
echo ""

echo "[3/3] Build artifacts:"
if [ -f build/firmware.elf ]; then
    SIZE=$(ls -lh build/firmware.elf | awk '{print $5}')
    echo "  ✓ build/firmware.elf ($SIZE)"
else
    echo "  ✗ build/firmware.elf NOT FOUND"
    exit 1
fi

if [ -f build/firmware.dump ]; then
    echo "  ✓ build/firmware.dump (disassembly)"
else
    echo "  ✗ build/firmware.dump NOT FOUND"
    exit 1
fi

echo "Build successful!"
