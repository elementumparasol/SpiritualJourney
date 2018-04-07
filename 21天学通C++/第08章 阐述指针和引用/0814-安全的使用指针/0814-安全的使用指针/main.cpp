//
//  main.cpp
//  0814-安全的使用指针
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 更安全的使用指针————对0813项目的修改
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "今天是晴空万里、阳光明媚吗？(y/n): ";
    char userInput = 'n';
    cin >> userInput;
    
    // 声明一个指针，并且对其进行初始化
    bool *const isSunny = new bool;  // 为指针分配内存(让指针指向有效的内存地址，也就是新分配的内存空间)
    *isSunny = true;  // 对指针所指向的地址进行初始化
    
    if (userInput == 'y') {
        *isSunny = false;
    }
    
    // 访问指针isSunny所指向的数据
    cout << "Boolen flag sunny says: " << *isSunny << endl;
    
    // 安全的释放分配的内存
    delete isSunny;
    
    // 注意，释放掉isSunny的内存之后，千万不要在使用它了！
    
    return 0;
}
