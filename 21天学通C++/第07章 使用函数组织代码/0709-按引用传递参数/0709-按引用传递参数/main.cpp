//
//  main.cpp
//  0709-按引用传递参数
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 以引用参数的形式进行传递
 */

#include <iostream>
using namespace std;

const double pi = 3.14159265;

/**
 * 计算圆的面积
 * - 参数radius: 表示圆的半径
 * - 参数result: 表示计算结果
 */
void Area(double radius, double &result) {
    
    // 因此这里的参数result是引用传递，因此
    // 在这个函数内部对result的值进行修改，
    // 函数外面同样也会收到更改之后的值
    result = pi * radius * radius;
}

int main(void) {
    
    cout << "请输入圆的半径: ";
    double radius = 0;
    cin >> radius;
    
    // 用于存储圆的面积
    double area = 0;
    
    // 计算圆的面积
    Area(radius, area);
    
    // 显示圆的面积
    cout << "圆的面积为: " << area << endl;
    
    return 0;
}
