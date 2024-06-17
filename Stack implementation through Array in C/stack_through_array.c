// Implementation of stack through arrays in C Language

#include <stdio.h>
#include <conio.h>

int stack[10], i, choice=0,n, top=-1;
// Functions prototype declaration for stack operations
void push();
void pop();
void show();
int peek();

void main ()
{

    // Taking the number of elements in the stack as input
    printf("Enter the number of elements in the stack ");
    scanf("%d",&n);
    printf("*********Stack operations using array*********");

printf("\n----------------------------------------------\n");
    while(choice != 5)
    {
        printf("Chose one from the below options...\n");
        printf("\n1.Push\n2.Pop\n3.Show\n4.Peek\n5.Exit");
        printf("\n Enter your choice \n");
        scanf("%d",&choice);
        // Switch case for the stack operations
        switch(choice)
        {
            case 1:
            {
                push();
                break;
            }
            case 2:
            {
                pop();
                break;
            }
            case 3:
            {
                show();
                break;
            }
            case 4:
            {
                printf("%d\n",peek());

                break;
            }
            case 5:
            {
                printf("Exiting....");
                break;
            }
            default:
            {
                printf("Please Enter valid choice ");
            }
        };
    }
}

// Function definitions for stack operations for push, pop, show and peek
// Push function to insert elements in the stack
void push ()
{
    int val;
    // Condition to check if the stack is full
    // If stack is full, then it will show stack overflow
    if (top == n-1 )
    {
        printf("\n Stack Overflow \n");
    }
    // If stack is not full, then it will take the value to be 
    // inserted in the stack
    else
    {
        printf("Enter the value?");
        scanf("%d",&val);
        // Incrementing the top value and inserting the value in the stack
        top = top +1;
        stack[top] = val;
    }
}

// Pop function to delete/POP elements from the stack
void pop ()
{
    // Condition to check if the stack is empty
    // If stack is empty, then it will show stack underflow
    if(top == -1)
    printf("Stack Underflow");
    // If stack is not empty, then it will decrement the top value
    else
    top = top -1;
}
// Show function to display the elements in the stack
// It will display the elements in the stack from top to bottom
void show()
{
    for (i=top;i>=0;i--)
    {
        printf("%d\n",stack[i]);
    }
    // If there is no element in the stack, then it will show stack is empty
    if(top == -1)
    {
        printf("Stack is empty\n");
    }
}
// Peek function to display the top element of the stack
int peek()
{
    // If stack is empty, then it will show stack underflow
    if (top == -1)
    {
        printf("Underflow");
        return 0;
    }
    else
    {
        return stack [top];
    }
}

// Output:
/* 
Enter the number of elements in the stack 5
*********Stack operations using array*********
----------------------------------------------
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 1
Enter the value?1
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
1
Enter the value?2
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 1
Enter the value?3
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 // show the elements in the stack
 3
3
2
1
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 // show the top element of the stack (Peek)
 4
3
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 // pop the top element of the stack
 2
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 // show the elements after popping the top element
 3
2
1
Chose one from the below options...

1.Push
2.Pop
3.Show
4.Peek
5.Exit
 Enter your choice
 5
Exiting....
Process returned 5 (0x5)   execution time : 235.964 s
Press any key to continue.
*/