//
//  main.cpp
//  0706-包含多条return语句的函数
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 包含多条return语句的函数
 */

#include <iostream>
using namespace std;

const double pi = 3.14159265;

/**
 * 计算圆的面积。如果有需要，还可以计算该圆的周长
 */
void QueryAndCalculate() {
    
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 计算圆的面积
    cout << "圆的面积为: " << pi * radius * radius << endl;
    
    // 是否需要计算圆的周长
    cout << "是否需要计算圆的周长？(y/n): ";
    char userOption = 'n';
    cin >> userOption;
    
    if (userOption == 'n') {
        return;
    }
    
    // 计算圆的周长
    cout << "圆的周长(circumference)为: " << 2 * pi * radius << endl;
    
    return;
}

int main(void) {
    
    QueryAndCalculate();
    
    return 0;
}
