//
//  main.c
//  0911-大小写字符转换
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 对字符串中的英文字符转为大写字母
 */

#include <stdio.h>
#include <ctype.h>

/**
 * 将字符串中的英文字符转换为大写字母
 */
void str_toupper(char s[]) {
    
    int i = 0;
    while (s[i]) {
        s[i] = toupper(s[i]);  // to upper是标准库函数
        i++;
    }
}

/**
 * 将字符串中的英文字符转换为小写字母
 */
void str_tolower(char s[]) {
    
    int i = 0;
    while (s[i]) {
        s[i] = tolower(s[i]);  // to lower是标准库函数
        i++;
    }
}

int main(void) {
    
    char str[128];
    
    printf("请输入一个字符串: ");
    scanf("%s", str);
    
    // 将字符串转为大写
    str_toupper(str);
    printf("大写字母: %s\n", str);
    
    // 将字符串转换为小写
    str_tolower(str);
    printf("小写字母: %s\n", str);
    
    return 0;
}
