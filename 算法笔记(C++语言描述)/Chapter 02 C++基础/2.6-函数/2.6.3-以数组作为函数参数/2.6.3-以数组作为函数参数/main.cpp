//
//  main.cpp
//  2.6.3-以数组作为函数参数
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

// 以数组作为函数的参数时，参数中数组的第一维不需要写数组长度。但是，如果是二维
// 数组，那么第二维的长度就必须要写。实际上在函数调用过程中也只需要填写数组名。
// 最重要的是，数组作为参数时，在函数中对数组元素的修改等同于对原始数组进行修改
void change(int a[], int b[][5]) {  // 一维数组a的长度不需要写，但是二维数组b的第二维的长度需要写
    
    a[0] = 1;
    a[1] = 3;
    a[2] = 5;
    
    b[0][0] = 1;
}

int main(int argc, const char * argv[]) {
    
    int a[3] = {};  // 定义并初始化数组a
    int b[5][5] = {};  // 定义并初始化数组b
    
    // 调用函数change()
    change(a, b);
    
    for (int i = 0; i < 3; i++) {
        printf("a[%d] = %d\n", i, a[i]);
    }
    
    printf("b[0][0] = %d\n", b[0][0]);
    
    return 0;
}
