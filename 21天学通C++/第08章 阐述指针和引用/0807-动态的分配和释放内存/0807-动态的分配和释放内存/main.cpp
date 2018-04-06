//
//  main.cpp
//  0807-动态的分配和释放内存
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用解除引用运算符(*)访问使用new分配的内存，并且使用delete释放它
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 为指向int类型变量的指针分配内存空间
    int *pointToInt = new int;
    
    cout << "请输入一个整数: ";
    
    // 将整数存入指针pointToInt所指向的变量(或者说新分配的内存中)
    cin >> *pointToInt;
    
    cout << "整数" << *pointToInt << "存储在: " << hex << pointToInt << " 这段内存中" << endl;
    
    // 释放手动分配的内存，否则会产生内存泄漏
    delete pointToInt;
    
    return 0;
}

/**
 * 静态内存分配的缺点很明显，要么内存空间不够用，要么浪费。最好的办法是动态的分配内存，
 * 也就是要多少，分配多少，既不多分配，也不少分配。动态的分配内存使用关键字new，释放
 * 已经分配的内存用关键字delete。new和delete是成对出现的，有new就一定要有delete。
 * 如果不是由new分配的内存，则不能使用delete。
 * 必须注意，手动通过new分配的内存一定要及时的释放，否则会产生内存泄漏，影响程序的性能。
 */
