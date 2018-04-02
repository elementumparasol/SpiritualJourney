//
//  main.c
//  0506-字符串数组
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 字符串数组
 */

#include <stdio.h>

int main(void) {
    
    int i;
    
    // 因为数组c为char[6]型，并且初始化的时候，很明确的显示它只有3个元素，因此
    // 前面中括号里面的数字可以省略，然后编译器可以根据初始化情况进行推断
    char c[][6] = {"Turbo", "NA", "DOHC"};
    
    for (i = 0; i < 3; i++) {
        
        printf("c[%d] = \"%s\"\n", i, c[i]);
    }
    
    return 0;
}

/**
 * 关于多维数组:
 * int a[3][4], 这个数组被称之为int[4]型的数组，其元素个数为3个，
 * 也就说说，该数组存储的元素是int[4]类型的，并且元素个数之后3个；
 *
 * char b[][6] = {"LeBron", "Anthony", "Westbrook", "Durant"};
 * 这个数组是char[6]型，从初始化情况来看，它的元素个数应该只有4个，也就说
 * 完整的写法应该是 char b[4][6] = {"LeBron", "Anthony", "Westbrook", "Durant"};
 */
