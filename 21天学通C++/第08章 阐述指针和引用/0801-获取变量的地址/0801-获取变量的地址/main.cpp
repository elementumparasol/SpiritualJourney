//
//  main.cpp
//  0801-获取变量的地址
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 获取int变量和double变量的地址
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int age = 30;
    const double pi = 3.14159265;
    
    // 通过引用运算符(&)获取变量的地址
    cout << "整型变量age在内存中的地址是: 0x" << &age << endl;
    cout << "double类型的变量pi在内存中的地址是: 0x" << &pi << endl;
    
    return 0;
}
