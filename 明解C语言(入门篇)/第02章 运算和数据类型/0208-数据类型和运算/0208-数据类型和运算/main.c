//
//  main.c
//  0208-数据类型和运算
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 验证数据类型和运算
 */

int main(void) {
    
    int n1, n2, n3, n4;
    double d1, d2, d3, d4;
    
    n1 = 5 / 2;
    n2 = 5.0 / 2.0;  // 计算结果会舍弃小数部分
    n3 = 5.0 / 2;  // 计算结果会舍弃小数部分
    n4 = 5 / 2.0;  // 计算结果会舍弃小数部分
    
    d1 = 5 / 2;  // 计算结果会自动在小数位后面补0
    d2 = 5.0 / 2.0;
    d3 = 5.0 / 2;
    d4 = 5 / 2.0;
    
    printf("n1 = %d\n", n1);
    printf("n2 = %d\n", n2);
    printf("n3 = %d\n", n3);
    printf("n4 = %d\n\n", n4);
    
    printf("d1 = %f\n", d1);
    printf("d2 = %f\n", d2);
    printf("d3 = %f\n", d3);
    printf("d4 = %f\n", d4);
    
    return 0;
}
