//
//  main.c
//  0408-限定次数的循环操作
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个整数，然后连续输出和该整数等量的$
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    while (num-- > 0) {
        putchar('$');
    }
    putchar('\n');
    
    return 0;
}
