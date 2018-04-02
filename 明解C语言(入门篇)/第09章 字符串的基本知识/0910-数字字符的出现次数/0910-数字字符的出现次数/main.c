//
//  main.c
//  0910-数字字符的出现次数
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算字符串中的数字字符数
 */

#include <stdio.h>

/**
 * 将字符串s中的数字字符保存至数组c中
 */
void str_dcount(const char s[], int c[]) {
    
    int i = 0;
    while (s[i]) {
        if (s[i] >= '0' && s[i] <= '9') {
            c[s[i] - '0']++;
        }
        i++;
    }
}

int main(void) {
    
    int i;
    int dc[10] = {0};
    char str[128];
    
    printf("请输入字符串: ");
    scanf("%s", str);
    
    str_dcount(str, dc);
    
    puts("数字字符出现的次数: ");
    for (i = 0; i < 10; i++) {
        printf("'%d': %d\n", i, dc[i]);
    }
    
    return 0;
}
