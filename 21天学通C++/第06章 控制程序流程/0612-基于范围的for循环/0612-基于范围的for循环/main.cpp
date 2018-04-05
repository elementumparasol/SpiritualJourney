//
//  main.cpp
//  0612-基于范围的for循环
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用基于范围的for循环来处理数组和std::string
 */

#include <iostream>
#include <string>
using namespace std;

int main(void) {
    
    // 声明并初始化一个整型数组
    int someNumbers[] = { 1, 101, -1, 40, 2040 };
    
    for (const int& aNum: someNumbers)
        cout << aNum << ' ';  // 向屏幕输出aNum，以及空格
    cout << endl;
    
    cout << endl;
    
    for (auto anElement: { 5, 222, 110, -45, 2017 })
        cout << anElement << ' ';
    cout << endl;
    
    cout << endl;
    
    char charArray[] = { 'h', 'e', 'l', 'l', 'o' };  // 为毛没有结束符'\0'?
    for (auto aChar: charArray)
        cout << aChar << ' ';
    cout << endl;
    
    cout << endl;
    
    double moreNumbers[] = { 2.718, 3.141, -1,414, 1.732, 10101 };
    for (auto anElement: moreNumbers)
        cout << anElement << ' ';
    cout << endl;
    
    cout << endl;
    
    string sayHello{ "Hello, World!"};
    for (auto anElement: sayHello)
        cout << anElement << ' ';
    cout << endl;
    
    return 0;
}

/**
 * 基于范围的for循环书写格式：
 *  for (变量类型 变量名: 某个序列) { 循环体 } eg:
 *  for (int aNum: { 1, 3, 5, 7, 9}) { .... }
 */
