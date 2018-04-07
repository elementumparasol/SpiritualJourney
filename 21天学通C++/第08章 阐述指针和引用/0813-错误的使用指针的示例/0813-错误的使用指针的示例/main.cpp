//
//  main.cpp
//  0813-错误的使用指针的示例
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在存储布尔值的程序中，错误的使用指针
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 定义了一个bool类型的指针，但是没有对其进行初始化，这样很不好，
    // 因为它指向了无效的内存，这让访问结果可能变得无法预测
    bool *isSunny;  // 这是一个错误的演示，正确的做法是，要对指针进行初始化
    
    cout << "今天是否晴空万里，阳光明媚？(y/n): ";
    char userInput = 'y';
    cin >> userInput;
    
    if (userInput == 'y') {  // 因为指针isSunny没有被初始化，所以这里会有警告
        // 手动分配一个存储bool类型的内存空间，并且将其赋值给指针，
        // 但它只在用户输入y时才执行；一旦用户选择了n，那么这句代码
        // 就不会执行，也就是不会为指针分配内存空间，那么在第40行
        // 代码通过*isSunny访问数据时，就会访问无效的数据，从而导致
        // 程序崩溃。如果一开始就对指针isSunny进行了初始化，那么在
        // 第40行通过代码*isSunny访问数据时，就不会产生崩溃。不过，
        // 后面通过 delete isSunny;释放内存时又会产生崩溃，原因是
        // 释放了没有经过手动分配的内存空间。总之，这段代码问题很多
        isSunny = new bool;
        *isSunny = true;
    }
    
    // 访问指针isSunny所指向的数据
    cout << "Boolen flag sunny says: " << *isSunny << endl;
    
    // 释放内存
    delete isSunny;
    
    return 0;
}
