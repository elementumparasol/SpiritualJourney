//
//  main.cpp
//  0702-计算圆柱体的表面积
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 编写一个函数，它接收两个参数以计算圆柱体的表面积
 */

#include <iostream>
using namespace std;

const double pi = 3.14159265;

// 函数原型的声明
double SurfaceArea(double radius, double height);

int main(void) {
    
    cout << "请输入圆柱体的半径: ";
    double radius = 0;
    cin >> radius;
    
    cout << "请输入圆柱体的高度: ";
    double height = 0;
    cin >> height;
    
    // 计算圆柱体的表面积
    cout << "该圆柱体的表面积是: " << SurfaceArea(radius, height) << endl;
    
    return 0;
}

/**
 * 计算圆柱体的表面积
 * - 参数radius: 圆柱体的半径
 * - 参数height: 圆柱体的高度
 * - 返回值: 圆柱体的表面积
 */
double SurfaceArea(double radius, double height) {
    
    return 2 * pi * radius * radius + 2 * pi * radius * height;
}
