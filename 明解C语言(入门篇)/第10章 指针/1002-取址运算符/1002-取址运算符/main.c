//
//  main.c
//  1002-取址运算符
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示对象的地址
 */

#include <stdio.h>

int main(void) {
    
    int n;
    double x;
    int a[3];
    
    // 取址运算符&是单目运算符，它通常写在对象名前面，
    // 用来获取该对象的地址，eg: &a就是用来获取a的
    // 地址，并且生成指向a的指针
    printf("n的地址是: %p\n", &n);
    printf("x的地址是: %p\n", &x);
    printf("a[0]的地址是: %p\n", &a[0]);
    printf("a[1]的地址是: %p\n", &a[1]);
    printf("a[2]的地址是: %p\n", &a[2]);
    
    return 0;
}
