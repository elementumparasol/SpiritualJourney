//
//  main.c
//  0207-double类型的运算
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取两个实数值，用实数显示它们的和、差、积、商
 */

int main(void) {
    
    double x, y;
    
    puts("请依次输入两个实数.");
    printf("第一个实数: ");  scanf("%lf", &x);  // %f表示float类型的格式说明符，%lf表示double类型的格式说明符
    printf("第二个实数: ");  scanf("%lf", &y);
    
    printf("%lf + %lf = %lf\n", x, y, x + y);
    printf("%lf - %lf = %lf\n", x, y, x - y);
    printf("%lf * %lf = %lf\n", x, y, x * y);
    printf("%lf / %lf = %lf\n", x, y, x / y);
    
    return 0;
}
