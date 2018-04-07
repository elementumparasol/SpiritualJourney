//
//  main.cpp
//  0819-还是引用传递
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
void GetSquare(const int &number, int &result) {  // 为了禁止修改传入的参数number，我们在这里将其声明为const
    result = number * number;
}

int main(void) {
    
    cout << "请输入你要计算的整数: ";
    int userInput = 0;
    cin >> userInput;
    
    int square = 0;
    GetSquare(userInput, square);
    cout << userInput << "的平方值为: " << square << endl;
    
    return 0;
}
