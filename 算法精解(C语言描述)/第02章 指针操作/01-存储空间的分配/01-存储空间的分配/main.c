//
//  main.c
//  01-存储空间的分配
//
//  Created by Enrica on 2018/4/25.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// 自动内存分配的示例
int f(int **iptr) {
    
    // 定义一个int类型的变量a
    int a = 100;
    
    // 将变量a的地址赋值给指针变量iptr，或者说
    // 将指针变量iptr指向int类型的变量a
    *iptr = &a;
    
    return 0;
}

// 手动内存分配的示例
int g(int **iptr) {
    
    // 为指针iptr手动分配内存。如果分配失败，则返回-1
    if ((*iptr = (int *)malloc(sizeof(int))) == NULL)
        return -1;
    
    return 0;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
