//
//  main.cpp
//  指针加法
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    int a[10];
    
    // 给数组中所有元素赋值
    for (int i = 0; i < 10; i++) {
        a[i] = i;
    }
    
    // 使用指针取出数组a中所有的元素
    for (int i = 0; i < 10; i++) {
        
        // 因为数组名a表示数组首元素a[0]的地址，而*a则表示数组的首元素
        // a[0]对应的值。所以，*(a + i)就应该表示数组a[i]所对应的值
        printf("a[%d] = %d\n", i, *(a + i));
    }
    
    return 0;
}
