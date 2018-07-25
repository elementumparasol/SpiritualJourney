//
//  main.cpp
//  把指针作为参数进行传递
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

// 参数a和b都是指针，用来接收地址
void swap(int *a, int *b) {
    
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int main(int argc, const char * argv[]) {
    
    int m = 25, n = 67;
    
    printf("m = %d, n = %d\n", m, n);
    
    // 调用函数，将变量m和n的地址传递进去
    swap(&m, &n);
    
    printf("m = %d, n = %d\n", m, n);
    
    return 0;
}
