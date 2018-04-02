//
//  main.c
//  0907-读取字符串数组中的字符串
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 读取并显示字符串数组
 */

#include <stdio.h>

int main(void) {
    
    int i;
    
    // 声明一个char[128]型，包含3个元素的数组
    char s[3][128];  // 因为没有对数组s进行初始化，因此紧挨着s后面中括号中的数字3是不可以省略的
    
    for (i = 0; i < 3; i++) {
        printf("s[%d]: ", i);
        scanf("%s", s[i]);
    }
    
    for (i = 0; i < 3; i++) {
        printf("s[%d] = \"%s\"\n", i, s[i]);
    }
    
    return 0;
}
