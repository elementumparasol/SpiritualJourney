//
//  main.c
//  0311-计算较大值
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入两个整数，计算它们中较大的值
 */

int main(void) {
    
    int a, b;
    
    puts("请依次输入两个整数.");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 在if-else分支语句中，如果每一个分支语句只有一条，
    // 那么紧跟在分支后面的花括号可以省略，有多条则不可以
    if (a > b)
        printf("整数%d的值比整数34%d的值大。\n", a, b);
    else
        printf("整数%d的值比整数%d的值小。\n", a, b);
    
    return 0;
}
