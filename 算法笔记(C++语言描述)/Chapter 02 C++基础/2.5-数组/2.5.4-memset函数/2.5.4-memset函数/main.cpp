//
//  main.cpp
//  2.5.4-memset函数
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstring>

int main(int argc, const char * argv[]) {
    
    // 一般情况下，在定义数组时，要写清楚数组中有几个元素。但是，
    // 如果在初始化的时候将所有元素都列出来，就可以省略数组个数
    int a[] = {1, 2, 3, 4, 5};
    
    // 遍历数组a
    for (int i = 0; i < 5; i++) {
        printf("a[%d] = %d\n", i, a[i]);
    }
    
    printf("\n***************\n\n");
    
    // 给数组a中每一个元素都重新赋值0
    memset(a, 0, sizeof(a));  // 对多维数组进行赋值也是一样，只需要写数组名和相应的值，其它不变
    
    // 遍历数组a
    for (int i = 0; i < 5; i++) {
        printf("a[%d] = %d\n", i, a[i]);
    }
    
    printf("\n***************\n\n");
    
    // 给数组a中每一个元素都重新赋值0
    memset(a, -1, sizeof(a));
    
    // 遍历数组a
    for (int i = 0; i < 5; i++) {
        printf("a[%d] = %d\n", i, a[i]);
    }
    
    return 0;
}

// 注意: 因为memset()函数是按字节赋值，即对每个字节赋同样的值，建议初学的时候
// 值赋值0或者-1.如果需要对数组赋其它值，最好是使用fill函数
