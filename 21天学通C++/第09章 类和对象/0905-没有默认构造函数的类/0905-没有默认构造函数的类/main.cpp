//
//  main.cpp
//  0905-没有默认构造函数的类
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 如果你在类的实现过程中，实现了重载的构造函数，那么编译器不会再为你生生默认的构造函数
 */

#include <iostream>
#include <string>
using namespace std;

class Human {
    
private:
    string name;
    int age;
    
public:
    Human(string humansName, int humansAge) {
        name = humansName;
        age = humansAge;
        cout << "构造函数重载";
    }
    
    void IntroduceSelf() {
        cout << "我叫" << name << "，今年" << age << "岁了。" << endl;
    }
};

int main(void) {
    
    Human firstMan("James", 24);
    Human firstWoman("Lucy", 20);
    
    firstMan.IntroduceSelf();
    firstWoman.IntroduceSelf();
    
    return 0;
}
