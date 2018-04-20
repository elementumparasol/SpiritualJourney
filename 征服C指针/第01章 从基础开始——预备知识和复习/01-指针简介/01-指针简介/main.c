//
//  main.c
//  01-指针简介
//
//  Created by Enrica on 2018/4/19.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    // 定义两个int类型的变量
    int hoge = 5;
    int piyo = 10;
    
    // 声明一个指向int类型的指针
    int *hoge_p;
    
    // 打印每个变量的地址
    printf("hoge的地址: %p\n", &hoge);  // 获取int类型变量hoge的地址
    printf("piyo的地址: %p\n", &piyo);  // 获取int类型变量piyo的地址
    printf("hoge_p的地址: %p\n", &hoge_p);  // 获取int类型的指针变量hoge_p的地址
    
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

/**
 * 关于指针知识的补充:
 *  (1)、普通变量自身会存储一些数据，也有自己在内存中的地址；
 *  (2)、指针变量除了是用来存储其它变量的地址(指向其它变量)之外，也会有自己在内存中的地址；
 *  (3)、当我们说，指针变量中存储了其它普通变量的地址时，就说这个指针变量是指向该普通变量的。
 */
