//
//  main.c
//  0709-浮点型
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 表示浮点型变量的值
 */

#include <stdio.h>

int main(void) {
    
    float a = 123456789012345678901234567890.0;
    double b = 123456789012345678901234567890.0;
    long double c = 123456789012345678901234567890.0;
    
    printf("a = %f\n", a);
    printf("b = %f\n", b);
    printf("c = %Lf\n", c);  // 只有long double的显示使用lf
    
    return 0;
}
