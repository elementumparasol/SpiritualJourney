//
//  main.c
//  0412-使用for循环实现固定次数的循环
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个整数，连续显示出与该整数值等量的*
 */

int main(void) {
    
    int num;
    
    printf("请输入一个正整数: ");
    scanf("%d", &num);
    
    for (int i = 0; i <= num; i++) {
        putchar('*');
    }
    putchar('\n');
    
    return 0;
}
