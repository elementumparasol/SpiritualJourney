//
//  main.cpp
//  0811-数组变量是指向第一个元素的指针
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 数组变量是指向第一个元素的指针
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 声明一个静态数组
    int myNumbers[5];
    
    // 声明一个指向静态数组myNumbers的指针
    int *pointToInt = myNumbers;  // 注意，指向数组时，前面不用加取地址符&
    
    // 显示指针变量pointToInt的地址
    cout << "指针变量pointToInt的内存地址是: " << pointToInt << endl;
    
    // 数组myNumbers的第一个元素的内存地址是
    cout << "数组的第一个元素myNumbers[0]的内存地址是: " << &myNumbers[0] << endl;
    
    return 0;
}

/**
 * 数组变量就是指针，并且指向数组的指针和数组第1个元素的内存地址相同。
 * 要访问数组中某个元素，既可以通过Array[n]来访问，也可以通过指向数
 * 组的指针*(ptrArray + n)来访问
 */
