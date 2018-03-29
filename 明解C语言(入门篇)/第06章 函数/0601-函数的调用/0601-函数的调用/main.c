//
//  main.c
//  0601-函数的调用
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 函数由两大部分构成：函数头和函数体。其中函数头又可以分为返回值类型、函数名和参数列表；
 * 而函数体是函数的主体部分，由复合语句构成。
 *  (1)、返回值类型：决定了函数返回值的类型；如果函数没有返回值，则它的类型是void;
 *  (2)、函数名：表示该函数的名称，而且在调用该函数时，需要通过函数名来调用；
 *  (3)、参数列表：就是函数名后面小括号括起来的部分，它包含参数个数、名称和类型。
 * 定义一个函数的格式为：
 *  返回值类型 函数名称(参数列表) {函数体}，eg:
 *  int max(int a, int b) {
 *      if (a > b) {
 *          return a;
 *      } else {
 *          return b;
 *      }
 *  }
 */

/* 用来返回两个数中较大的一个 */
int maxValue(int a, int b) {
    
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

int main(void) {
    
    int value1, value2;
    
    puts("请依次输入两个整数。");
    printf("第一个整数: ");
    scanf("%d", &value1);
    printf("第二个整数: ");
    scanf("%d", &value2);
    
    // 调用maxValue函数，返回其中较大的一个
    printf("上面两个数中，较大的一个数是: %d\n", maxValue(value1, value2));
    
    return 0;
}
