//
//  main.cpp
//  0503-相等运算符和关系运算符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 演示相等运算符和关系运算符
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "请输入两个整数。" << endl;
    int firstValue = 0, secondValue = 0;
    cout << "第一个整数: ";
    cin >> firstValue;
    cout << "第二个整数: ";
    cin >> secondValue;
    
    // 判断这两个整数是否相等
    bool isEqual = (firstValue == secondValue);
    cout << "这两个整数相等吗？: " << isEqual << endl;
    
    cout << endl;
    
    // 判断这两个整数是否不等
    bool isUnequal = (firstValue != secondValue);
    cout << "这两个整数不相等吗？: " << isUnequal << endl;
    
    cout << endl;
    
    // 判断这两个整数的大小
    bool isGreaterThan = (firstValue > secondValue);
    cout << "第一个整数比第二个整数要大吗？: " << isGreaterThan << endl;
    
    cout << endl;
    
    // 还是判断这两个整数的大小
    bool isLessThan = (firstValue < secondValue);
    cout << "第一个整数比第二个整数要小吗？: " << isLessThan << endl;
    
    cout << endl;
    
    // 可不就是判断这两个整数的大小么
    bool isGreaterThanEquals = (firstValue >= secondValue);
    cout << "第一个整数要大于或者等于第二个整数吗？: " << isGreaterThanEquals << endl;
    
    cout << endl;
    
    // 最后还是判断这两个整数的大小
    bool isLessThanEquals = (firstValue <= secondValue);
    cout << "第一个整数要小于或者等于第二个整数吗？: " << isLessThanEquals << endl;
}
