//
//  main.c
//  0204-单目运算符
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 对读取到的整数值进行符号取反操作，并输出结果
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 像下面这样只需要一个操作数的运算符被称之为单目运算符
    printf("整数%d取反之后的结果是: %d\n", num, -num);
    
    return 0;
}
