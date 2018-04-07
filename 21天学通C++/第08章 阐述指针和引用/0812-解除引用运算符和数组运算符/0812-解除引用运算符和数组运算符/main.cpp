//
//  main.cpp
//  0812-解除引用运算符和数组运算符
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

int main(void) {
    
    const int ARRAY_LENTH = 5;
    
    // 实例化一个静态数组
    int myNumbers[ARRAY_LENTH] = {24, -1, 365, -999, 2011};
    
    // 声明一个整型指针，并且让这个指针指向变量myNumbers
    int *pointToInt = myNumbers;  // 因为数组名就代表数组第一个元素的地址，因此前面不用加取地址符
    
    // 使用数组变量和间接运算符(解除引用运算符*)来输出数组中的元素
    cout << "通过解除引用运算符来输出数组中的元素" << endl;;
    for (int i = 0; i < ARRAY_LENTH; i++) {
        cout << "myNumbers[" << i << "] = " << *(myNumbers + i) << endl;
    }
    
    cout << endl;
    
    // 使用指针变量和数组运算符([])来输出数组中的元素
    cout << "通过指针和数组运算符来输出数组中的元素: " << endl;
    for (int i = 0; i < ARRAY_LENTH; i++) {
        cout << "myNumbers[" << i << "] = " << pointToInt[i] << endl;
    }
    
    return 0;
}
