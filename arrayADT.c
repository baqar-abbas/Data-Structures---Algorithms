// Purpose: Implementing array ADT using structure in C
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

//declare a structure for implementing array ADT
struct myArray {
int total_size;
int used_size;
int *ptr;
};

void createArray(struct myArray * a, int tSize, int uSize)
{
  //  (*a).total_size = tSize;
  //  (*a).used_size = uSize;
   // (*a).ptr = (int *) malloc(tSize*sizeof(int));
   // or
   a->total_size = tSize;
   a->used_size = uSize;
   a->ptr = (int *) malloc(tSize*sizeof(int));
}

//show values of array
void show(struct myArray * a)
{
    for (int i = 0; i < a->used_size; i++)
    {
        printf("The values of used elements %d: \n", (a->ptr)[i]);
    }
}

//set values of array
void setVal(struct myArray * a)
{
    for (int i = 0; i < a->used_size; i++)
    {
        int n;
        printf("Enter element %d: ", i);
        scanf("%d", &n);
        (a->ptr)[i] = n;
    }
}

int main()
{
    // Create an instance of myArray structure
    struct myArray marks;
    createArray(&marks, 10, 3);
    printf("We are running setval now\n");
    setVal(&marks);
    printf("We are running show now\n");
    show(&marks);

    // Free the dynamically allocated memory before exiting the program
    free(marks.ptr);

    return 0;
}
