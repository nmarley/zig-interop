#include <cstdio>
#include "add.h"

int main(void) {
    int32_t a, b;

    a = 7;
    b = 5;

    int32_t result = add(a, b);
    printf("The result of %d + %d is %d\n", a, b, result);
}
