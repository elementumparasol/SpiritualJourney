//
//  main.c
//  0407-数据递增
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 递增显示从0到输入的整数
 */

int main(void) {
    
    int i, num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    i = 0;
    while (i <= num) {
        printf("%d ", i++);
    }
    printf("\n");
    
    return 0;
}
