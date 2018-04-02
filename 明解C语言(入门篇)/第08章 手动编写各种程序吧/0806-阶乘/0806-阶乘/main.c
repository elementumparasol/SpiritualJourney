//
//  main.c
//  0806-阶乘
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算阶乘
 */

#include <stdio.h>

/**
 * 返回阶乘的值
 */
int factorial(int n) {
    if (n > 0) {
        return n * factorial(n - 1);
    } else {
        return 1;
    }
}

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 调用factorial函数，计算它的阶乘
    printf("%d的阶乘是: %d\n", num, factorial(num));
    
    return 0;
}
