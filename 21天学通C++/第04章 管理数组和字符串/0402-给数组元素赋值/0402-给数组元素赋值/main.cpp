//
//  main.cpp
//  0402-给数组元素赋值
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 给数组的元素赋值
 */

#include <iostream>
using namespace std;

// 常量表达式
constexpr int Square(int number) {
    return number * number;
}

int main(void) {
    
    // 数组的长度
    const int ARRAY_LENGTH = 5;
    
    int myNumbers[ARRAY_LENGTH] = {45, 81, 31, 92, -59};
    
    // 再声明一个更大的数组(存储的元素更多)
    int moreNumbers[Square(ARRAY_LENGTH)];  // 数组没有赋初值。正常情况下，数组应该要被初始化，否则里面会包含不可预料值
    
    cout << "输入需要修改元素的index: ";
    int elementIndex = 0;  // 初始化变量elementIndex
    cin >> elementIndex;  // 将输入的整数保存到变量elementIndex中，实际上elementIndex的取值应该是[0, 4]，后面再讨论
    
    cout << "请输入一个新的值: ";
    int newValue = 0;
    cin >> newValue;
    
    // 修改指定位置索引对应的值
    myNumbers[elementIndex] = newValue;
    
    // 修改指定索引对应元素的值
    moreNumbers[elementIndex] = newValue;
    
    cout << "索引" << elementIndex << "在数组myNumbers中所对应元素的值为: ";
    cout << myNumbers[elementIndex] << endl;
    
    cout << "索引" << elementIndex << "在数组moreNumbers中所对应元素的值为: ";
    cout << moreNumbers[elementIndex] << endl;
    
    return 0;
}
