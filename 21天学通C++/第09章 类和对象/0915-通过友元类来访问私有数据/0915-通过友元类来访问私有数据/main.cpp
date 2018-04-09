//
//  main.cpp
//  0915-通过友元类来访问私有数据
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用关键字friend来让外部类访问私有的成员变量
 */

#include <iostream>
#include <string>
using namespace std;

class Human {
    
private:
    
    // 声明一个友元类
    friend class Utility;
    string name;
    int age;
    
public:
    Human(string humansName, int humansAge) : name(humansName), age(humansAge) {}
};

class Utility {
    
public:
    static void DisplayAge(const Human &person) {
        cout << "person.age = " << person.age << endl;
    }
};

int main(void) {
    
    Human firstMan ("James", 33);
    
    cout << "通过友元类来访问私有的成员变量: ";
    Utility::DisplayAge(firstMan);
    
    return 0;
}
