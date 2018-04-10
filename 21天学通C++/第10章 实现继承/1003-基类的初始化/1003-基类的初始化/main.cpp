//
//  main.cpp
//  1003-基类的初始化
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 包含初始化列表的派生类构造函数
 */

#include <iostream>
using namespace std;

class Fish {
    
protected:
    bool isFreshWaterFish;
    
public:
    
    // 包含初始化列表的构造函数
    Fish(bool isFreshWater): isFreshWaterFish(isFreshWater) {}
    
    // 对象方法
    void Swim() {
        
        if (isFreshWaterFish)
            cout << "淡水鱼。" << endl;
        else
            cout << "咸水鱼" << endl;
    }
};

class Tuna: public Fish {
    
public:
    
    // 包含初始化列表的构造函数
    Tuna() : Fish(false) {}  // 为什么可以这样初始化？因为基类Fish里面提供了带参数的构造函数 Fish(bool isFreshWater)
};

class Carp: public Fish {
    
public:
    
    // 包含初始化列表的构造函数
    Carp(): Fish(true) {}
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
