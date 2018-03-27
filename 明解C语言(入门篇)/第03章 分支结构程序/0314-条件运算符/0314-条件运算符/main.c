//
//  main.c
//  0314-条件运算符
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 使用条件运算符(三目运算符)计算两个数中最大的一个
 */

int main(void) {
    
    int a, b, max;
    
    puts("请依次输入两个整数。");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 如果a > b成立，那么就将a的值赋给max，否则就将b的值赋给max
    max = (a > b) ? a: b;
    
    printf("整数%d和%d这两个数中，较大的一个是: %d\n", a, b, max);
    
    return 0;
}
