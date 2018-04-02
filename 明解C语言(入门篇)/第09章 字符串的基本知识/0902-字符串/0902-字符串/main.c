//
//  main.c
//  0902-字符串
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将字符串存储在数组中并显示
 */

#include <stdio.h>

int main(void) {
    
    char str[4];
    
    str[0] = 'A';
    str[1] = 'B';
    str[2] = 'C';
    str[3] = '\0';  // 末尾的'\0'并不显示，它是字符串结束的标志
    
    printf("字符串str为: \"%s\"。\n", str);
    
    return 0;
}
