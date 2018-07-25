//
//  main.cpp
//  指针的自增运算
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 指针作为一种变量，和其它变量一样，可以做自增运算
    int a[10];
    
    // 给数组中的元素赋值
    for (int i = 0; i < 10; i++) {
        a[i] = i;
    }
    
    for (int *p = a; p < a + 10; p++) {
        printf("%d  ", *p);
    }
    
    printf("\n");
    
    return 0;
}
