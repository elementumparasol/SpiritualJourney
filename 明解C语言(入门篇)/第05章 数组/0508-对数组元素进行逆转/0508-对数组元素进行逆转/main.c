//
//  main.c
//  0508-对数组元素进行逆转
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 对数组中全部元素进行逆转(倒置): 1, 9, 3, 5, 7 ---> 7, 5, 3, 9, 1
 */

int main(void) {
    
    int i;
    int array[7];
    
    // 依次输入数组元素的值
    puts("请依次输入数组中元素的值。");
    for (i = 0; i < 7; i++) {
        printf("array[%d]: ", i);
        scanf("%d", &array[i]);
    }
    
    // 交换数组中元素的位置，使其逆转
    for (i = 0; i < 3; i++) {
        int tmp = array[i];
        array[i] = array[6 - i];
        array[6 - i] = tmp;
    }
    
    puts("对数组进行倒序排序的结果为: ");
    for (i = 0; i < 7; i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
    
    return 0;
}
