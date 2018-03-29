//
//  main.c
//  0602-计算三个数中最大的值
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 求三个数中的最大值
 */

int maxValue(int a, int b, int c) {  // Go语言 func maxValue(a, b, c int) int {...}
    
    // 假设a是最大的一个
    int max = a;
    
    // 计算三个数中最大的一个
    if (b > max)
        max = b;
    if (c > max)
        max = c;
    
    return max;
}

int main(void) {
    
    int a, b, c;
    
    puts("请依次输入三个整数。");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    printf("第三个整数: ");  scanf("%d", &c);
    
    // 调用maxValue函数，计算最大整数
    printf("上面三个数中，最大的一位是: %d\n", maxValue(a, b, c));
    
    return 0;
}
