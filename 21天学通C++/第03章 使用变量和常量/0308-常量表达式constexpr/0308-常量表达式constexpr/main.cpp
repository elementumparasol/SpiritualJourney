//
//  main.cpp
//  0308-常量表达式constexpr
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用常量表达式来计算pi的值
 */

#include <iostream>
using namespace std;

/**
 * 计算π的值
 */
constexpr double GetPi() {  // 这是一个常量表达式
    return 22.0 / 7;
}

/**
 * 计算两倍的π值
 */
constexpr double TwicePi() {
    return 2 * GetPi();  // 在常量表达式中使用另外一个常量表达式
}

int main(void) {
    
    // 声明一个常量并且赋值
    const double pi = 22.0 / 7;
    
    // 输出常量的值
    cout << "常量π = " << pi << endl;
    
    // 输出常量表达式GetPi()的返回值
    cout << "常量表达式GetPi()的返回值: " << GetPi() << endl;
    cout << "常量表达式TwicePi()的返回值: " << TwicePi() << endl;
    
    return 0;
}

/**
 * 常量表达式和函数看起来很像，但是实际上它们不是同一个东西，这主要是因为:
 *  (1)、函数在使用的时候需要调用，但是常量表达式却不需要调用；
 *  (2)、常量表达式的使用更为灵活，只要编译器能够从常量表达式中计算出常量，
 *      就可以在语句和表达式中可以使用常量的地方来使用常量表达式。
 */
