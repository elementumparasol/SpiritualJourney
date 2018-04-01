//
//  main.c
//  0801-函数和数据类型
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 整数的平方和浮点数的平方(使用函数)
 */

#include <stdio.h>

/**
 * 求int整数的平方值
 */
int sqrt_int(int x) {
    return x * x;
}

/**
 * 求double型浮点数的平方值
 */
double sqrt_double(double x) {
    return x * x;
}

int main(void) {
    
    int n;
    double x;
    
    printf("请输入一个整数: ");
    scanf("%d", &n);
    printf("该数的平方值是: %d\n", sqrt_int(n));
    
    printf("请输入一个实数: ");
    scanf("%lf", &x);
    printf("该数的平方值是: %lf\n", sqrt_double(x));
    
    return 0;
}
