//
//  main.cpp
//  1007-构造顺序和析构顺序
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 父类、子类及其成员的构造顺序和析构顺序
 */

#include <iostream>
using namespace std;

class FishDummyMember {
    
public:
    
    // 构造函数
    FishDummyMember() {
        cout << "FishDummyMember的构造函数" << endl;
    }
    
    // 析构函数
    ~FishDummyMember() {
        cout << "FishDummyMember的析构函数" << endl;
    }
};

class Fish {
protected:
    FishDummyMember dummy;
    
public:
    
    // 构造函数
    Fish() {
        cout << "Fish的构造函数" << endl;
    }
    
    // 析构函数
    ~Fish() {
        cout << "Fish的析构函数" << endl;
    }
};

class TunaDummyMember {
public:
    
    // 构造函数
    TunaDummyMember() {
        cout << "TunaDummyMember的构造函数" << endl;
    }
    
    // 析构函数
    ~TunaDummyMember() {
        cout << "TunaDummyMember的析构函数" << endl;
    }
};

class Tuna: public Fish {
    
private:
    TunaDummyMember dummy;
    
public:
    
    // Tuna的构造函数
    Tuna() {
        cout << "Tuna的构造函数" << endl;
    }
    
    // Tuna的析构函数
    ~Tuna() {
        cout << "Tuna的析构函数" << endl;
    }
};

int main(void) {
    
    Tuna myDinner;
    
    return 0;
}

/**
 * (1)、构造顺序: 先构造父类，再析构子类
 * (2)、析构顺序: 先析构子类，再析构父类
 */

/**
 FishDummyMember的构造函数
 Fish的构造函数
 TunaDummyMember的构造函数
 Tuna的构造函数
 Tuna的析构函数
 TunaDummyMember的析构函数
 Fish的析构函数
 FishDummyMember的析构函数
 */
