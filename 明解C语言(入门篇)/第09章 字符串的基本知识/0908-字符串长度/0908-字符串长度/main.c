//
//  main.c
//  0908-字符串长度
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 判断字符串的长度
 */

#include <stdio.h>

/**
 * 返回字符串str的长度
 * - 参数s: 表示存放字符串的数组
 * - 返回值: 返回字符串的长度
 */
int str_lenght(const char s[]) {
    
    int len = 0;
    
    while (s[len]) {
        len++;
    }
    
    return len;
}

int main(void) {
    
    char str[128];
    
    printf("请输入一个字符串: ");
    scanf("%s", str);
    
    // 调用函数int_lenght计算字符串的长度
    printf("字符串\"%s\"的长度是: %d。\n", str, str_lenght(str));
    
    return 0;
}
