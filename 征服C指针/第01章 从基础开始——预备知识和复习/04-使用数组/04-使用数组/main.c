//
//  main.c
//  04-使用数组
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    // 声明两个整型变量，其中变量array[5]表示一个可以存储
    // 5个整型元素的数组，而变量i则表示可以存储整型int的变量
    int array[5], i;
    
    // 给数组array[5]中各元素赋值。数组中元素的个数 = 数组的总长度(字节数) / 数组中每个元素所占用的字节数
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        array[i] = i;
    }
    
    // 遍历数组array[5]，输出数组中各元素的值
    for (i = 0; i < sizeof(array)  / sizeof(array[0]); i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
    
    printf("\n");
    
    // 输出数组中各元素在内存中的地址
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        printf("array[%d]的地址是: %p\n", i, &array[i]);
    }
    
    printf("\n");
    
    // 其实，数组名就是数组的地址，也是数组中第1个元素(下标值为0的元素)的地址
    printf("数组array在内存中的地址是: %p\n", array);
    
    return 0;
}
