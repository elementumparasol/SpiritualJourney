//
//  main.c
//  0318-if多分支结构
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 显示所输入的整数除以3的余数
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 判断该整数除以3之后的余数
    if (num % 3 == 0) {
        printf("整数%d刚好可以被3整数.\n", num);
    } else if (num % 3 == 1) {
        printf("整数%d除以3的余数是1.\n", num);
    } else {
        printf("整数%d除以3的余数是2.\n", num);
    }
    
    return 0;
}
