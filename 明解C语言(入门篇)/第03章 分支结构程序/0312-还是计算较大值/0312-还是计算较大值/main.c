//
//  main.c
//  0312-还是计算较大值
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入两个整数，计算它们中较大的值
 */

int main(void) {
    
    int a, b, max;
    
    puts("请依次输入两个整数.");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 先做比较，然后将较大的数保存在max变量中
    if (a > b) max = a; else max = b;
    
    printf("整数%d和%d之间较大的数是%d。\n", a, b, max);
    
    return 0;
}
