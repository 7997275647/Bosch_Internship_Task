default: build/firmware.elf

build/main.o: src/main.c
	@mkdir -p build
	riscv-none-elf-gcc -c -g -O0 -ffreestanding -march=rv32i -mabi=ilp32 -o build/main.o src/main.c

build/startup.o: src/startup.S
	@mkdir -p build
	riscv-none-elf-as -g -march=rv32i -mabi=ilp32 -o build/startup.o src/startup.S

build/firmware.elf: build/main.o build/startup.o linker/riscv.ld
	riscv-none-elf-ld -T linker/riscv.ld -m elf32lriscv -o build/firmware.elf build/main.o build/startup.o

clean:
	rm -f build/main.o build/startup.o build/firmware.elf


