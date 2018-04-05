//
//  main.cpp
//  0501-对整数执行算符运算
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 演示如何对用户输入的整数执行算术运算
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请依次输入两个整数。" << endl;
    int firstValue = 0, secondValue = 0;
    cout << "请输入第一个整数: ";
    cin >> firstValue;
    cout << "请输入第二个整数: ";
    cin >> secondValue;
    
    // 对上面两个整数执行算数运算
    cout << firstValue << " + " << secondValue << " = " << firstValue + secondValue << endl;
    cout << firstValue << " - " << secondValue << " = " << firstValue - secondValue << endl;
    cout << firstValue << " * " << secondValue << " = " << firstValue * secondValue << endl;
    cout << firstValue << " / " << secondValue << " = " << firstValue / secondValue << endl;
    cout << firstValue << " % " << secondValue << " = " << firstValue % secondValue << endl;
    
    return 0;
}
