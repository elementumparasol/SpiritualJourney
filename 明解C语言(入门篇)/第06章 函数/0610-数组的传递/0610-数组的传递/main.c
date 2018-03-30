//
//  main.c
//  0610-数组的传递
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算英语分数和数学分数中的最高分
 */

#include <stdio.h>

#define NUMBER 5

/**
 * 返回元素个数为n的数组V中的最大值
 *  - 参数v: 用来存储整数值
 *  - 参数n: 用来设置数组v的长度
 *  - 返回值: 数组中最大的元素值
 */
int maxOf(int v[], int n) {  // 在函数的定义当中，形参数组v的长度是没有指定的，因此，它可以是任意长度
    
    // 假设数组v的第0个元素是最大值
    int max = v[0];
    
    // 遍历数组v，找出其中最大的值
    for (int i = 0; i < n; i++) {
        if (v[i] > max) {
            max = v[i];
        }
    }
    
    // 返回最大值
    return max;
}

int main(void) {
    
    // 存放英语分数的数组
    int english[NUMBER];
    
    // 存放数学分数的数组
    int math[NUMBER];
    
    // 分别存储英语或者数学的最高分
    int maxOfEnglish, maxOfMath;
    
    printf("请输入%d名学生的分数。\n", NUMBER);
    for (int i = 0; i < NUMBER; i++) {
        
        // 输入学生的英语成绩
        printf("%d号学生英语: ", i + 1);
        scanf("%d", &english[i]);
        
        // 输入学生的数学成绩
        printf("      数学: ");
        scanf("%d", &math[i]);
    }
    
    // 分别计算英语成绩和数学成绩的最高分
    maxOfEnglish = maxOf(english, NUMBER);  // 将数组english及其长度NUMBER传递过去
    maxOfMath = maxOf(math, NUMBER);
    
    // 分别显示英语成绩和数学成绩的最高分
    printf("英语最高分: %d\n", maxOfEnglish);
    printf("数学最高分: %d\n", maxOfMath);
    
    return 0;
}
