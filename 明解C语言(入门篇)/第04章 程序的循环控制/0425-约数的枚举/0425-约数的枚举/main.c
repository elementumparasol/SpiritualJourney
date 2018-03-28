//
//  main.c
//  0425-约数的枚举
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个正整数，然后显示该整数所有的约数
 */

int main(void) {
    
    int num;
    
    printf("请输入一个正整数: ");
    scanf("%d", &num);
    
    printf("整数%d所有的约数依次为: ", num);
    for (int i = 1; i <= num; i++) {
        if (num % i == 0) {
            printf("%d ", i);
        }
    }
    printf("\n");
    
    return 0;
}
