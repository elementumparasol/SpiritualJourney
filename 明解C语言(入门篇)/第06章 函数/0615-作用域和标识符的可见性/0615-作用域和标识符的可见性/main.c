//
//  main.c
//  0615-作用域和标识符的可见性
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 确认标识符的作用域
 */

#include <stdio.h>

int x = 75;  // 文件作用域

/**
 * 输入x的值
 */
void print_x(void) {
    printf("x = %d\n", x);  // 会用到文件作用域中定义的变量x，也就是75
}

int main(void) {
    
    int i;
    int x = 999;  // 块作用域
    
    // 调用print_x函数
    print_x();
    
    // 打印main函数中的变量x的值
    printf("x = %d\n", x);  // 只会用到main函数中定义的x，也就是999
    
    for (i = 0; i < 5; i++) {
        int x = i * 100;  // 块级作用域，只会用到for循环内部定义的x
        printf("x = %d\n", x);
    }
    
    printf("x = %d\n", x);  // 只会用到main函数中定义的x，也就是999
    
    return 0;
}

/**
 * 如果两个同名变量分别拥有文件作用域和块作用域，那么只有拥有块作用域的变量是可见的，
 * 而拥有文件作用域的变量是会被隐藏的。比如说，像上面，我们定义了一个值为75的文件作
 * 用域变量，然后又在main函数中定义了一个值为999的块级作用域变量999，由于这两个变
 * 量的名称相同，因此，当我们在main函数中使用变量x时，只会用到块级作用域变量x，不会
 * 用到文件作用于变量x。
 */
