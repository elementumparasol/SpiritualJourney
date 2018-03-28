//
//  main.c
//  0409-前置递增或递减运算符
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入n个整数，然后计算它们的总和及平均值
 */

int main(void) {
    
    int i = 0, sum = 0;
    int num, tmp;  // 其中变量num表示需要输入整数的个数，变量tmp用来临时存储输入的整数值
    
    printf("要输入多少个整数: ");
    scanf("%d", &num);
    
    // 依次输入num个整数
    while (i < num) {
        
        printf("第%d个整数: ", ++i);
        
        // 将输入的整数存储到变量tmp中
        scanf("%d", &tmp);
        
        // 计算所输入整数的总和
        sum += tmp;
    }
    
    // 输出这些整数的总和与平均值
    printf("所有整数的总和为: %d\n", sum);
    printf("这些整数的平均值为: %.2f\n", (double)sum / num);
    
    return 0;
}
