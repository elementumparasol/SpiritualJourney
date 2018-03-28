//
//  main.c
//  0504-double类型的数组
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 声明一个double类型的数组，并且给数组元素赋值
 */

int main(void) {
    
    // 声明double类型的数组array
    double array[5];
    
    // 声明一个增量
    double x = 1.5;
    
    // 给数组元素赋值
    for (int i = 0; i < 5; i++) {
        array[i] = x;
        x++;
    }
    
    // 取出数组中元素的值
    for (int i = 0; i < 5; i++) {
        printf("array[%d] = %.1f\n", i, array[i]);
    }
    
    return 0;
}
