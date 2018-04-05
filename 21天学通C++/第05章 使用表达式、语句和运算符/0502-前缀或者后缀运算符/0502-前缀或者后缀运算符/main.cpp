//
//  main.cpp
//  0502-前缀或者后缀运算符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 查看前缀运算符和后缀运算符之间的差别
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int startValue = 101;
    cout << "开始进行自增或者自减操作的起始值: " << startValue << endl;
    
    int postfixIncrement = startValue++;
    cout << "后缀自增运算的结果: " << postfixIncrement << endl;  // 101
    cout << "执行后缀自增运算之后，startValue的值: " << startValue << endl;  // 102
    
    cout << endl;
    
    // 将startValue的值复位
    startValue = 101;
    int prefixIncrement = ++startValue;
    cout << "前缀自增运算的结果: " << prefixIncrement << endl;  // 102
    cout << "执行前缀自增运算之后，startValue的值: " << startValue << endl;  // 102
    
    cout << endl;
    
    startValue = 101;
    int postfixDecrement = startValue--;
    cout << "后缀自减运算的结果: " << postfixDecrement << endl;  // 101
    cout << "执行后缀自减运算之后，startValue的值: " << startValue << endl;  // 100
    
    cout << endl;
    
    startValue = 101;
    int prefixDecrement = --startValue;
    cout << "前缀自减运算的结果: " << prefixDecrement << endl;  // 100
    cout << "执行前缀自减运算之后，startValue的值: " << startValue << endl;  // 100
    
    return 0;
}

/**
 * 自增或者自减运算符在后面(即后缀)，则先用值，然后再执行自增或者自减操作；
 * 自增或者自减运算符在前面(即前缀)，则先执行自增或者自减操作，然后再用值。
 */
