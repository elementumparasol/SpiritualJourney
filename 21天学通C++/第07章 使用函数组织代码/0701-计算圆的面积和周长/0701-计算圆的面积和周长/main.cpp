//
//  main.cpp
//  0701-计算圆的面积和周长
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 根据圆的半径，分别计算该圆的面积和周长(使用函数)
 */

#include <iostream>
using namespace std;

// 常量
const double pi = 3.14159265;

// 计算圆的面积
double Area(double radius);  // 函数原型的声明

// 计算圆的周长
double Circumference(double radius);  // 函数原型的声明

int main(void) {
    
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 计算圆的面积
    cout << "圆的面积是: " << Area(radius) << endl;
    
    // 计算圆的周长
    cout << "圆的周长是: " << Circumference(radius) << endl;
    
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
 * 计算圆的周长
 * - 参数: 圆的半径
 * - 返回值: 返回圆的周长
 */
double Circumference(double radius) {
    
    return 2 * pi * radius;
}

/**
 * 函数原型指出了函数的名称、函数所接受的参数列表，以及函数的返回值。
 * 有了函数原型，我们就可以在main函数后面定义需要调用的函数了。
 */
