//
//  main.cpp
//  0608-使用while循环
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用while循环来让用户可以重复的计算
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 初始化任何一个不等于x的字符，以进入while循环
    char userInput = 'm';
    
    while (userInput != 'x') {
        
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
        
        cout << "按住字符x退出程序，或者其它任何字符继续: ";
        cin >> userInput;
    }
    
    cout << "狗头拜，不玩儿了！" << endl;
    
    return 0;
}
