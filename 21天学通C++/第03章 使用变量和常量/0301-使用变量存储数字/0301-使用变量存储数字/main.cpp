//
//  main.cpp
//  0301-使用变量存储数字
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用变量存储数字及其相乘的结果
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 声明两个整型变量
    int value1, value2;
    
    // 声明并初始化一个整型变量
    int result = 0;
    
    cout << "本程序用于计算两个数的乘法。" << endl;
    
    cout << "请输入第一个整数: ";
    cin >> value1;
    cout << "请输入第二个整数: ";
    cin >> value2;
    
    // 计算两个整数的乘积
    result = value1 * value2;
    
    cout << value1 << " * " << value2;
    cout << " = " << result << endl;
    
    return 0;
}
