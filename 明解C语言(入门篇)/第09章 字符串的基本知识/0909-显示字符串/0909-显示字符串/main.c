//
//  main.c
//  0909-显示字符串
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 遍历字符串儿并显示
 */

#include <stdio.h>

/**
 * 显示字符串s
 */
void put_string(const char s[]) {
    
    int i = 0;
    while (s[i]) {
        putchar(s[i++]);
    }
}

int main(void) {
    
    char str[128];
    
    printf("请输入字符串: ");
    scanf("%s", str);
    
    printf("你输入了字符串: ");
    
    // 调用put_string函数，显示字符串
    put_string(str);
    putchar('\n');
    
    return 0;
}
