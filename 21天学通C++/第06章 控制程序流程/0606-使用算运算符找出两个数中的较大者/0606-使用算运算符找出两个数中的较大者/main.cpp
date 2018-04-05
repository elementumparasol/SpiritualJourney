//
//  main.cpp
//  0606-使用算运算符找出两个数中的较大者
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用三目运算符来找出两个整数中的较大者
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请依次输入两个正整数。" << endl;
    int firstValue = 0, secondValue = 0;
    cout << "第一个整数: ";
    cin >> firstValue;
    cout << "第二个整数: ";
    cin >> secondValue;
    
    int max = (firstValue > secondValue) ? firstValue : secondValue;
    cout << firstValue << "和" << secondValue << "中较大的一个是: " << max << endl;
    
    return 0;
}
