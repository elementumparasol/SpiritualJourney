//
//  main.c
//  0507-输入数组元素的值
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入数组元素的值，并将其显示在屏幕上
 */

int main(void) {
    
    int array[5];
    
    // 输入数组array的元素值
    puts("请依次输入数组元素的值。");
    for (int i = 0; i < 5; i++) {
        printf("array[%d]: ", i);
        scanf("%d", &array[i]);
    }
    
    printf("数组元素输入完毕，下面依次输出数组中各元素的值: \n");
    
    // 遍历数组array，取出它里面元素的值
    for (int i = 0; i < 5; i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
    
    return 0;
}
