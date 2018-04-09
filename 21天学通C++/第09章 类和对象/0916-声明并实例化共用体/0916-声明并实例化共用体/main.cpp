//
//  main.cpp
//  0916-声明并实例化共用体
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 声明并实例化共用体
 */

#include <iostream>
using namespace std;

// 共用体
union SimpleUnion {
    int num;
    char alphabet;
};

// 结构体
struct ComplexType {
    
    enum DataType {
        Int,
        Char
    } Tpye;
    
    union Value {
        int num;
        char alphabet;
        
        // 构造函数
        Value() {}
        
        // 析构函数
        ~Value() {}
    } value;
};

void DisplayComplexType(const ComplexType &obj) {
    
    switch (obj.Tpye) {
        case ComplexType::Int:
            cout << "Union contains number: " << obj.value.num << endl;
            break;
            
        case ComplexType::Char:
            cout << "Union contains character: " << obj.value.alphabet << endl;
            break;
    }
}

int main(void) {
    
    SimpleUnion u1, u2;
    u1.num = 2100;
    u2.alphabet = 'C';
    
    cout << "sizeof(u1) containing integer: " << sizeof(u1) << endl;
    cout << "sizeof(u2) containing character: " << sizeof(u2) << endl;
    
    cout << endl;
    
    ComplexType myData1, myData2;
    myData1.Tpye = ComplexType::Int;
    myData1.value.num = 2017;
    myData2.Tpye = ComplexType::Char;
    myData2.value.num = 'X';
    
    DisplayComplexType(myData1);
    DisplayComplexType(myData2);
    
    return 0;
}
