//
//  main.cpp
//  0611-使用for循环来重复执行一段代码
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用for循环来重复执行一段代码
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // for循环中最后一个条件，也就是userSelection的该变量是缺失的，不过这
    // 并不影响for循环的正常运行，应为它的第二个条件userSelection != 'x'
    // 可以保证循环的正常运行和结束(其实，条件的改变量是放在for循环体内部的)
    // for (初始化表达式; 条件表达式; 循环该变量) {循环体};
    for (char userSelection = 'm'; (userSelection != 'x'); ) {
        
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
        cin >> userSelection;
    }
    
    cout << "狗头拜，不玩儿了！" << endl;
    
    return 0;
}
