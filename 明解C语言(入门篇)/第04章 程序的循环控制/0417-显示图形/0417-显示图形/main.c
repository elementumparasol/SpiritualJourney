//
//  main.c
//  0417-显示图形
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 画一个长方形
 */

int main(void) {
    
    int i, j;
    int width, height;
    
    puts("下面来画一个长方形。");
    printf("高: ");  scanf("%d", &height);
    printf("宽: ");  scanf("%d", &width);
    
    for (i = 1; i <= height; i++) {
        for (j = 1; j <= width; j++) {
            putchar('*');
        }
        putchar('\n');
    }
    
    return 0;
}
