//
//  main.c
//  0606-没有返回值的函数
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示出一个直角在左下方的等腰直角三角形
 */

#include <stdio.h>

/**
 * 连续显示出n个*
 */
void putStars(int n) {
    
    while (n-- > 0) {
        putchar('*');
    }
}

int main(void) {
    
    int i, len;
    
    printf("生成一个直角在左下方的等腰直角三角形。\n");
    printf("短边: ");
    scanf("%d", &len);
    
    for (i = 0; i <= len; i++) {
        putStars(i);
        putchar('\n');
    }
    
    return 0;
}
