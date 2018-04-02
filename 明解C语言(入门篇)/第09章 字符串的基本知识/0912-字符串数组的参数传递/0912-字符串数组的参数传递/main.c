//
//  main.c
//  0912-字符串数组的参数传递
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示字符串数组
 */

#include <stdio.h>

/**
 * 显示字符串数组
 */
void put_strary(const char s[][6], int n) {
    
    int i;
    for (i = 0; i < n; i++) {
        printf("s[%d] = \"%s\"\n", i, s[i]);
    }
}

int main(void) {
    
    // cs是char[6]型的数组，里面包含3个元素
    // 因为在声明数组的时候有初始化，因此可以
    // 将数组的元素个数个省略掉
    char cs[][6] = {"Turbo", "NA", "DOHC"};
    
    put_strary(cs, 3);
    
    return 0;
}
