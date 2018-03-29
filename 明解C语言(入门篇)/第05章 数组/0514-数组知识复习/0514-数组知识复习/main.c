//
//  main.c
//  0514-数组知识复习
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 数组知识总结
 */

// 定义数组的长度
#define NUMBER 5

int main(void) {

    int i, j;
    int sum;
    
    // 声明同样是int[NUMBER]类型的数组a和b
    int a[NUMBER];
    int b[NUMBER] = {1, 3, 5};  // {1, 3, 5, 0, 0}
    
    // 声明一个二维数组c
    int c[4][3] = {
        {1, 3, 5},
        {2, 4, 6},
        {10, 20, 30},
        {-1, -9, -10}
    };
    
    // 将数组b中所有的元素都复制给数组a
    for (i = 0; i < NUMBER; i++) {
        a[i] = b[i];
    }
    
    // 显示数组a中所有的元素
    for (i = 0; i < NUMBER; i++) {
        printf("a[%d] = %d\n", i, a[i]);
    }
    
    // 显示数组b中所有的元素
    for (j = 0; j < NUMBER; j++) {
        printf("b[%d] = %d\n", j, b[j]);
    }
    
    // 计算数组a中所有元素之和
    sum = 0;  // 因为变量sum在上面仅仅是声明了，但是没有初始化。没有初始化的变量是不能随便使用的，必须先对其赋初值
    for (i = 0; i < NUMBER; i++) {
        sum += a[i];
    }
    printf("sum = %d\n", sum);
    
    // 显示数组c中所有的构成元素
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 3; j++) {
            printf("c[%d][%d] = %d\n", i, j, c[i][j]);
        }
    }
    
    return 0;
}
