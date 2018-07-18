//
//  main.c
//  简单的四则运算
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * 定义函数实现加、减和乘操作，要求只能使用以下原子操作：
 * (1)、赋值操作: b = a;
 * (2)、自增操作: ++a;
 * (3)、for (; ;) {...};
 * (4)、操作数只能为0，或者正数
 */

#include <stdio.h>

// 计算a + b
int add(int a, int b) {
    
    // 以a为基数
    int result = a;
    
    // 然后再将b进行分解，利用循环逐一加到a上
    for (int i = 0; i < b; ++i) {
        ++result;
    }
    
    return  result;
}

// 计算n - 1
int decone(int n) {
    
    int tmp = 0;
    int result = 0;
    
    for (int i = 0; i < n; ++i) {
        result = tmp;
        ++tmp;
    }
    
    return  result;
}

// 计算a - b, 其中a >= b
int sub(int a, int b) {
    
    int result = a;
    
    for (int i = 0; i < b; ++i) {
        result = decone(result);
    }
    
    return result;
}

// 计算a * b
int mult(int a, int b) {
    
    int result = 0;
    
    for (int i = 0; i < a; ++i) {
        
        for (int j = 0; j < b; ++j) {
            ++result;
        }
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    
    int a = 9, b = 7;
    
    // 加法操作
    printf("%d + %d = %d\n", a, b, add(a, b));
    
    // 减法操作
    printf("%d - %d = %d\n", a, b, sub(a, b));
    
    // 乘法操作
    printf("%d * %d = %d\n", a, b, mult(a, b));
    
    return 0;
}
