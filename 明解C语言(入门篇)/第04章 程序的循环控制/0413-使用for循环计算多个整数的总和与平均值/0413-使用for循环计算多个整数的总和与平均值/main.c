//
//  main.c
//  0413-使用for循环计算多个整数的总和与平均值
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个正整数作为限定数量，然后再输入与该整数值等量的整数，最后再计算它们的总和与平均值
 */

int main(void) {
    
    int num;
    int sum = 0, tmp = 0;
    
    printf("准备计算多少个正整数的总和与平均值: ");
    scanf("%d", &num);
    
    for (int i = 0; i < num; i++) {
        
        printf("请输入第%d个正整数: ", i + 1);
        scanf("%d", &tmp);
        sum += tmp;
    }
    
    printf("这些正整数的总和是: %d\n", sum);
    printf("这些正整数的平均值是: %.2f\n", (double)sum / num);
    
    return 0;
}
