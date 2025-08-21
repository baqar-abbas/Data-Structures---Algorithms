// Recusion Program in C Language to Find the factorial of a number

#include <stdio.h>
#include <conio.h>

int factorial(int n);

int main(void) {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);

    int result = factorial(num);
    printf("Factorial of %d = %d\n", num, result);

    return 0;
}

int factorial(int n) {

    if (n == 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
