//
//  main.cpp
//  0504-初识逻辑运算符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 分析C++逻辑运算符&&和||
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请输入true(1)，或者false(0): " << endl;
    bool op1 = false, op2 = false;
    cout << "第一个变量op1: ";
    cin >> op1;
    cout << "第二个变量op2: ";
    cin >> op2;
    
    cout << op1 << " && " << op2 << " = " << (op1 && op2) << endl;
    cout << op1 << " || " << op2 << " = " << (op1 || op2) << endl;
    
    return 0;
}
