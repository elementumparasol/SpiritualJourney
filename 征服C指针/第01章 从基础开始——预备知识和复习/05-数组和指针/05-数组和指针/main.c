//
//  main.c
//  05-数组和指针
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    // 声明一个int类型，并且存储5各元素的数组
    int array[5];
    
    // 声明一个int类型的指针变量
    int *p;  // 注意，星号并不是指针变量名的一部分，它只是用来告诉编译器，变量p是一个指针
    
    // 声明一个int类型的变量
    int i;
    
    // 给数组array中的各元素赋值
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        array[i] = i;
    }
    
    // 利用指针p输出数组array中各元素的值
    for (p = &array[0]; p != &array[5]; p++) {
        printf("array[%d] = %d\n", (int)(p - &array[0]), *p);
    }
    
    printf("\n");
    
    // 还是利用指针p来输出数组array中各元素的值
    p = &array[0];  // 给指针变量p赋初值(相当于是让指针变量p指向数组array的第1个元素)，其实还可以写成: p = array;
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        printf("array[%d] = %d\n", i, *(p + i));
    }
    
    printf("\n");
    
    // 还是利用指针p来输出数组array中所有的元素
    p = array;
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        printf("array[%d] = %d\n", i, p[i]);  // p[i]是*(p + i)的简便写法
    }
    
    return 0;
}

/**
 * 因为数组名就表示该数组在内存中的地址，也是该数组下标为0的元素在内存中的地址，
 * 因此，对于上面的数组array来说，P = &array[0]; 相当于p = array;
 */
