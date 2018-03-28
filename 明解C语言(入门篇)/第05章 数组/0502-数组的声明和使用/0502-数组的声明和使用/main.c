//
//  main.c
//  0502-数组的声明和使用
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * (1)、同一类型的变量(也就是元素)集中在一起，在内存上排成一条直线，这个就是数组；
 * (2)、数组的声明通过指定元素类型、变量名，以及数组中元素个数来进行，eg: int a[5];
 * (3)、数组中括号中元素的个数必须是常量，而且还必须是非负整数；
 * (4)、对数组各个元素的访问是自由的，访问数组元素时，应该使用数组下标；
 * (5)、数组的下标值是从0开始计数的，因此，下标值表示的是首元素(下标值为0的元素)后面第几个元素。
 */

int main(void) {
    
    // 声明一个类型为int，名称为array，数组元素个数为5的数组
    int array[5];
    
    // 通过数组下标值来给数组中对应的元素赋值
    array[0] = 1;
    array[1] = 2;
    array[2] = 3;
    array[3] = 4;
    array[4] = 5;
    
    // 通过数组的下标值来取出数组中对应元素的值
    printf("array[0] = %d\n", array[0]);
    printf("array[1] = %d\n", array[1]);
    printf("array[2] = %d\n", array[2]);
    printf("array[3] = %d\n", array[3]);
    printf("array[4] = %d\n", array[4]);
    
    return 0;
}
