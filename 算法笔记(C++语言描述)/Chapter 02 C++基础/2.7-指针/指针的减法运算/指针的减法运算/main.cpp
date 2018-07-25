//
//  main.cpp
//  指针的减法运算
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 定义数组并初始化
    int a[10] = {1, 4, 9, 16, 25, 36, 49};  // 数组部分初始化，没有被初始化的部分会自动赋值为0
    
    // 定义一个指针p指向数组a
    int *p = a;  // 因为数组名就表示数组的首元素地址，同时也是数组的地址，因此这里不需要取地址运算符
    
    // 再定义一个指针q，用来指向数组中下标为5的元素
    int *q = &a[5];  // 这里是指向数组中某个指定的元素，不是指向整个数组，因此需要用到取地址运算符
    
    printf("指针p的值为: %p\n", p);
    printf("指针q的值为: %p\n", q);
    printf("指针q-p的值为: %p\n", q - p);
    
    // 两个int类型的指针相减，等价于求两个指针之间相差了几个int
    
    return 0;
}
