//
//  main.cpp
//  0613-continue和break
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用continue进入下一次循环，使用break退出无限循环
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 先干一个无限循环
    for (; ;) {
        int firstValue = 0, secondValue = 0;
        
        cout << "请依次输入两个整数。" << endl;
        cout << "第一个整数: ";
        cin >> firstValue;
        cout << "第二个整数: ";
        cin >> secondValue;
        
        // 如果上面的数据输入有误，还有重新输入的机会
        cout << "你想修改上面所输入的数据吗？(y/n): ";
        char changeNumbers = '\0';
        cin >> changeNumbers;
        
        if (changeNumbers == 'y')
            continue;  // 跳出当前循环，继续执行下一次循环
        
        cout << firstValue << " * " << secondValue << " = ";
        cout << firstValue * secondValue << endl;
        cout << firstValue << " + " << secondValue << " = ";
        cout << firstValue + secondValue << endl;
        
        cout << "按住字符x退出程序，或者其它任何字符继续: ";
        char userSelection = '\0';
        cin >> userSelection;
        
        if (userSelection == 'x')
            break;  // 直接退出所有的循环，不再执行for循环语句
    }
    
    cout << "狗头拜，不玩儿了！" << endl;
    
    return 0;
}
