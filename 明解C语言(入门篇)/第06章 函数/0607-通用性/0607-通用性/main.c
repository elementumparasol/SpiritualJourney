//
//  main.c
//  0607-通用性
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/*
 * 显示直角在右边的等腰三角形
 */

#include <stdio.h>

/**
 * 连续显示n个ch
 */
void putStars(int ch, int n) {
    while (n-- > 0) {
        putchar(ch);
    }
}

int main(void) {
    
    int i, len;
    
    printf("生成一个直角在右下方的等腰直角三角形。\n");
    printf("短边: ");
    scanf("%d", &len);
    
    for (i = 0; i <= len; i++) {
        putStars(' ', len - i);  // 输出空格
        putStars('*', i);  // 输出*
        putchar('\n');
    }
    
    return 0;
}
