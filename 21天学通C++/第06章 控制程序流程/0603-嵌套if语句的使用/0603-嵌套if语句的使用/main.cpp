//
//  main.cpp
//  0603-嵌套if语句的使用
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用嵌套if语句执行乘法或者除法运算
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请依次输入两个实数。" << endl;
    float firstValue = 0.0, secondValue = 0.0;
    cout << "第一个实数: ";
    cin >> firstValue;
    cout << "第二个实数: ";
    cin >> secondValue;
    
    cout << "输入字符\'d\'执行除法运算，输入其它字符执行乘法运算: ";
    char userOption = '\0';
    cin >> userOption;
    
    // 根据用户选择来执行乘法运算或者除法运算
    if (userOption == 'd') {
        cout << "程序接下来将执行除法运算。" << endl;
        
        if (secondValue != 0) {
            cout << firstValue << " / " << secondValue << " = " << firstValue / secondValue << endl;
        } else {
            cout << "0不能作为除数！" << endl;
        }
    } else {
        cout << "接下来将执行乘法运算。" << endl;
        cout << firstValue << " * " << secondValue << " = " << firstValue * secondValue << endl;
    }
    
    return 0;
}
