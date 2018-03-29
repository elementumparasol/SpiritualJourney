//
//  main.c
//  0603-计算两个整数的平方差
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 计算两个整数的平方值
 */
int sqr(int a) {  // Go语言：func sqr(a int) int { ... }
    
    return a * a;
}

/**
 * 计算两个整数的差值
 */
int diff(int a, int b) {
    
    // 如果a > b成立，则返回a - b；否则，返回b - a
    return (a > b ? a - b : b - a);
}

int main(void) {
    
    int a, b;
    
    puts("请依次输入两个整数的值。");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 计算a、b这两个数的平方的差
    printf("整数a和b的平方的差为: %d\n", diff(sqr(a), sqr(b)));
    
    return 0;
}
