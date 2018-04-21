//
//  main.c
//  03-函数调用
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

// 演示函数
void func(int a, int b) {
    
    // 声明局部变量
    int c, d;
    
    printf("在func函数中: \n");
    printf("形参a的地址为: %p\n", &a);
    printf("形参b的地址为: %p\n", &b);
    printf("局部变量c的地址为: %p\n", &c);
    printf("局部变量d的地址为: %p\n", &d);
}

int main(int argc, const char * argv[]) {
    
    // 声明局部变量
    int a, b;
    
    printf("在main函数中: \n");
    printf("局部变量a的地址为: %p\n", &a);
    printf("局部变量b的地址为: %p\n", &b);
    
    printf("\n");
    
    // 调用函数
    func(2, 3);
    
    return 0;
}

/**
 * 函数的调用是按照入栈和出栈进行的:
 *  (1)、入栈顺序: 首先是main函数入栈，然后再是func函数入栈；
 *  (2)、出栈顺序: 首先是栈顶函数func先出栈，然后再是main函数出栈。
 */
