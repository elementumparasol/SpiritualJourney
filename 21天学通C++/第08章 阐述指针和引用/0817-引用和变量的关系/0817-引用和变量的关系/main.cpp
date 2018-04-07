//
//  main.cpp
//  0817-引用和变量的关系
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 引用是相应变量的别名
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int original = 30;
    cout << "original = " << original << endl;
    cout << "变量original的内存地址是: " << &original << endl;
    
    cout << endl;
    
    // 声明一个指针，并且让它指向变量original
    int &reference = original;
    cout << "指针reference的内存地址是: " << &reference << endl;
    
    cout << endl;
    
    // 在声明一个指针otherRefer，并且让它指向指针变量reference
    int &otherRefer = reference;
    cout << "指针otherRefer的内存地址是: " << &otherRefer << endl;
    cout << "otherRefer = " << otherRefer << endl;
    
    return 0;
}

/**
 * 从最后输出的结果来看，无论将引用初始化为变量，还是其它引用，它都指向相应的变量所在的内存单元。
 * 也就是说，其实引用就是变量的别名。
 */
