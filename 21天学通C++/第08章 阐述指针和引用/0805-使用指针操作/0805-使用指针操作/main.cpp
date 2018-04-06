//
//  main.cpp
//  0805-使用指针操作
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用指针和解除引用运算符操纵数据
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int dogAge = 9;
    cout << "dogAge = " << dogAge << endl;
    
    int *pointToInt = &dogAge;
    cout << "此时指针变量pointToInt是指向变量dogAge的。" << endl;
    cout << "指针变量pointToInt的内存地址是: " << pointToInt << endl;
    
    cout << "请输入一个整数，用来修改变量dogAge的值: ";
    
    // 直接通过指针，将用户输入的数据赋值给指针变量所指向的dogAge变量
    cin >> *pointToInt;
    cout << "此时指针变量pointToInt所指向变量的值是: " << dogAge << endl;
    cout << "指针变量pointToInt的内存地址是: " << pointToInt << endl;
    
    return 0;
}
