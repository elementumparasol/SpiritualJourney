//
//  main.c
//  0605-值传递
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算幂
 */

#include <stdio.h>

/**
 * 返回x的n幂
 */
double power(double x, int n) {
    
    double tmp = 1.0;
    
    for (int i = 1; i <= n; i++) {
        tmp *= x;
    }
    
    return tmp;
}

int main(void) {
    
    double a;
    int b;
    
    printf("求a的b次幂。\n");
    printf("实数a: ");    scanf("%lf", &a);
    printf("幂指数b: ");   scanf("%d", &b);
    
    // 调用函数power求幂
    printf("%.2f的%d次幂是: %.2f\n", a, b, power(a, b));
    
    return 0;
}

/**
 * 在上面的代码第39行，调用函数power(), 将实参a, b分别传给形参x, n
 * 像这种直接通过值来传递的机制被称之为值传递(pass by value)
 */
