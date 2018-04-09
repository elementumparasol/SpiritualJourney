//
//  main.cpp
//  0914-使用friend关键字让外部函数访问私有成员
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用关键字friend让外部函数能够访问私有数据成员
 */

#include <iostream>
#include <string>
using namespace std;

class Human {
private:
    
    // 声明一个友元函数，通过它来访问私有的age变量
    friend void DisplayAge(const Human &person);
    string name;
    int age;
    
public:
    Human(string humansName, int humansAge) {
        name = humansName;
        age = humansAge;
    }
};

void DisplayAge(const Human &person) {
    cout << "person.age = " << person.age << endl;
}

int main(int argc, const char * argv[]) {
    
    Human firstMan("Adam", 25);
    
    cout << "通过友元函数访问私有成员age中的数据: " ;
    DisplayAge(firstMan);
    
    return 0;
}
