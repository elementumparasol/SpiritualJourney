//
//  main.c
//  07-内存布局对齐
//
//  Created by Enrica on 2018/4/21.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

// 定义一个结构体
typedef struct {
    int my_int;  // 4字节
    double my_double;  // 8字节
    char my_char;  // 1字节
    double other_double;  // 8字节
} Hoge;  // Hoge的字节分配不是结构体成员字节长度的简单相加，而是每个结构体成员都比照最大成员变量的字节来分配，因此是32

int main(int argc, const char * argv[]) {
    
    // 声明一个Hoge类型的数据
    Hoge hoge;
    
    printf("hoge size: %ld\n", sizeof(Hoge));
    
    printf("my_int size: %ld\n", sizeof(hoge.my_int));
    printf("my_double size: %ld\n", sizeof(hoge.my_double));
    printf("my_char size: %ld\n", sizeof(hoge.my_char));
    printf("other_double size: %ld\n", sizeof(hoge.other_double));
    
    return 0;
}
