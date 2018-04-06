//
//  main.cpp
//  0710-内联函数
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 把整数翻倍的函数声明为内联函数
 */

#include <iostream>
using namespace std;

/**
 * 对输入的整数进行翻倍
 * - 参数inputNumber: 用户输入的整数，也是需要进行翻倍的整数
 * - 返回值: 返回一个经过翻倍之后的整数
 */
inline long DoubleNumber(int inputNumber) {
    
    return inputNumber * 2;
}

int main(void) {
    
    cout << "请输入一个整数: ";
    int inputNumber = 0;
    cin >> inputNumber;
    
    // 调用内联函数
    cout << "翻倍以后的数字是: " << DoubleNumber(inputNumber) << endl;
    
    return 0;
}

/**
 * (1)、碰到关键字inline时，编译器会将其视为某种请求，即将使用inline修饰的函数的内容
 * 直接放到调用它的地方，以提高代码的执行速度。
 * (2)、但是，应该要注意，内联函数也是有一定的副作用的！将函数声明为内联函数会导致代码的
 * 急剧膨胀，尤其是当声明为内联的函数本身做了大量复杂的处理时，副作用更明显。应该尽
 * 可能的少用、慎用inline关键字，仅当函数非常简单，并且需要降低其开销时，才使用inline
 */
