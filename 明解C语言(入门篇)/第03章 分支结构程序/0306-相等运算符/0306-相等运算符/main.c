//
//  main.c
//  0306-相等运算符
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
    
    // 在计算机编程中，通常情况下，==才表示判断两个数是否相等；
    // 而=是用来进行赋值操作的，不能依照数学经验将其弄混淆
    if (a == b) {
        printf("整数%d和%d是相等的。\n", a, b);
    } else {
        printf("整数%d和%d是不相等的。\n", a, b);
    }
    
    return 0;
}
