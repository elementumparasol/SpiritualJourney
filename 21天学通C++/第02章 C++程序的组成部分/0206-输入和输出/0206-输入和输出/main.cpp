//
//  main.cpp
//  0206-输入和输出
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用cin和cout显示用户的输入和输出
 */

#include <iostream>
#include <string>
using namespace std;

int main(void) {
    
    // 声明一个变量，用于存储用户输入的数据
    int inputNumber;
    string name;
    
    cout << "请输入一个整数: ";
    
    // 将用户输入的整数存储到变量inputNumber中
    cin >> inputNumber;
    
    cout << "请输入你的名字: ";
    cin >> name;
    
    cout << name << "，你输入了整数: " << inputNumber << endl;
    
    return 0;
}
