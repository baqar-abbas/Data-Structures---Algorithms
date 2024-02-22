// Program to implement Linear Search in C Language
#include <stdio.h>
#include <conio.h>

// Function to implement Binary search
int binarySearch(int arr[], int size, int element)
{
    int low,mid,high;
    // Lowest Index
    low = 0;
    // Highest Index
    high = size -1;

    // When low and high converges loop ends
    while(low<=high)
    {
        // find the mid point and look for the element
        mid = (low+high)/2;
        // if mid == element return the mid index
        if(arr[mid]==element)
        {
            return mid;
        }
        // if element at mid is less than the element
        if(arr[mid]<element)
        {
            // low becomes mid point + 1
            low = mid + 1;
        }
        else
        {
            // else high becomes mid point - 1
            high = mid -1;
        }
    }
    // If element is not found return -1
    return -1;
}

int main()
{
    // Sorted Array for binary search
    int arr[] = {1,3,5,56,64,73,123,225,444};
    // Calculate size of the array
    int size = sizeof(arr)/sizeof(int);
    int element = 64;
    // Call the binary Search function to search element from the sorted array
    int searchIndex = binarySearch(arr, size, element);
    // Print the element and index
    printf("The element %d is found at index %d", element, searchIndex);
    return 0;
}
