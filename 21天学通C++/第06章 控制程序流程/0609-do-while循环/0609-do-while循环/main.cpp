//
//  main.cpp
//  0609-do-while循环
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用do-while循环来进行重复执行代码
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 因为do-while不管条件是否成立，都会至少执行
    // 一次循环。因此，即便这里将userInput初始化
    // 为字符x，它仍然可以进入循环。实际上，这里将其
    // 初始化任何字符，它最终都会进入do-while循环
    char userInput = 'x';
    
    do {
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
    } while (userInput != 'x');  // 当userInput不等于x时，才会接着循环
    
    cout << "狗头拜，不玩儿了！" << endl;
    
    return 0;
}
