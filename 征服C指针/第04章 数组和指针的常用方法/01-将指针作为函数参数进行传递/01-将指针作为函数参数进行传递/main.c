//
//  main.c
//  01-将指针作为函数参数进行传递
//
//  Created by Enrica on 2018/4/23.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

void func(int *a, double *b) {
    *a = 10;
    *b = 2.717;
}

int main(int argc, const char * argv[]) {
    
    int x;
    double y;
    
    // 调用函数func，对变量进行赋值
    func(&x, &y);
    
    printf("x = %d, y = %.2f\n", x, y);
    
    return 0;
}

/**
 * 如果需要通过函数返回值以外的方式来获取返回值，可以通过向函数传递指针作为参数的形式来实现。
 */
