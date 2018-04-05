//
//  main.cpp
//  0204-函数的简单使用
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 函数的声明、定义和调用
 */

#include <iostream>
using namespace std;

// 声明一个函数
int DemoConsoleOutput();

int main(void) {
    
    // 调用函数
    DemoConsoleOutput();
    
    return 0;
}

// 定义函数
int DemoConsoleOutput() {
    
    cout << "3 / 4 = " << 3.0 / 4 << endl;
    
    return 0;
}
