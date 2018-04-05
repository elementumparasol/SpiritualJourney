//
//  main.cpp
//  0508-位移运算符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用按位右移运算符(>>)和按位左移运算符(<<)分别计算整数的1/4和1/2，以及2倍和4倍
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请输入一个整数: ";
    int inputNumber = 0;
    cin >> inputNumber;
    
    int halfNumber = inputNumber >> 1;
    int quarterNumber = inputNumber >> 2;
    int doubleNumber = inputNumber << 1;
    int quadrupleNumber = inputNumber << 2;
    
    cout << "四分之一: " << quarterNumber << endl;
    cout << "二分之一: " << halfNumber << endl;
    cout << "两倍: " << doubleNumber << endl;
    cout << "四倍: " << quadrupleNumber << endl;  // triple表示三倍，quadruple表示四倍
    
    return 0;
}
