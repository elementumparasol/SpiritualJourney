//
//  main.cpp
//  0816-使用new(nothrow)检查内存分配情况
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用new(nothrow)，它在分配内存失败时返回NULL
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 使用new(nothrow)请求大量的内存
    int *const pointsToManyNumbers = new(nothrow) int [0x1fffffff];
    
    // 检查指针pointsToManyNumbers是否为空(pointsToManyNumbers != NULL)
    if (pointsToManyNumbers) {
        
        // 释放掉内存
        delete [] pointsToManyNumbers;
    }
    
    else {
        cout << "内存分配失败，程序结束！" << endl;
    }
    
    return 0;
}
