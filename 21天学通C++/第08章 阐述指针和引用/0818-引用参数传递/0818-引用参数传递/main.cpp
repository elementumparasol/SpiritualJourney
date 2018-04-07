//
//  main.cpp
//  0818-引用参数传递
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算平方值，通过引用参数返回结果
 */

#include <iostream>
using namespace std;

/**
 * 返回整数的平方值
 * - 参数number: 参与运算的整数
 */
void GetSquare(int &number) {
    number *= number;  // number = number * number;
}

int main(void) {
    
    cout << "请输入你要计算的整数: ";
    int userInput = 0;
    cin >> userInput;
    
    cout << "整数" << userInput << "的平方值是: ";
    
    // 计算平方值
    GetSquare(userInput);
    cout << userInput << endl;
    
    return 0;
}
