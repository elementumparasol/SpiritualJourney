//
//  main.cpp
//  0901-C++中类的简介
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * C++中类的简介
 */

#include <iostream>
#include <string>
using namespace std;

/**
 * 定义一个Human类
 */
class Humam {
    
    // 成员属性
public:
    string name;
    int age;
    
    // 成员方法
    void IntroduceSelf() {
        cout << "我叫" << name << "，我今年" << age << "岁了。" << endl;
    }
};


int main(void) {
    
    // 创建一个Human对象
    Humam firstMan;
    firstMan.name = "LeBron James";
    firstMan.age = 33;
    
    // 再创建一个Human实例
    Humam firstWoman;
    firstWoman.name = "Eva";
    firstWoman.age = 20;
    
    // 调用Human对象的实例方法
    firstMan.IntroduceSelf();
    firstWoman.IntroduceSelf();
    
    return 0;
}
