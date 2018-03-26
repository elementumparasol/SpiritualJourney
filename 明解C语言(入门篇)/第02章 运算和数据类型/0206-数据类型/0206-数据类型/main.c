//
//  main.c
//  0206-数据类型
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 看
 */

int main(void) {
    
    int n;
    double x;
    
    n = 9.99;  // 小数部分会被舍弃(将浮点数double隐式的转换为int类型)
    x = 9.99;  // 会保留小数部分
    
    printf("int类型的变量n的值是: %d\n", n);
    printf("%d除以2的值是: %d\n", n, n / 2);  // 计算结果也会舍弃小数部分
    
    // 格式说明符%f是用来显示浮点数的，它默认会保留6位小数。如果需要人为干预保留
    // 小数的位数，可以使用%.xf表示，其中x是需要保留的小数位数，比如说%.2f就是保留两位小数
    printf("double类型的变量x的值是: %f\n", x);
    printf("%f除以2的值是: %f\n", x, x / 2);  // 计算结果依然会保留小数部分
    
    return 0;
}
