//
//  main.c
//  0503-数组的遍历
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 依次把整数1、2、3、4、5赋值给数组的每个元素，并且将其显示出来
 */

int main(void) {
    
    int array[5];
    
    // 赋值
    for (int i = 0; i < 5; i++) {
        // 给数组对应的下标元素赋值
        array[i] = i + 1;  // 因为下标i是从0开始的，而数组元素对应的值是从1开始的，因此这里需要加1
    }
    
    // 取值
    for (int i = 0; i < 5; i++) {
        // 依次输出数组中所有元素的值
        printf("array[%d] = %d\n", i, array[i]);
    }
    
    return 0;
}
