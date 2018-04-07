//
//  main.cpp
//  0902-private和public
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 理解C++中个private和public关键字的作用
 */

#include <iostream>
#include <string>
using namespace std;

/**
 * 定义一个Human类
 */
class Human {
    
    // 成员属性
private:
    int age;
    
    // 成员方法(函数)
public:
    
    // 设置年龄
    void setAge(int userInput) {
        age = userInput;
    }
    
    // 读取年龄
    int GetAge() {
        if (age > 30)
            return age - 5;  // 如果年龄超过30岁，那么久减少5岁
        else
            return age;
    }
};

int main(void) {
    
    Human firstMan;
    firstMan.setAge(35);
    
    Human firstWoman;
    firstWoman.setAge(33);
    
    cout << "firstMan的年龄是: " << firstMan.GetAge() << endl;
    cout << "firstWoman的年龄是: " << firstWoman.GetAge() << endl;
    
    return 0;
}
