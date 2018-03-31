//
//  main.c
//  0705-求数组元素的个数
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 求数组元素的个数
 */

#include <stdio.h>

int main(void) {
    
    int v[10];
    double x[25];
    
    printf("数组v的元素个数是: %lu\n", (unsigned)sizeof(v) / sizeof(v[0]));
    printf("数组x的元素个数是: %lu\n", (unsigned)sizeof(x) / sizeof(x[0]));
    
    return 0;
}

// 求数组的元素个数，通常可以使用公式: sizeof(数组名) / sizeof(数组类型)，不过
// 一般情况下，我们应该尽量避免这样使用，这主要是因为如果是求不同类型的数组，需要除
// 以不同的类型，这样相对比较麻烦。而比较灵巧的做法是: sizeof(数组名) / sizeof(数组名[0])，
// 也就是说或，直接用 "数组名的长度 / 数组中的第一个元素" 来获得
