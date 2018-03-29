//
//  main.c
//  0511-求数组中元素的最大值和最小值
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入球员的得分，然后求出他们之间得分最多的和得分最少的
 */

// 用于表示数组元素的个数(数组长度)
#define NUMBER 5

int main(void) {
    
    int i;
    int array[NUMBER];
    int max, min;
    
    printf("请依次输入这%d为球员的得分。\n", NUMBER);
    for (i = 0; i < NUMBER; i++) {
        printf("第%d位球员的得分是: ", i + 1);
        scanf("%d", &array[i]);
    }
    
    // 假设最低得分和最高得分都是array[0]
    // 因为此时数组中各元素的值已经出来了，
    // 因此在这里给变量赋初值最合适。记住，
    // 在C语言中，变量没有经过初始化，或者
    // 没有赋初值，是不能随便使用的，否则会
    // 产生意想不到的垃圾值。
    max = array[0];
    min = array[0];
    
    // 遍历数组，计算球员的最高得分和最低得分
    for (i = 0; i < NUMBER; i++) {
        
        // 计算最高得分
        if (array[i] > max) {
            max = array[i];
        }
        
        // 计算最低得分
        if (array[i] < min) {
            min = array[i];
        }
    }
    
    // 显示球员的最高得分和最低得分
    printf("这些球员中的最高得分是: %d分。\n", max);
    printf("这些球员中的最低得分是: %d分。\n", min);
    
    return 0;
}
