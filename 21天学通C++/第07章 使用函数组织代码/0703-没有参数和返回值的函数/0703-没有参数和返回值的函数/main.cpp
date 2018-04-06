//
//  main.cpp
//  0703-没有参数和返回值的函数
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 编写一个没有参数和返回值的函数
 */

#include <iostream>
using namespace std;

// 函数原型的声明
void SayHello();

int main(void) {
    
    SayHello();
    
    return 0;
}

/**
 * 输出一句问候语
 */
void SayHello() {
    
    cout << "Hello, C++!" << endl;
}
