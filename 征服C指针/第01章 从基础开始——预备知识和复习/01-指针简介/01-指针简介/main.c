//
//  main.c
//  01-指针简介
//
//  Created by Enrica on 2018/4/19.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int hoge = 5;
    int piyo = 10;
    
    // 声明一个指向int类型的指针
    int *hoge_p;
    
    // 打印每个变量的地址
    printf("hoge的地址: %p\n", &hoge);
    printf("piyo的地址: %p\n", &piyo);
    printf("hoge_p的地址: %p\n", &hoge_p);
    
    // 将整形变量hoge的地址赋值给指针变量hope_p
    // 或者说，让指针变量hoge_p指向整型变量hoge
    hoge_p = &hoge;
    printf("hoge_p的地址: %p\n", hoge_p);
    
    // 通过指针变量hope_p输出整型变量hoge的值
    printf("变量hoge里面存储的值是: %d\n", *hoge_p);
    
    // 通过指针变量hoge_p修改整型变量hoge里面存储的值
    *hoge_p = 50;
    printf("变量hoge里面存储的值是: %d\n", hoge);
    
    return 0;
}
