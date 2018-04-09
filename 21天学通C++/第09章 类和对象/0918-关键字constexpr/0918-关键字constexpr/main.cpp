//
//  main.cpp
//  0918-关键字constexpr
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

class Human {
    
    int age;
    
public:
    constexpr Human(int humansAge) : age(humansAge) {}
    constexpr int GetAge() const {
        return age;
    }
};

int main(void) {
    
    constexpr Human somePerson(15);
    const int hisAge = somePerson.GetAge();
    
    Human anotherPerson(45);
    
    return 0;
}
