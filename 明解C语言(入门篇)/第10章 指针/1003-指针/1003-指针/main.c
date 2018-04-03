//
//  main.c
//  1003-指针
//
//  Created by Enrica on 2018/4/4.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 通过指针间接的操作数据
 */

#include <stdio.h>

int main(void) {
    
    int james = 213;
    int anthony = 203;
    int wade = 193;
    
    // 定义指针
    int *jp, *ap;  // 声明了两个指向int型变量的指针变量
    
    // 将指针指向变量
    jp = &james;
    ap = &anthony;
    
    // 通过指针获取指向变量的数据
    printf("James的身高是: %d\n", *jp);  // 在指针变量前面加上指针运算符(*)，就可以获取该指针变量指向的内容
    printf("Anthony的身高是: %d\n", *ap);
    
    // 将指针jp指向Wade
    jp = &wade;
    
    // 修改指针ap所指向变量的值
    *ap = 213;
    
    printf("Wade的身高是: %d\n", *jp);
    printf("Anthony的身高修改之后的值是: %d\n", *ap);
    
    return 0;
}

/**
 * "int型变量" 和 "指向int型变量的指针变量"的区别
 *  (1)、int型变量，它相当于是用来保存整数的盒子(即，直接保存变量本身)；
 *  (2)、指向int型变量的指针变量，它相当于是保存整数地址的盒子(即保存变量的地址)。
 * 当指针p的值就是对象a的地址时(即，指针p保存了变量a的地址)，一般会说指针p指向变量a
 */
