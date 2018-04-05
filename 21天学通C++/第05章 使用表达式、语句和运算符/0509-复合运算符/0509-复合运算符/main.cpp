//
//  main.cpp
//  0509-复合运算符
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用复合赋值运算符执行各种操作
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请输入一个整数: ";
    int value = 0;
    cin >> value;
    
    value += 8;
    cout << "在执行+=8之后，value的值为: " << value << endl;
    
    cout << endl;
    
    value -= 2;
    cout << "在执行-=2之后，value的值为: " << value << endl;
    
    cout << endl;
    
    value /= 4;
    cout << "在执行/=4之后，value的值为: " << value << endl;
    
    cout << endl;
    
    value *= 4;
    cout << "在执行*=4之后，value的值为: " << value << endl;
    
    cout << endl;
    
    value %= 1000;
    cout << "在执行%=1000之后，value的值为: " << value << endl;
    
    return 0;
}
