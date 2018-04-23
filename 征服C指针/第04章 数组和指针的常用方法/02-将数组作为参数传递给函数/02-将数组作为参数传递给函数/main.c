//
//  main.c
//  02-将数组作为参数传递给函数
//
//  Created by Enrica on 2018/4/23.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 严格意义上来讲，在C语言中，数组是不能作为参数传递给函数的，但是，
 * 可以通过传递指向数组首元素的指针，外加传递数组元素个数的方式来实现
 */

#include <stdio.h>

/**
 * 遍历数组中的所有元素
 * - 参数array: 数组名，在这里其实是指指向数组首元素的地址；
 * - 参数array_size: 数组中的长度，或者说数组中元素的个数；
 * - 返回值: 没有返回值
 */
void func(int *array, int array_size) {
    
    int i;
    
    for (i = 0; i < array_size; i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
}

int main(int argc, const char * argv[]) {
    
    int array[] = {1, 3, 5, 7, 9, 2, 4, 6, 8, 0};
    
    // 需要说明的是，这里传递的是数组首元素的指针，并不是整个数组。
    // 因此，为了能够成功遍历出数组中所有的元素，还必须额外传递一
    // 个数组中元素的个数，否则函数内部是没办法遍历所有的元素的
    func(array, sizeof(array) / sizeof(array[0]));
    
    return 0;
}
