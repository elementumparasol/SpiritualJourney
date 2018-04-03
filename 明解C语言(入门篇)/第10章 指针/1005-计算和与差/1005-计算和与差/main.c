//
//  main.c
//  1005-计算和与差
//
//  Created by Enrica on 2018/4/4.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算两个整数的和与差
 */

#include <stdio.h>

/**
 * 将整数n1和n2的和、差分别保存到* sum和* diff中
 */
void sum_diff(int n1, int n2, int *sum, int *diff) {
    
    // 将形参n1和n2的和赋值给指针变量sum指向的内容
    *sum = n1 + n2;
    
    // 将形参n1和n2的差赋值给指针变量diff指向的内容
    *diff = (n1 > n2) ? (n1 - n2) : (n2 - n1);
}

int main(void) {
    
    int na, nb;
    int wa = 0, sa = 0;
    
    puts("请依次输入两个整数。");
    printf("第一个整数: ");  scanf("%d", &na);
    printf("第二个整数: ");  scanf("%d", &nb);
    
    // 将wa和sa的地址传递过去
    sum_diff(na, nb, &wa, &sa);
    
    printf("这两个整数的和是: %d, 差是: %d\n", wa, sa);
    
    return 0;
}
