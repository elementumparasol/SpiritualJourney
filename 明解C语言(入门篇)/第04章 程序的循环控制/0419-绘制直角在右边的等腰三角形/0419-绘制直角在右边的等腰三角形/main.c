//
//  main.c
//  0419-绘制直角在右边的等腰三角形
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 绘制直角在右边的等腰三角形
 */

int main(void) {
    
    int len;
    
    puts("生成直角在左下角的等腰直角三角形。");
    printf("直角的长度: ");
    scanf("%d", &len);
    
    for (int i = 1; i <= len; i++) {
        for (int j = 0; j <= len - i; j++) {
            putchar(' ');
        }
        
        for (int j = 1; j <= i; j++) {
            putchar('*');
        }
        puts("\n");
    }
    
    return 0;
}
