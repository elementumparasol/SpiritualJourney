//
//  main.c
//  0510-对象式宏
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 使用宏定义来灵活的选择输入多个球员的得分，然后再分别计算他们的总得分和平均得分
 */

#define NUMBER 5

int main(void) {
    
    int array[NUMBER];
    int sum = 0;
    
    printf("请依次输入%d位球员的得分。\n", NUMBER);
    for (int i = 0; i < NUMBER; i++) {
        printf("第%d位球员的得分是: ", i + 1);
        scanf("%d", &array[i]);
        sum += array[i];
    }
    
    printf("这%d位球员的总得分是: %d\n", NUMBER, sum);
    printf("这%d位球员的的平均得分是: %.2f\n", NUMBER, (double)sum / NUMBER);
    
    return 0;
}
