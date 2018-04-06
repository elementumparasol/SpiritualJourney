//
//  main.cpp
//  0704-带有默认值的函数参数
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 设计一个计算圆的面积的函数，其中参数π的默认值为3.14
 */

#include <iostream>
using namespace std;

// 函数原型的声明
double Area(double radius, double pi = 3.14);

int main(void) {
    
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 是否需要提高π的精度
    cout << "π的默认值为3.14，是否需要提高π的精度？(y/n): ";
    char changePi = 'n';
    cin >> changePi;
    
    // 变量circleArea用于保存圆的面积
    double circleArea = 0;
    if (changePi == 'y') {
        
        // 如果需要提高π的精度
        cout << "请重新设置π的值: ";
        double newPi = 0;
        cin >> newPi;
        
        // 用新的π值来计算圆的面积
        circleArea = Area(radius, newPi);
    } else {
        
        // 还是用默认的π值来计算圆的面积
        circleArea = Area(radius);
    }
    
    // 显示圆的面积
    cout << "圆的面积是: " << circleArea << endl;
    
    return 0;
}

/**
 * 计算圆的面积
 * - 参数radius: 圆的半径
 * - 参数pi: 圆周率π的值，默认精度为3.14
 * - 返回值: 圆的面积
 */
double Area(double radius, double pi) {
    
    return pi * radius * radius;
}

/**
 * 和其它编程语言，比如说Swift中一样，C++里面也可以为函数参数提供默认值，并且
 * 有默认值的参数必须放在函数参数列表的后面。另外，如果在函数原型声明里面提供了
 * 默认值，那么在函数定义(也就是函数实现)时，就没有必要再一次设置默认值了。
 */
