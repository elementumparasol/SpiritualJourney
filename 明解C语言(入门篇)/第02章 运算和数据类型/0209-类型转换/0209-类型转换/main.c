//
//  main.c
//  0209-类型转换
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取两个整数，并用浮点数显示它们的平均值
 */

int main(void) {
    
    int a, b;
    
    puts("请输入两个整数.");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 计算整数a, b的平均值，要求保留小数部分
    printf("整数%d和%d的平均值是: %f\n", a, b, (a + b) / 2.0);  // 只要有一个浮点型数参与运算，那么整个结果就将是浮点型
    
    return 0;
}
