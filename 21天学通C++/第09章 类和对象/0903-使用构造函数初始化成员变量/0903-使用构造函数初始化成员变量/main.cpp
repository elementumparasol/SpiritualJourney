//
//  main.cpp
//  0903-使用构造函数初始化成员变量
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用构造函数来初始化成员变量
 */

#include <iostream>
#include <string>
using namespace std;

class Human {
    
private:
    string name;
    int age;
    
public:
    
    // 构造函数
    Human() {
        
        // 对成员属性进行初始化
        age = 1;
        cout << "创建一个Human实例变量。" << endl;
    }
    
    void SetName(string humansName) {
        name = humansName;
    }
    
    void SetAge(int humansAge) {
        age = humansAge;
    }
    
    void IntroduceSelf() {
        cout << "我的名字叫做" << name << "， 我今年" << age << "岁了。" << endl;
    }
};

int main(void) {
    
    Human firstMan;
    firstMan.SetAge(24);  // 如果这里忘记对成员变量age进行初始化也没关系，因为在创建Human实例的时候，就已经有默认的初始值
    firstMan.SetName("Jim");
    firstMan.IntroduceSelf();
    
    return 0;
}
