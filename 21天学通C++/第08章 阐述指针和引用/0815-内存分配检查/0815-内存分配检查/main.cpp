//
//  main.cpp
//  0815-内存分配检查
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用异常处理来检查内存分配是否成功
 */

#include <iostream>
using namespace std;

int main(void) {
    
    try {
        // 请求大量的内存
        int *pointsToManyNumbers = new int [0x1fffffff];
        
        // 释放掉这些内存
        delete [] pointsToManyNumbers;
    }
    
    catch (bad_alloc) {
        cout << "内存分配失败，程序结束！" << endl;
    }
    
    return 0;
}
