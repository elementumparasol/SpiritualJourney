//
//  main.c
//  0703-显示字符型和整型长度
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示字符型和整型的长度
 */

#include <stdio.h>

int main(void) {
    
    printf("sizeof(char): %u\n", (unsigned)sizeof(char));
    printf("sizeof(short): %u\n", (unsigned)sizeof(short));
    printf("sizeof(int): %u\n", (unsigned)sizeof(int));
    printf("sizeof(long): %u\n", (unsigned)sizeof(long));
    
    return 0;
}
