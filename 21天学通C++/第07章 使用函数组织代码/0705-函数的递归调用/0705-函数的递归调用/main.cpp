//
//  main.cpp
//  0705-函数的递归调用
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用函数递归调用的方式来计算斐波拉契数列中的数字
 */

#include <iostream>
using namespace std;

/**
 * 计算斐波拉契数字
 * - 参数n: 表示数列中的元素
 * - 返回值: 返回斐波拉契数字
 */
int Fibonacci(int n) {
    
    if (n < 2)
        return n;
    else
        return Fibonacci(n - 1) + Fibonacci(n - 2);
}

int main(void) {
    
    cout << "请输入一个大于0的整数: ";
    int number = 0;
    cin >> number;
    
    cout << "斐波拉契数字为: " << Fibonacci(number) << endl;
    
    return 0;
}
