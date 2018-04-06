//
//  main.cpp
//  0712-lambda函数
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用lambda函数对数组中的元素进行排序并显示它们
 */

#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

/**
 * 显示数组中的元素
 * - 参数dynArray: 表示一个动态数组
 */
void DisplayNumbers(vector<int> &dynArray) {
    
    // lambda函数相当于Objective-C中的block，Swift中的闭包
    // 使用STL算法中的for_each遍历数组中的每个元素
    for_each(dynArray.begin(), dynArray.end(), [](int Element){
        cout << Element << " ";
    });
    
    cout << endl;
}

int main(void) {
    
    // 声明一个动态数组
    vector<int> myNums;
    
    // 将数组元素依次压入数组中
    myNums.push_back(21);
    myNums.push_back(-1);
    myNums.push_back(25);
    myNums.push_back(35);
    myNums.push_back(99);
    myNums.push_back(-37);
    
    // 显示数组中的元素
    cout << "元素myNums中的元素依次为: " << endl;
    DisplayNumbers(myNums);
    
    // 对数组中的元素执行降序排序
    cout << "对上面的数据进行降序排序: " << endl;
    sort(myNums.begin(), myNums.end(), [](int value1, int value2) {
        return value1 > value2;
    });
    
    // 再次显示数组中的元素
    DisplayNumbers(myNums);
    
    return 0;
}
