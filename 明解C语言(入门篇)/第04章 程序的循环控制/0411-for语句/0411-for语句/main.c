//
//  main.c
//  0411-for语句
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 递增显示从0到输入的正整数之间所有的整数
 */

int main(void) {
    
    int num;
    
    printf("请输入一个正整数: ");
    scanf("%d", &num);
    
    for (int i = 0; i <= num; i++) {
        printf("%d ", i);
    }
    
    // 不要和puts()函数混淆了，puts()函数是用来处理字符串
    // 常量的，而putchar()函数是用来处理字符常量的
    putchar('\n');
    
    return 0;
}
