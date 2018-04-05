//
//  main.cpp
//  0304-整型变量溢出的负面影响
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 演示有符号整型变量和无符号整型变量溢出的负面影响
 */

#include <iostream>
using namespace std;

int main(void) {
    
    unsigned short uShortValue = 65535;
    cout << "增加unsigned short类型的整数 " << uShortValue << " 将导致结果变为: ";
    cout << ++uShortValue << endl;
    
    short signedShort = 32767;
    cout << "增加signed short类型的整数 " << signedShort << " 将导致结果变为: ";
    cout << ++signedShort << endl;
    
    return 0;
}
