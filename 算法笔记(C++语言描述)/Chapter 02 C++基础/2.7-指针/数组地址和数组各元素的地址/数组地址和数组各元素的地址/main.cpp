//
//  main.cpp
//  数组地址和数组各元素的地址
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    /**
     * (1)、数组是由地址上连续的若干个相同类型的数据组合而成，比如说，对int类型的数组a来说，
     * a[0]、a[1]、...、a[n - 1]在地址上都是连续的。这样可以在元素前面加取地址运算
     * 符&来获取它的地址，例如a[0]的地址为&a[0]，即数组a的首地址为&a[0]；
     * (2)、另外，在C语言中，数组名也作为数组的首地址使用，因此像上面的例子中，有a == &a[0]，
     * 即它们都表示数组a的首地址。
     */
    
    // 定义并初始化数组
    int a[10] = {1};  // 数组a的首元素为1，其它元素为0
    
    for (int i = 0; i < 10; i++) {
        printf("a[%d] = %d\n", i, a[i]); 
    }
    
    // 定义一个指针p，让它指向数组a
    int *p = a;
    printf("数组a的地址为: %p\n", p);  // 0x7ffeefbff3f0
    
    // 再定义一个指针p1，让它指向数组的首元素
    int *p1 = &a[0];
    printf("数组a首元素的地址为: %p\n", p1);  // 0x7ffeefbff3f0
    
    return 0;
}
