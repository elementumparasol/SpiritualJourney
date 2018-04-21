//
//  main.c
//  06-free()函数
//
//  Created by Enrica on 2018/4/21.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 通常情况下，调用free()函数之后，对应的内存是不会立刻返还给操作系统的
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    
    // 声明一个指向int类型的指针
    int *int_p;
    
    // 为int_p分配内存空间
    int_p = malloc(sizeof(int));
    
    // 向新分配的内存中写入数据
    *int_p = 34972;
    
    // 释放内存
    free(int_p);
    
    // 访问int_p中存储的内容
    printf("指针int_p中存储的内容为: %d\n", *int_p);
    
    return 0;
}

/**
 * 因为调用free()函数之后，malloc分配的内存区域是不会马上
 * 归还给操作系统的。因此，在调用完free()函数之后，还可以访
 * 问被释放内存块中的内容。但是，这种情况尽量不要发生。那么，
 * 这块内存区域究竟什么时候才会被归还给操作系统呢？通常情况下，
 * 要等到下次再次调用malloc()函数重新分配内存时，之前被释放
 * 的内存区域中的数据段才会被破坏，然后重新分配。总之，访问已
 * 经被释放的内存区域，一般会带来意想不到的后果，严重的情况下，
 * 会造成数据紊乱，甚至是程序崩溃。
 */
