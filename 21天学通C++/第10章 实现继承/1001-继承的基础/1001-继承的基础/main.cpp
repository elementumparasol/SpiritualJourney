//
//  main.cpp
//  1001-继承的基础
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 简单的继承层次结构
 */

#include <iostream>
using namespace std;

// 鱼类的基类
class Fish {
public:
    bool isFreshWaterFish;
    
    void Swim() {
        if (isFreshWaterFish) {
            cout << "淡水鱼。" << endl;
        } else {
            cout << "咸水鱼。" << endl;
        }
    }
};

// 金枪鱼
class Tuna: public Fish {
    
public:
    
    // 金枪鱼的构造函数
    Tuna() {
        isFreshWaterFish = false;
    }
};

// 鲤鱼
class Carp: public Fish {
    
public:
    
    // 鲤鱼的构造函数
    Carp() {
        isFreshWaterFish = true;
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
