//
//  main.c
//  03-空指针
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 指向任何类型的指针类型(void *)和空指针(NULL)的区别:
 *  (1)、指向任何类型的指针类型(void *): 表示这个类型的指针可以指向任何类型的变量，它本质上是一种类型；
 *  (2)、空指针(NULL): 本质上是一种特殊的指针值，表示该指针此时没有指向任何变量。空指针通常使用宏定义
 *      NULL来表示该指针的值为空；
 *  (3)、它们两个最明显的区别是，前者表示一种数据类型，而后者则表示一种常量值；
 *  (4)、在通用平台下，空指针NULL的定义如下：
 *      #define NULL ((void *)0)  // 即，将int类型的0强转成"指向任何类型的指针类型"void *
 */

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
