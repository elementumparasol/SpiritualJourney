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
