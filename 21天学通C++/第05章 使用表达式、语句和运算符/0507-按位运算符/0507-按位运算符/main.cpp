//
//  main.cpp
//  0507-按位运算符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 对整数的各位执行或、且、非，以及异或运算符，以演示按位运算符的用法
 */

#include <iostream>
#include <bitset>
using namespace std;

int main(void) {
    
    cout << "请输入一个0~255的整数: ";
    unsigned short inputNumber = 0;
    cin >> inputNumber;
    
    cout << endl;
    
    bitset<8> inputBits (inputNumber);
    cout << inputNumber << " 转换成二进制是: " << inputBits << endl;
    
    cout << endl;
    
    bitset<8> bitwiseNOT = (~inputNumber);
    cout << "逻辑非~" << endl;
    cout << "~" << inputBits << " = " << bitwiseNOT << endl;
    
    cout << endl;
    
    cout << "逻辑与, & 00001111" << endl;
    bitset<8> bitwiseAND = (0x0F & inputNumber);  // 0x0F就是00001111
    cout << "00001111 & " << inputBits << " = " << bitwiseAND << endl;
    
    cout << endl;
    
    cout << "逻辑或， | 00001111" << endl;
    bitset<8> bitwiseOR = (0x0F | inputNumber);
    cout << "00001111 | " << inputBits << " = " << bitwiseOR << endl;
    
    cout << endl;
    
    cout << "逻辑异或, ^ 00001111" << endl;
    bitset<8> bitwiseXOR = (0x0F ^ inputNumber);
    cout << "00001111 ^ " << inputBits << " = " << bitwiseXOR << endl;
    
    return 0;
}
