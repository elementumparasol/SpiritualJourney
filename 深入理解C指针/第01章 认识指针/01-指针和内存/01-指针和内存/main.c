//
//  main.c
//  01-指针和内存
//
//  Created by Enrica on 2018/4/18.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * C程序在编译后，会以三种形式使用内存:
 *  (1)、静态或者全局内存
 *      静态声明的变量，其内存分配会在这里，全局变量的内存也分配在这里。这些变量在程序开始
 *      运行时分配，直到程序终止时才会消失。
 *  (2)、自动内存(又称局部内存，由系统自动管理)
 *      主要是用来存放函数内部定义的变量，其生命周期限制在函数的执行时间之内。
 *  (3)、动态内存(由程序员手动管理)
 *      这部分的内存分配在堆上(主要是指程序员手动分配)，并且直到手动释放时才会消失。
 */

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
