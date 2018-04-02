//
//  main.c
//  0807-getchar函数和EOF
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将标准输入的数据复制到标准输出
 */

#include <stdio.h>

int main(void) {
    
    int ch;
    
    while ((ch = getchar()) != EOF) {
        putchar(ch);
    }
    
    return 0;
}
