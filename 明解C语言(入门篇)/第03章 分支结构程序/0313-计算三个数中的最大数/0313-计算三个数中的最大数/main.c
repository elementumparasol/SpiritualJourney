//
//  main.c
//  0313-计算三个数中的最大数
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 计算所输入的三个整数中的最大值并将其显示
 */

int main(void) {
    
    int a, b, c, max;
    
    puts("请依次输入三个整数.");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    printf("第三个整数: ");  scanf("%d", &c);
    
    // 先假设整数a是最大的数
    max = a;
    
    // 再依次比较max和b，以及max和c的大小
    if (b > max) max = b;
    if (c > max) max = c;
    
    // 最后显示最大的整数
    printf("%d、%d、%d这三个整数中，最大的是: %d\n", a, b, c, max);
    
    return 0;
}
