//
//  main.cpp
//  0803-给指针变量重新赋值
//
//  Created by Enrica on 2018/4/7.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 给指针重新赋值，使其指向另外一个变量
 */

#include <iostream>
using namespace std;

int main(void) {
    
    int age = 30;
    
    // 定义一个int类型的指针变量，并且让它指向变量age
    int *pointToInt = &age;
    
    cout << "指向变量age的指针pointToInt的地址是: " << pointToInt << endl;
    
    int dogAge = 9;
    
    // 修改指针变量pointToInt，让它指向dogAge
    pointToInt = &dogAge;
    
    cout << "指向变量age的指针pointToInt的地址是: " << pointToInt << endl;
    
    return 0;
}
