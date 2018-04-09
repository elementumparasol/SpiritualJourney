//
//  main.cpp
//  0912-使用关键字explicit
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用关键字explicit避免隐式转换
 */

#include <iostream>
using namespace std;

class Human {
    
    int age;
    
public:
    
    // 使用explicit关键字修饰构造函数，以避免隐式转换
    explicit Human(int humansAge) : age(humansAge) {}
};

void DoSomething(Human person) {
    
    cout << "Human send did something" << endl;
    return;
}

int main(void) {
    
    Human kid(10);
    Human anotherKid = Human(11);
    DoSomething(kid);
    
    return 0;
}
