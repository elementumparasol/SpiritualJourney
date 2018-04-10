//
//  main.cpp
//  1002-访问限定符protected
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 改善1001的代码设计，使用关键字protected将成员属性只暴露给派生类
 */

#include <iostream>
using namespace std;


// 鱼类的基类
class Fish {
    
protected:
    
    // 因为使用了关键字protected，所以这个属性
    // 只能被派生类(子类)访问
    bool isFrshWaterFish;
    
public:
    
    void Swim() {
        
        if (isFrshWaterFish)
            cout << "淡水鱼。" << endl;
        else
            cout << "鲜水鱼。" << endl;
    }
};

// 金枪鱼
class Tuna: public Fish {
    
public:
    
    // 金枪鱼的构造函数
    Tuna() {
        isFrshWaterFish = false;
    }
};

// 鲤鱼
class Carp: public Fish {
    
public:
    
    // 鲤鱼的构造函数
    Carp() {
        isFrshWaterFish = true;
    }
};

int main(void) {
    
    // 创建金枪鱼和鲤鱼对象
    Carp myLunch;
    Tuna myDinner;
    
    cout << "About my food: " << endl;
    
    cout << "Lunch: ";
    myLunch.Swim();
    
    cout << "Dinner: ";
    myDinner.Swim();
    
    return 0;
}
