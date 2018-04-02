//
//  main.c
//  0809-字符
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算标准输入流中出现数字字符数
 */

#include <stdio.h>

int main(void) {
    
    int i, ch;
    int c[10] = {0};
    
    printf("请输入一串数字(Ctl + D结束): ");
    
    while ((ch = getchar()) != EOF) {
        if (ch > '0' && ch < '9') {
            c[ch - '0']++;
        }
    }
    
    puts("数字字符出现的次数: ");
    for (i = 0; i < 10; i++) {
        printf("'%d': %d\n", i, c[i]);
    }
    
    return 0;
}
