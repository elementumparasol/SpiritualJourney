//
//  main.cpp
//  0906-有默认参数值的构造函数
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 接收带有默认值的参数的默认构造函数，并且使用初始化列表来初始化成员
 */

#include <iostream>
#include <string>
using namespace std;

class Human {
private:
    string name;
    int age;
    
public:
    Human(string humamsName = "enrica", int humansAge = 20):name(humamsName), age(humansAge) {
        cout << "构造函数的参数带有默认值，并且使用初始化列表来设置成员属性" << endl;
        cout << name << ", " << age << endl;
    }
};

int main(void) {
    
    Human firstMan;  // 使用默认的name和age
    
    cout << endl;
    
    Human firstWoman ("July");  // 仅使用默认的age，name重新赋值
    
    cout << endl;
    
    Human secondMan ("Jim", 24);  // name和age都重新赋值
    
    return 0;
}
