//
//  main.c
//  0405-while语句
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 从输入的整数开始倒数到0
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    while (num >= 0) {
        printf("%d ", num);
        num--;
    }
    
    printf("\n");
    
    return 0;
}
