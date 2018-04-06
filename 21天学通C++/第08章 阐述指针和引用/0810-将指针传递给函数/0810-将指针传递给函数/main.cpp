//
//  main.cpp
//  0810-将指针传递给函数
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在计算圆面积的函数中使用关键字const
 */

#include <iostream>
using namespace std;

/**
 * 计算圆的面积
 * - 参数ptrPi: 表示圆周率的变量pi的内存地址
 * -ptrRadius: 表示圆的半径radius的内存地址
 * -ptrArea: 表示圆的面积的area的内存地址
 */
void CalculateArea(const double * const ptrPi, const double * const ptrRadius, double * const ptrArea) {
    
    if (ptrPi && ptrRadius && ptrArea)
        *ptrArea = (*ptrPi) * (*ptrRadius) * (*ptrRadius);
}

int main(void) {
    
    // 圆周率π
    const double pi = 3.14159265;
    
    // 输入圆的半径数据
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 用于存储圆的面积
    double area = 0;
    
    // 计算圆的面积
    CalculateArea(&pi, &radius, &area);
    
    // 显示计算结果
    cout << "圆的面积是: " << area << endl;
    
    return 0;
}
