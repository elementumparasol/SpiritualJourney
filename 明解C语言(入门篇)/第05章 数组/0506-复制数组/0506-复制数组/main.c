//
//  main.c
//  0506-复制数组
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 把数组中的全部元素复制到另外一个数组中(注意，这两个数组类型、元素个数必须一致，否则就没办法复制)
 */

int main(void) {
    
    int i;
    int a[5] = {1, 2, 3, 4, 5};
    int b[5];
    
    // 将数组a中的元素复制到数组b中
    for (i = 0; i < 5; i++) {
        b[i] = a[i];
    }
    
    // 输出数组a的元素值
    for (i = 0; i < 5; i++) {
        printf("a[%d] = %d ", i, a[i]);
    }
    
    printf("\n--------------------------------------------\n");
    
    // 输出数组b的元素值
    for (i = 0; i < 5; i++) {
        printf("b[%d] = %d ", i, b[i]);
    }
    
    printf("\n");
    
    return 0;
}
