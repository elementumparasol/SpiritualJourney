//
//  main.cpp
//  0904-构造函数重载
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 包含多个构造函数的Human类
 */

#include <iostream>
#include <string>
using namespace std;

class Human {
    
private:
    string name;
    int age;
    
public:
    
    // 第一个构造函数，无参数
    Human() {
        // 对成员变量age进行初始化
        age = 1;
        cout << "age = " << age << endl;
    }
    
    // 第二个构造函数，有参数
    Human(string humansName, int humansAge) {
        
        // 对成员变量name和age都进行初始化
        name = humansName;
        age = humansAge;
        cout << "我的名字是" << name << "， 今年" << age << "岁了。" << endl;
    }
};


int main(void) {
    
    // 使用默认的构造函数创建一个实例对象
    Human firstWoman;
    
    // 使用重载的构造函数创建一个实例对象
    Human firstMan("enrica", 20);
    
    return 0;
}
