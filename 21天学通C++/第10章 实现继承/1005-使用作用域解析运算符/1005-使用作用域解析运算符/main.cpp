//
//  main.cpp
//  1005-使用作用域解析运算符
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在基类方法和main函数中，使用作用域解析运算符(::)来调用基类的方法
 */

#include <iostream>
using namespace std;

class Fish {
    
protected:
    
    bool isFreshWaterFish;
    
public:
    
    Fish(bool isFreshWater): isFreshWaterFish(isFreshWater) {}
    
    void Swim() {
        
        if (isFreshWaterFish)
            cout << "淡水鱼" << endl;
        else
            cout << "咸水鱼" << endl;
    }
};

class Tuna: public Fish {
    
public:
    
    Tuna(): Fish(false) {}
    
    // 重写父类的Swim方法
    void Swim() {
        cout << "金枪鱼是一种典型的咸水鱼。" << endl;
    }
};

class Carp: public Fish {
    
public:
    
    Carp(): Fish(true) {}
    
    // 重写父类的Swim方法
    void Swim() {
        cout << "鲤鱼是一种典型的淡水鱼。" << endl;
        
        // 调用父类Fish的Swim方法
        Fish::Swim();
    }
};

int main(void) {
    
    // 创建金枪鱼和鲤鱼对象
    Carp myLunch;
    Tuna myDinner;
    
    cout << "About my food: " << endl;
    
    cout << "Lunch: ";
    myLunch.Swim();  // 这里调用的是子类Carp的Swim方法
    
    cout << "Dinner: ";
    
    // 调用父类Fish的Swim方法
    myDinner.Fish::Swim();
    
    return 0;
}
