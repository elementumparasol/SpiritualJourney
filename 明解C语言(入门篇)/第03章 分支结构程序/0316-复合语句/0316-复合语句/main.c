//
//  main.c
//  0316-复合语句
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 计算所输入的两个整数中较大的数和较小的数，并且分别显示它们
 */

int main(void) {
    
    int a, b, max, min;
    
    puts("请依次输入两个整数.");
    printf("第一个整数是: ");  scanf("%d", &a);
    printf("第二个整数是: ");  scanf("%d", &b);
    
    // 计较整数a和b的大小
    if (a > b) {
        max = a;
        min = b;
    } else {
        max = b;
        min = a;
    }
    
    // 输出其中较大的数和较小的数
    printf("整数%d和%d中较大的一个数是: %d\n", a, b, max);
    printf("整数%d和%d中较小的一个数是: %d\n", a, b, min);
    
    return 0;
}
