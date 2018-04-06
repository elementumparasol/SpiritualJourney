//
//  main.cpp
//  0804-解除引用运算符
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用解除引用运算符(*)来访问整数值
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int age = 30;
    int dogAge = 9;
    
    cout << "age = " << age << endl;
    cout << "dogAge = " << dogAge << endl;
    
    cout << endl;
    
    // 声明一个int类型的指针变量，并且将其初始化为变量age的内存地址
    int *pointToInt = &age;
    cout << "指针变量pointToInt目前指向age变量。" << endl;
    
    // 显示指针变量pointToInt的值
    cout << "pointToInt = " << pointToInt << endl;
    
    // 显示指针变量所指向变量的值(它现在是指向了变量age)
    cout << "*pointToInt = " << dec << *pointToInt << endl;
    
    cout << endl;
    
    pointToInt = &dogAge;
    cout << "指针变量pointToInt现在指向dogAge变量。" << endl;
    cout << "pointToInt = " << hex << pointToInt << endl;
    cout << "*pointToInt = " << dec << *pointToInt << endl;
    
    return 0;
}
