# Minimal RISC-V Startup Code
# Initializes stack pointer and branches to main()

.section .text._start
.global _start

_start:
    la  sp, __stack_top     # Load stack pointer to top
    add s0, sp, zero        # Set frame pointer
    jal zero, main          # Jump to main (no return)
    
loop:
    j   loop                # Infinite loop (if main returns)


.section .data
.space 1024*8               # Allocate 8KB for stack
.align 16                   # 16-byte alignment
__stack_top:                # Stack top (grows downward)
