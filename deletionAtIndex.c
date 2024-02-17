// Program to implement Data structure array deletion operation at specific index
#include <stdio.h>
#include <conio.h>

void display(int arr[], int n)
    // Array Traversal
{
    //Looping through array elements and printing them
    for (int i=0; i<n; i++)
    {
        printf("%d\n",arr[i]);
    }
}

// Function for deletion of array element at specific index
void indexDeletion(int arr[], int size, int index)
{
// code for deletion operation
for (int i=index; i<size-1; i++)
{
    arr[i] = arr[i+1];
}
printf("Element at index %d has been deleted successfully\n", index);
}

int main()
{
    int arr[100] = {7,8,12,27,88};
    int size=5, index=2;
    display(arr, size);
    indexDeletion(arr, size, index);
    size -= 1;
    printf("New array after deletion operation\n");
    display(arr, size);
    return 0;
}
