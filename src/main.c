/* Minimal RISC-V Bare-Metal "Hello World" */

#include <stdint.h>

/* Magic address for console output */
#define CONSOLE_ADDR 0x90000000

typedef struct
{
    volatile uint32_t data;
} console_t;

static volatile console_t *console = (console_t *)CONSOLE_ADDR;

/* Write single character to console */
void putchar(char c)
{
    console->data = (uint32_t)c;
}

/* Write null-terminated string */
void puts(const char *str)
{
    while (*str)
    {
        putchar(*str++);
    }
}

/* Main entry point */
void main(void)
{
    puts("hello\n");

    /* Loop forever */
    while (1)
        ;
}
