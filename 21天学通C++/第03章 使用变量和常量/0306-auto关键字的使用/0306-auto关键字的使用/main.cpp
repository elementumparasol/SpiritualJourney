//
//  main.cpp
//  0306-auto关键字的使用
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用关键字auto来实现类型推断
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 在C++中，关键字auto可以用来进行类型推断。不过，这个功能
    // 是个垃圾！为什么呢？因为auto关键字需要根据变量所赋的初值
    // 来进行推断。既然我都已经知道了变量的初值，那当然也就知道了
    // 变量的真实类型，那为什么还要使用auto？这个不如Swift中的
    // 类型推断。最重要的是，Swift中的类型推断不需要显式的使用
    // auto，所有的功能完全是由编译器在后台进行处理的。
    auto largeNumber = 1234567890987654321;
    auto isLarge = true;
    
    cout << "largeNumber = " << largeNumber;
    cout << "， largeNumber的长度是: " << sizeof(largeNumber) << endl;
    
    cout << "isLarge = " << isLarge;
    cout << "， isLarge的长度是: " << sizeof(isLarge) << endl;
    
    return 0;
}
