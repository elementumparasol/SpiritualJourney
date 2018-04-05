//
//  main.cpp
//  0601-if-else语句示例
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 根据用户输入决定将两个正整数相乘还是相加
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请依次输入两个正整数。" << endl;
    int firstValue = 0, secondValue = 0;
    cout << "第一个正整数: ";
    cin >> firstValue;
    cout << "第二个正整数: ";
    cin >> secondValue;
    
    cout << "输入字母\'m\'来表示相乘，输入其它任何字符表示相加: ";
    char userOption = '\0';  // 将变量userOption初始化为空字符
    cin >> userOption;  // 保存操作选择符
    
    // 计算并显示结果
    int result = 0;
    if (userOption == 'm') {
        result = firstValue * secondValue;
        cout << firstValue << " * " << secondValue << " = " << result << endl;
    } else {
        result = firstValue + secondValue;
        cout << firstValue << " + " << secondValue << " = " << result << endl;
    }
        
    return 0;
}
