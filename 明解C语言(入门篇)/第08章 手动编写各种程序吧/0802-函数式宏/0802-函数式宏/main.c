//
//  main.c
//  0802-函数式宏
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 求整数的平方和浮点数的平方(使用函数式宏)
 */

#include <stdio.h>

#define sqr(x) ((x) * (x))

int main(void) {
    
    int x;
    double n;
    
    printf("请输入一个整数: ");
    scanf("%d", &x);
    printf("该数的平方值是: %d\n", sqr(x));
    
    printf("请输入一个实数: ");
    scanf("%lf", &n);
    printf("该数的平方值是: %lf\n", sqr(n));
    
    return 0;
}
