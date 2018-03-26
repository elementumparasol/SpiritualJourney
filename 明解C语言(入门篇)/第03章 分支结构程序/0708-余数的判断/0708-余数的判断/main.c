//
//  main.c
//  0708-余数的判断
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个整数，判断其个位数是否为5
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 先通过模运算获取该整数的个位数，然后再判断该整数的个位数是否是5
    if ((num % 10) == 5) {
        printf("整数%d的个位数是5。\n", num);
    } else {
        printf("整数%d的个位数不是5。\n", num);
    }
    
    return 0;
}
