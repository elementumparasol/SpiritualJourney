//
//  main.c
//  0210-类型强转
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取两个整数，并用浮点数显示它们的平均值(使用类型强转)
 */

int main(void) {
    
    int a, b;
    
    puts("请输入两个整数.");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 计算整数a, b的平均值，要求保留小数部分。在0209中，我们是将2写成2.0来
    // 实现保留小数部分的。现在，我们使用类型强转运算符()来显式的完成同样的功能
    printf("整数%d和%d的平均值是: %f\n", a, b, (double)(a + b) / 2);  // (类型) 是类型转换运算符
    
    return 0;
}
