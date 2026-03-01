#include <string.h>
#include <stdlib.h>
#include <stdio.h>

// This lesson is predicated and focused on structs as a method to creating data types in C such as linked lists
// Notes:
/*
- A struct is a way of grouping together related variables of different types (int, float, string, etc.) under one "name".
- It is essentially a blueprint for a custom data type.
- For example, a "person" data type would have fields such as "name" (string), "age" (int), "height" (float), "race" (string), etc.
*/

// Basic person struct:

/*
struct Person {
  char name[100];
  int age;
  float height;
};
*/

// instances of the basic version would be written as such:

/*
struct Person p;
p.age = 25;
p.height 6.3;
*/

// To avoid having to use the "struct" keyword prior to defining an object, use the "typedef" keyword in the definition:

/*
typedef struct {
  char name[100];
  int age;
  float height;
} Person;
*/

/*
Person p;
p.age = 24;
*/

// When you have a pointer to a struct, you cannot just use the dot notation directly
// You either have to dereference the pointer first then use the dot notation, or use the arrow ("->") operator
// EX:
// Person* p = malloc(sizeof(Person));
// (*p).age = 25;
// or
// p->age = 25;

// Claude AI example - Define a typedef struct representing a Car with at least three fields of different types. Then dynamically allocate one on the heap, assign values to its fields using ->, print them, and free it properly.

typedef struct {
  char* brand;
  float weight;
  int numberOfDoors;
} Car;

int main(void) {
  Car* ptr = malloc(sizeof(Car));
  if (ptr == NULL) { printf("Unsuccessful memory allocation for the Car struct, please try again later."); }
  else {
    size_t len = strlen("Volkswagen") + 1;
    ptr->brand = malloc(len);
    if (ptr->brand == NULL) { 
      printf("Unsuccessful memory allocation for the brand string field, please try later.");
      free(ptr);
      ptr = NULL;
    }
    else {
      strncpy(ptr->brand, "Volkswagen", len - 1);
      ptr->brand[len - 1] = '\0';
      ptr->weight = 2500.5;
      ptr->numberOfDoors = 2;
      printf("This is a Car struct that I made. It has the following fields:\nBrand: %s\nWeight: %f\nNumber of Doors: %i\n", ptr->brand, ptr->weight, ptr->numberOfDoors);
      free(ptr->brand);
      ptr->brand = NULL;
      free(ptr);
      ptr = NULL;
    }
  }
  return 0;
}
