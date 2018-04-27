//
//  main.c
//  01-基本递归
//
//  Created by Enrica on 2018/4/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

// 一个简单的递归函数，计算整数n的阶乘
int fact(int n) {
    
    if (n < 0)
        return 0;
    else if (n == 0)
        return 1;
    else if (n == 1)
        return 1;
    else
        return n * fact(n - 1);
}

int main(int argc, const char * argv[]) {
    
    int n = 0;
    printf("请输入一个整数: ");
    scanf("%d", &n);
    
    // 计算输入整数的阶乘
    printf("%d的阶乘为: %d\n", n, fact(n));
    
    return 0;
}
