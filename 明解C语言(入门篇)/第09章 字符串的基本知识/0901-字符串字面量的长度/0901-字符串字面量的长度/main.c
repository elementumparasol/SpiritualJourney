//
//  main.c
//  0901-字符串字面量的长度
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示字符串字面量的长度
 */

#include <stdio.h>

int main(void) {
    
    printf("sizeof(\"123\") = %u\n", (unsigned)sizeof("123"));
    printf("sizeof(\"AB\\tC\") = %u\n", (unsigned)sizeof("AB\tC"));
    printf("sizeof(\"abc\\0def\") = %u\n", (unsigned)sizeof("abc\0def"));
    
    return 0;
}
