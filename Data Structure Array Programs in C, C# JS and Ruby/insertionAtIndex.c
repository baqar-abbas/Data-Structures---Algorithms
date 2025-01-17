// Program to insert an element at a specific index in an array
#include <stdio.h>
#include <conio.h>

void display(int arr[],int n)
// Array Traversal
{
//Looping through array elements and printing them
for(int i=0; i<n; i++)
{
    printf("%d\n",arr[i]);
}
}
// Insertion in Array at specific index
int indexInsertion(int arr[],int size,int element,int capacity,int index)
{
// if array is full return -1
if(size>=capacity)
{
    return -1;
}
// Insert the array at specific index. Pushing the elements after specified index to the next array locations
for(int i=size-1; i>=index; i--)
{
    arr[i+1]=arr[i];
}
// insert the element at specific index
arr[index] = element;
// return 1 for successful insertion
return 1;
}

int main()
{
int arr[100] = {7,8,12,27,88};
int size = 5, element =45, index=3;
display(arr, size);
indexInsertion(arr, size, element, 100, index);
// Increment the size after insertion
size += 1;
display(arr,size);
return 0;
}
