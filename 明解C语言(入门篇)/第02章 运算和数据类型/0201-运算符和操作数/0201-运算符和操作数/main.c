//
//  main.c
//  0201-运算符和操作数
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取两个整数，然后计算它们的和、差、积、商和余数
 */
int main(void) {
    
    int x, y;  // 声明了两个变量，但是并没有对它们进行初始化，此时它们存储的是垃圾值
    
    puts("请依次输入两个整数。");
    printf("第一个整数：");   scanf("%d", &x);
    printf("第二个整数：");   scanf("%d", &y);
    
    // 计算x和y的和
    printf("%d + %d = %d\n", x, y, x + y);
    
    // 计算x和y的差
    printf("%d - %d = %d\n", x, y, x - y);
    
    // 计算x和y的积
    printf("%d * %d = %d\n", x, y, x * y);
    
    // 计算x和y的商
    printf("%d / %d = %d\n", x, y, x / y);
    
    // 计算x和y的余数。因为%在C语言中比较特殊，它通常用来行使转换说明的功能，比如说输出
    // 整数用%d，输出字符串使用%s。如果不想行使转换功能，直接输出%，就需要用%%进行说明
    printf("%d %% %d = %d\n", x, y, x % y);
    
    return 0;
}
