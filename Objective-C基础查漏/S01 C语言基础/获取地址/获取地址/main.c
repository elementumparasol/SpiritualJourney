//
//  main.c
//  获取地址
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    /**
     1、获取变量的地址
     */
    
    float pi = 3.1415926;
    printf("变量pi的地址为: %p\n", &pi);
    
    /**
     2、获取函数的地址
     */
    // 通过函数名就能获取该函数的地址
    printf("main函数的地址为: %p\n", main);
    
    return 0;
}
