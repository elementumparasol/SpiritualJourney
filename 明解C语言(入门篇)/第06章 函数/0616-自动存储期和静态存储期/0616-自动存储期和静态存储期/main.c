//
//  main.c
//  0616-自动存储期和静态存储期
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 自动存储期和静态存储期
 */

#include <stdio.h>

int fx = 0;  // 静态存储期 + 文件作用域

void func(void) {
    static int sx = 0;  // 静态存储期 + 块作用域
    int ax = 0;  // 自动存储期 + 块作用域
    
    printf("%3d%3d%3d\n", ax++, sx++, fx++);
}

int main(void) {
    
    int i;
    
    puts(" as  sx  fx");
    puts("-------------");
    for (i = 0; i < 10; i++) {
        func();
    }
    
    puts("-------------");
    
    return 0;
}
