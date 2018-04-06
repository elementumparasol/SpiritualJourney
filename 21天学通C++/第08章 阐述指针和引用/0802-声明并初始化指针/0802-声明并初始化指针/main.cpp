//
//  main.cpp
//  0802-声明并初始化指针
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 声明并初始化指针
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int age = 30;
    
    // 声明并初始化一个指针
    int *pointsToIng = &age;
    
    // 显示指针
    cout << "整数age的内存地址是: " << pointsToIng << endl;
    
    return 0;
}
