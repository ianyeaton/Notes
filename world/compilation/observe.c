#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Preprocessor: conditional compilation
#define VERSION 1
#define DEBUG

// Initialized global - will appear in .data section
int global_initialized = 42;

// Uninitialized global - will appear in .bss section
int global_uninitialized;

// String literal - will appear in .rodata section
const char* greeting = "Hello from rodata";

// A simple struct
typedef struct {
    int x;
    int y;
} Point;

// Static local - persists across calls, lives in .data/.bss
void counter(void) {
    static int count = 0;
    count++;
    printf("Called %d times\n", count);
}

// Demonstrates stack allocation
void stack_demo(void) {
    int stack_var = 100;
    int arr[5] = {1, 2, 3, 4, 5};
    printf("Stack var: %d, arr[2]: %d\n", stack_var, arr[2]);
}

// Demonstrates heap allocation
void heap_demo(void) {
    int* ptr = malloc(5 * sizeof(int));
    if (ptr == NULL) {
        fprintf(stderr, "malloc failed\n");
        return;
    }
    for (int i = 0; i < 5; i++) {
        ptr[i] = i * 10;
    }
    printf("Heap value: %d\n", ptr[3]);
    free(ptr);
    ptr = NULL;
}

// Demonstrates conditional compilation
void version_info(void) {
#ifdef DEBUG
    printf("Debug build\n");
#endif

#if VERSION == 1
    printf("Version 1\n");
#elif VERSION == 2
    printf("Version 2\n");
#else
    printf("Unknown version\n");
#endif
}

int main(void) {
    printf("%s\n", greeting);
    printf("Global initialized: %d\n", global_initialized);
    printf("Global uninitialized: %d\n", global_uninitialized);

    counter();
    counter();
    counter();

    stack_demo();
    heap_demo();
    version_info();

    Point p;
    p.x = 10;
    p.y = 20;
    printf("Point: %d, %d\n", p.x, p.y);

    return 0;
}
