//
//  main.cpp
//  0510-确定变量占用的内存量
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用sizeof运算符来确定包含100个int元素 数组占用的内存量，以及每个元素所占用的内存量
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "使用sizeof运算符来计算一个数组所占用的内存量。" << endl;
    int myArray[100] = {0};  // 将数组中全部元素都一次性初始化为0
    
    cout << "一个int类型所占用的内存: " << sizeof(int) << endl;
    cout << "数组myArray所占用的内存量: " << sizeof(myArray) << endl;
    cout << "数组myArray中单个元素所占用的内存量: " << sizeof(myArray[0]) << endl;
    
    return 0;
}
