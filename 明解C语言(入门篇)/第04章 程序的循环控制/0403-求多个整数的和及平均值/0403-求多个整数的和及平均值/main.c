//
//  main.c
//  0403-求多个整数的和及平均值
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 不停的输入整数，然后显示其和及平均值
 */

int main(void) {
    
    int sum = 0;  // 定义变量并且进行初始化
    int count = 0;
    int retry;  // 定义变量，但是未进行初始化，其存储的值是不确定的，除非后面给它重新赋值
    
    do {
        int num;
        printf("请输入一个整数: ");
        scanf("%d", &num);
        
        // 计算总和
        sum = sum + num;
        
        // 记录输入的整数个数
        count = count + 1;
        
        printf("是否需要继续？[输入0继续，其它任意数结束]: ");
        scanf("%d", &retry);
    } while (retry == 0);
    
    // 输出总和、计算平均值并将其打印
    printf("总和为: %d，平均值为: %.2f\n", sum, (float)sum / count);
    
    return 0;
}
