//
//  main.cpp
//  0711-自动推断函数的返回类型
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 自动推断函数的返回类型，这个使用C++ 14之后新增的功能
 */

#include <iostream>
using namespace std;

const double pi = 3.14159265;

/**
 * 计算圆的面积
 * - 参数radius: 圆的半径
 * - 返回值: 返回圆的面积，其类型有编译器根据返回值自动推断
 */
auto Area(double radius) {
    
    return pi * radius * radius;
}

int main(void) {
    
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 计算圆的面积
    cout << "圆的面积wei: " << Area(radius) << endl;
    
    return 0;
}
