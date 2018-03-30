//
//  main.c
//  0609-文件作用域
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算最高分
 */

#include <stdio.h>

// 学生人数
#define NUMBER 5

// 声明一个存储分数的数组。像数组array这样，在函数外声明
// 的变量作用域，其名称从声明的位置开始，到该程序的结尾都
// 是通用的。这样的作用域，一般称之为文件作用域(file scope)
int array[NUMBER];

// 函数top的函数原型声明
int top(void);

int main(void) {
    
    // 这里使用了关键字extern在这里表示"使用的是在
    // 别处创建的数组array"，基本上相当于是告诉编译
    // 器，虽然这个数组不是在这里声明和定义的，但是它
    // 确实存在。另外，关键字extern除了在本文件中引
    // 用在别处声明和定义的变量或者函数之外，其实还可
    // 以引用在其它源文件之外声明或定义的变量和函数
    extern int array[];  // 因为数组array是在函数外面声明的，也就是说它是文件作用域，这里其实可以省略的
    int i;
    
    printf("请依次输入%d名学生的分数。\n", NUMBER);
    for (i = 0; i < NUMBER; i++) {
        printf("第%d位学生的得分为: ", i + 1);
        scanf("%d", &array[i]);
    }
    
    // 调用top函数，计算最高得分
    printf("最高分为: %d\n", top());
    
    return 0;
}

/**
 * 返回数组array中最大的值
 */
int top(void) {  // top函数的定义(top函数的声明和定义是分开的)
    
    // array是文件作用域，这里可以省略。使用关键字extern引入它，
    // 主要是为了说明有这样一个知识点。后续会有关键字extern的知识
    extern int array[];
    int i;
    int max = array[0];
    
    for (i = 0; i < NUMBER; i++) {
        
        if (array[i] > max) {
            max = array[i];
        }
    }
    
    return max;
}
