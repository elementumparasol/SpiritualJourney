//
//  main.cpp
//  0607-goto语句
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用goto语句询问用户是否需要重新计算
 */

#include <iostream>
using namespace std;

int main(void) {
    
Start:
    int firstValue = 0, secondValue = 0;
    cout << "请依次输入两个整数。" << endl;
    cout << "第一个整数: ";
    cin >> firstValue;
    cout << "第二个整数: ";
    cin >> secondValue;
    
    cout << firstValue << " * " << secondValue << " = ";
    cout << firstValue * secondValue << endl;
    cout << firstValue << " + " << secondValue << " = ";
    cout << firstValue + secondValue << endl;
    
    cout << "还想继续玩儿吗?(y/n): ";
    char userInput = 'y';
    cin >> userInput;
    
    // 如果用户还想继续玩儿，则跳转到Start
    if (userInput == 'y')
        goto Start;
    
    cout << "狗头拜，不玩儿了！" << endl;
    
    return 0;
}
