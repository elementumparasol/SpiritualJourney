//
//  main.c
//  0315-差值计算
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 使用条件运算符计算输入两个数的差值，并且将其显示出来
 */

int main(void) {
    
    int a, b;
    
    puts("请依次输入两个整数.");
    printf("第一个整数是: ");  scanf("%d", &a);
    printf("第二个整数是: ");  scanf("%d", &b);
    
    // 因为差值一般是用正数进行表示，因此需要对整数a和b的大小进行比较
    printf("整数%d和%d的差值是:%d\n", a, b, (a > b) ? (a - b): (b - a));
    
    return 0;
}
