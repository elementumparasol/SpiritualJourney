//
//  main.cpp
//  0404-动态数组
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 创建int动态数组并动态的插入值
 */

#include <iostream>
#include <vector>
using namespace std;

int main(void) {
    
    // 动态的int数组
    vector<int> dynArray (3);
    
    dynArray[0] = 365;
    dynArray[1] = -421;
    dynArray[2] = 789;
    
    cout << "数组中目前有" << dynArray.size() << "个int元素。" << endl;
    cout << "请继续向数组dynArray中添加一个int元素: ";
    int newValue = 0;
    cin >> newValue;
    
    // 将新的元素插入到数组的末尾
    dynArray.push_back(newValue);
    
    cout << "数组中目前有" << dynArray.size() << "个int元素。" << endl;
    cout << "数组dynArray中最后一个元素是: ";
    cout << dynArray[dynArray.size() - 1] << endl;
    
    return 0;
}

/**
 * 使用动态数组的一个好处是，可以最大限度的节约内存空间，也就是不用提前规划
 * 存储空间(提前规划存储空间的坏处是，规划小了不够存；规划大了，浪费内存)，
 * 实际需要多少，动态的增加或者减少多少。
 */

