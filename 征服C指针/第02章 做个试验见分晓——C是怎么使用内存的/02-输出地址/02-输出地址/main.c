//
//  main.c
//  02-输出地址
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// 声明一个全局变量
int  global_variable;

// 声明一个文件内的静态变量
static int file_static_variable;

// 演示函数
void func1(void) {
    
    // 声明一个局部变量
    int func1_variable;
    
    // 声明一个函数内部的静态变量
    static int func1_static_variable;
    
    printf("局部变量func1_variable的地址是: %p\n", &func1_variable);
    printf("函数内部的静态变量func1_static_variable的地址是: %p\n", &func1_static_variable);
}

// 演示函数
void func2(void) {
    
    // 声明一个局部变量
    int func2_variable;
    
    printf("局部变量func2_variable在内存中的地址是: %p\n", &func2_variable);
}

int main(int argc, const char * argv[]) {
    
    // 声明一个指向int类型变量的指针p
    int *p;
    
    // 输出函数的地址(或者说输出指向函数的指针)。在C语言中，和数组名
    // 表示指向数组的指针一样，函数名同样表示指向函数的指针
    printf("函数func1的内存地址是: %p\n", func1);  // 输出指向函数func1的指针
    printf("函数func2的内存地址是: %p\n", func2);  // 输出指向函数func2的指针
    
    printf("\n");
    
    // 输出字符串常量"enrica"在内存中的地址。注意，在C语言中，
    // 字符串是作为char类型的数组来表示的。
    printf("字符串常量\"enrica\"在内存中的地址是: %p\n", "enrica");
    
    printf("\n");
    
    // 输出全局变量global_variable的地址
    printf("全局变量global_variable在内存中的地址是: %p\n", &global_variable);
    
    printf("\n");
    
    // 输出文件内静态变量file_static_variable的地址
    printf("文件内静态变量file_static_variable在内存中的地址是: %p\n", &file_static_variable);
    
    printf("\n");
    
    // 调用函数，输出函数内部局部变量和静态局部变量的地址
    func1();
    func2();
    
    printf("\n");
    
    // 通过函数malloc分配内存地址
    p = malloc(sizeof(int));
    printf("通过malloc函数分配的内存地址是: %p\n", p);
    
    return 0;
}
