//
//  main.cpp
//  0307-声明一个常量
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用关键字const声明一个常量
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 声明一个常量pi。在Swift中，使用关键字let来声明一个
    // 常量，使用关键字var来声明一个变量。而在C++中，所有
    // 没有使用关键字const声明的variable都被认为是变量，
    // 而只有通过关键字const声明的才是常量
    const double pi = 22.0 / 7;
    
    cout << "π约等于: " << pi << endl;
    
    return 0;
}
