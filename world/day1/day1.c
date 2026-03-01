#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int* integer_function(int a) {
  int* ptr = malloc(sizeof(int));
  if (ptr == NULL) { return NULL; } //always check!
  *ptr = a;
  return ptr;
}

int main(int argc, char *argv[]) {
  printf("%lu\n", strlen(*argv));
  if (argc > 0) {
    for (int i = 0; i < argc; i++) {
      printf("Arg %i: %s\n", i, argv[i]);
      printf("Spelled out: ");
      for (int j = 0; j < (int)strlen(argv[i]); j++) {
        printf("%c ", argv[i][j]);
      }
      printf("\n");
    }
    printf("\n");
  }
  printf("Hello World\n");
  int* example = integer_function(argc);
  printf("%i\n", *example);
  free(example);
  example = NULL;
  int test_arr[3] = {1, 2, 3};
  printf("%i\n", *(test_arr + 1) + 10); // should print "12"
  
  // ClaudeAI examples below

  //#1:
  int* i = malloc(sizeof(int));
  if (i == NULL) { printf("Failed to allocate memory - skipping this example. Please try again later.\n"); }
  else {
    *i = 6;
    printf("%i\n", *i);
    free(i);
    i = NULL;
  }

  //#2:
  int length = 5;
  int* arr = calloc(length, sizeof(int));
  if (arr == NULL) { printf("Failed to allocate memory - skipping this example. Please try again later.\n"); }
  else {
    for (int k = 0; k < length; k++) {
      printf("%i ", arr[k]);
    }
    printf("\n");
    *arr = 1; *(arr + 1) = 2; *(arr + 2) = 3; *(arr + 3) = 4; *(arr+4) = 5;
    for (int k = 0; k < length; k++) { 
      printf("%i ", arr[k]);
    }
    printf("\n");
    free(arr);
    arr = NULL;
  }
  
  //#3:
  int new_length = 3;
  int* third = malloc(new_length * sizeof(int));
  if ( third == NULL ) { printf("Failed to allocate memory - skipping this example. Please try again later.\n");  }
  else {
    *third = 10; *(third+1) = 11; *(third+2) = 12;
    printf("Printing the %i integer array as it was initially malloc-ed: %i %i %i\n", new_length, *third, *(third+1), *(third+2));
    new_length = new_length + 3;
    printf("Realloc-ing the array to have %i integers...\n", new_length);
    int* tmp = realloc(third, new_length * sizeof(int));
    if (tmp == NULL) { 
      printf("Realloc call failed, please try to rerun the program again.\n");
      free(third);
      third = NULL;
    }
    else { 
      third = tmp;
      *(third+ 3)= 13; *(third + 4) = 14; *(third + 5) = 15;
      printf("Printing the %i integer array as it was realloc-ed and had new values written to the last three spots of the array: %i %i %i %i %i %i\n", new_length, *third, *(third + 1), *(third + 2), *(third + 3), *(third + 4), *(third+5));
      free(third);
      third = NULL;
    }
  }
  return 0;
}
