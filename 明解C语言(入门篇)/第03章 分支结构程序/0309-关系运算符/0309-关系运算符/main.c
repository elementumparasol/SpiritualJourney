//
//  main.c
//  0309-关系运算符
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 判断输入整数的符号
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    if (num == 0) {
        puts("你输入的是一个0。");
    } else if (num > 0) {
        puts("你输入的整数大于0。");
    } else {
        puts("你输入的整数小于0。");
    }
    
    return 0;
}
