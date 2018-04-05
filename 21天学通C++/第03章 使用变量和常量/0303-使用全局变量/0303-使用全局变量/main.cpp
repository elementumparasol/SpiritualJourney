//
//  main.cpp
//  0303-使用全局变量
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用全局变量
 */

#include <iostream>
using namespace std;

// 定义全局变量
int firstNumber = 0;
int secondNumber = 0;
int result = 0;

/**
 * 用于计算两个整数的乘积
 */
void MultiplyNumbers() {
    
    cout << "本程序用于计算两个整数的乘积。" << endl;
    cout << "请输入第一个整数: ";
    cin >> firstNumber;
    
    cout << "请输入第二个整数: ";
    cin >> secondNumber;
    
    result = firstNumber * secondNumber;
    
    cout << firstNumber << " * " << secondNumber;
    cout << " = " << result << endl;
}

int main(void) {
    
    MultiplyNumbers();
    
    return 0;
}

/**
 * 注意，因为全局变量几乎能在任何函数中使用和修改，因此应该谨慎使用。
 */
