//
//  main.c
//  0401-do语句
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 判断输入的整数是奇数还是偶数
 */

int main(void) {
    
    int retry;
    
    do {
        int num;
        
        printf("请输入一个整数: ");
        scanf("%d", &num);
        
        if (num % 2) {
            printf("输入的整数%d是奇数。\n", num);
        } else {
            printf("输入的整数%d是偶数。\n", num);
        }
        
        printf("是否需要重复？[Yes...0继续/No...任意数字]: ");
        scanf("%d", &retry);
    } while (retry == 0);
    
    return 0;
}
