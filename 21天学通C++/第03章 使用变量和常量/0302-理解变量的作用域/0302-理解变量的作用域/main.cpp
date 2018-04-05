//
//  main.cpp
//  0302-理解变量的作用域
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 理解变量的作用域
 */

#include <iostream>
using namespace std;

void MultiplyNumbers() {
    
    cout << "请输入第一个整数: ";
    int firstValue;
    cin >> firstValue;
    
    cout << "请输入第二个整数: ";
    int secondValue;
    cin >> secondValue;
    
    // 计算这两个证书费的乘积
    int reslut = firstValue * secondValue;
    
    // 显示计算结果
    cout << firstValue << " * " << secondValue << " = " << reslut << endl;
}

int main(void) {
    
    cout << "本程序将用于计算两个整数的乘积。" << endl;
    
    MultiplyNumbers();
    
    return 0;
}

/**
 * 需要注意的是，变量firstValue和secondValue只能在函数MultiplyNumbers中使用，
 * 它们的作用域也仅限于该函数中，一旦在该函数之外使用这两个变量，将会产生编译错误。
 */
