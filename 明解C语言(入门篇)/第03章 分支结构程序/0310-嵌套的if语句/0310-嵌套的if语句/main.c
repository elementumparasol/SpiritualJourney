//
//  main.c
//  0310-嵌套的if语句
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个整数，判断其是否为正数；如果是，再判断其奇偶性
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 先判断num是否为正数。因为0比具有奇偶性，并且
    // 我们这里只考虑整数，因此条件num应该大于0
    if (num > 0) {
        
        // 在判断num的球星
        if (num % 2 == 0) {
            printf("整数%d是偶数。\n", num);
        } else {
            printf("整数%d是奇数。\n", num);
        }
        
    } else {
        printf("整数%d不是正数。\n", num);
    }
    
    return 0;
}
