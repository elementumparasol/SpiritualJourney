//
//  main.cpp
//  0305-标准C++类型的长度
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 打印标准C++类型的长度
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "计算C++标准库中内建类型从长度:" << endl;
    
    cout << "size of bool: " << sizeof(bool) << endl;
    cout << "size of char: " << sizeof(char) << endl;
    cout << "size of unsigned short int: " << sizeof(unsigned short) << endl;
    cout << "size of short int: " << sizeof(short) << endl;
    cout << "size of unsigned long: " << sizeof(unsigned long) << endl;
    cout << "size of long: " << sizeof(long) << endl;
    cout << "size of int: " << sizeof(int) << endl;
    cout << "size of unsigned long long: " << sizeof(unsigned long long) << endl;
    cout << "size of long long: " << sizeof(long long) << endl;
    cout << "size of unsigned int: " << sizeof(unsigned int) << endl;
    cout << "size of float: " << sizeof(float) << endl;
    cout << "size of double: " << sizeof(double) << endl;
    
    cout << "当然，最终的输出结果是根据不同操作系统环境下的不同编译器而定的，也就是说，这个不是绝对的！" << endl;
    
    return 0;
}
