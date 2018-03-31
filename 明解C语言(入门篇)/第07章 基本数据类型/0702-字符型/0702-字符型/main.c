//
//  main.c
//  0702-字符型
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 判断char型有无符号
 */

#include <stdio.h>
#include <limits.h>

int main(void) {
    
    printf("当前环境下char型是");
    
    if (CHAR_MIN)
        puts("有符号的。");
    else
        puts("无符号的。");
    
    return 0;
}
