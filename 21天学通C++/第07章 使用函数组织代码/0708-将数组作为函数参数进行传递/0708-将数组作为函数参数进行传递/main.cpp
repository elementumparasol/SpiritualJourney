//
//  main.cpp
//  0708-将数组作为函数参数进行传递
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将一个整数数组作为参数传递给函数的参数
 */

#include <iostream>
using namespace std;

/**
 * 显示整数数组中所有的元素
 * - 参数numbers: 表示整数数组
 * - 参数length: 表示数组的长度
 */
void DisplayArray(int numbers[], int length) {
    
    // 遍历数组numbers
    for (int i = 0; i < length; i++) {
        cout << numbers[i] << " ";
    }
    
    cout << endl;
}

/**
 * 显示整数数组中所有的元素
 * - 参数characters: 表示整数数组
 * - 参数length: 表示数组的长度
 */
void DisplayArray(char characters[], int length) {
    
    // 遍历数组characters
    for (int i = 0; i < length; i++) {
        cout << characters[i] << " ";
    }
    
    cout << endl;
}

int main(void) {
    
    // 声明并初始化一个整型数组
    int myIntArray[] = {1, 3, 5, 7, 9};
    DisplayArray(myIntArray, sizeof(myIntArray) / sizeof(myIntArray[0]));
    
    // 声明并初始化一个字符数组
    char myCharArray[] = "enrica";  // 或者也可以这样初始化: {'e', 'n', 'r', 'i', 'c', 'a', '\0'} ，这两种初始化方式效果一样
    DisplayArray(myCharArray, sizeof(myCharArray) / sizeof(myCharArray[0]));
    
    return 0;
}
