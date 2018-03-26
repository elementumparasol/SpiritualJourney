//
//  main.c
//  0307-不相等运算符
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入两个整数，判断它们是否相等
 */

int main(void) {
    
    int a, b;
    
    puts("请依次输入两个整数。");
    printf("请输入第一个整数: ");   scanf("%d", &a);
    printf("请输入第二个整数: ");   scanf("%d", &b);
    
    // 和0306中==表示判定是否相等对应，!=表示判断是否不相等
    if (a != b) {
        printf("整数%d和%d是不相等的。\n", a, b);
    } else {
        printf("整数%d和%d是相等的。\n", a, b);
    }
    
    return 0;
}
