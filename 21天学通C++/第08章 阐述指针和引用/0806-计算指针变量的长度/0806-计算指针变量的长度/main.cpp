//
//  main.cpp
//  0806-计算指针变量的长度
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用sizeof来计算指针变量的长度
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "sizeof(char) = " << sizeof(char) << endl;
    cout << "sizeof(int) = " << sizeof(int) << endl;
    cout << "sizeof(double) = " << sizeof(double) << endl;
    
    cout << endl;
    
    cout << "sizeof(char *) = " << sizeof(char *) << endl;
    cout << "sizeof(int *) = " << sizeof(int *) << endl;
    cout << "sizeof(double *) = " << sizeof(double *) << endl;
    
    return 0;
}

/**
 * 不管指针最终指向的是1字节的变量，还是8字节的变量，指针本身所需的存储空间都是相同的(8字节)，
 */
