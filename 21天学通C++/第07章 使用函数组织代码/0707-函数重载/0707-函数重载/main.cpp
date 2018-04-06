//
//  main.cpp
//  0707-函数重载
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 函数重载
 */

#include <iostream>
using namespace std;

const double pi = 3.14159265;

// 函数原型的声明
double Area(double radius);
double Area(double radius, double height);

int main(void) {
    
    cout << "请输入字符'z'选择计算圆柱体的表面积，输入字符'c'计算圆的表面积: ";
    char userOption = 'z';
    cin >> userOption;
    
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 计算圆柱体的表面积
    if (userOption == 'z') {
        cout << "请输入圆柱体的高度: ";
        double height = 0;
        cin >> height;
        
        cout << "圆柱体的表面积为: " << Area(radius, height) << endl;
    }
    
    else {
        cout << "圆的面积为: " << Area(radius) << endl;
    }
    
    return 0;
}

/**
 * 计算圆的面积
 * - 参数radius: 圆的半径
 * - 返回值: 返回圆的面积
 */
double Area(double radius) {
    return pi * radius * radius;
}

/**
 * 计算圆柱体的表面积
 * - 参数radius: 圆的半径
 * - 参数height: 圆柱体的高度
 * - 返回值: 返回圆柱体的表面积
 */
double Area(double radius, double height) {
    
    // 调用上面的Area(double radius)函数
    return 2 * Area(radius) + 2 * pi * radius * height;
}
