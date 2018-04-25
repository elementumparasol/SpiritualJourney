//
//  main.c
//  02-数组和指针
//
//  Created by Enrica on 2018/4/25.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在表达式中，数组名(数组标识符)通常会被解读为指向
 * 数组第一个元素的指针。
 */

#include <stdio.h>

// 数组引用
int array() {
    
    // 声明一个包含10个元素的int类型的数组，以及一个指向int类型的指针
    int a[10], *iptr;
    
    // 将指针变量iptr指向数组a的第一个元素
    iptr = a;
    
    // 给数组a的第一个元素赋值
    iptr[0] = 5;
    
    return 0;
}

// 指针引用
int pointer() {
    
    int a[10], *iptr;
    iptr = a;  // 此时，数组名表示数组中第一个元素的地址
    
    // 给指针iptr指向的变量赋值
    *iptr = 5;
    
    return 0;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
