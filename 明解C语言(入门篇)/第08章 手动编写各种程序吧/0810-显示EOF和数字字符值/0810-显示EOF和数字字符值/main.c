//
//  main.c
//  0810-显示EOF和数字字符值
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示EOF和数字字符值
 */

#include <stdio.h>

int main(void) {
    
    int i;
    
    printf("EOF = %d\n", EOF);
    
    for (i = 0; i < 10; i++) {
        printf("'%d' = %d\n", i, '0' + i);
    }
    
    return 0;
}

/**
 EOF = -1
 '0' = 48
 '1' = 49
 '2' = 50
 '3' = 51
 '4' = 52
 '5' = 53
 '6' = 54
 '7' = 55
 '8' = 56
 '9' = 57
 */
