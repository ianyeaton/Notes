#!/bin/bash

# Stage 1 - Preprocessor output
gcc -E observe.c -o observe.i
# Open observe.i - notice how massive it is, all headers pasted in
# Find where your actual code starts at the bottom
# Notice DEBUG and VERSION macros are gone, replaced with their effects

# Stage 2 - Assembly output  
#gcc -S observe.c -o observe.s
gcc -S -masm=intel observe.c -o observe.s
# Open observe.s - you'll see .text, .data, .rodata sections
# Find the labels for main, counter, heap_demo etc.
# See how the string "Hello from rodata" appears in .rodata

# Stage 3 - Object file
gcc -c observe.c -o observe.o
# Inspect the symbol table
# Look for T (defined in text), U (undefined), D (data), B (bss)
# printf should show as U - undefined, to be resolved by linker

# Stage 4 - Final executable
gcc -g -Wall -Wextra observe.c -o observe
