//
//  main.cpp
//  0610-使用for循环来填充和显示静态数组
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用for循环来填充和显示静态数组中的元素
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 定义静态数组的长度
    const int ARRAY_LENGTH = 5;
    int myArray[ARRAY_LENGTH] = { 0 };  // 将静态数组中所有的元素都初始化为0
    
    cout << "数组myArray中的元素构成如下: " << endl;
    for (int i = 0; i < ARRAY_LENGTH; i++) {
        cout << "请输入数组myArray的第" << i + 1 << "个元素: ";
        cin >> myArray[i];
    }
    
    cout << endl;
    
    cout << "遍历数组myArray中所有的元素: " << endl;
    for (int i = 0; i < ARRAY_LENGTH; i++) {
        cout << "myArray[" << i << "] = " << myArray[i] << endl;
    }
    
    return 0;
}
