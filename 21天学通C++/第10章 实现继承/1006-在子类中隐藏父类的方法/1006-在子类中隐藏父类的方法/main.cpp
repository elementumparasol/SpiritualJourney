//
//  main.cpp
//  1006-在子类中隐藏父类的方法
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在Tuna::Swim()中隐藏重载方法Fish::Swim()
 */

#include <iostream>
using namespace std;

class Fish {
    
protected:
    
    bool isFreshWaterFish;
    
    // 不带参数的构造函数
    void Swim() {
        cout << "鱼儿在游泳..." << endl;
    }
    
    // 带参数的构造函数(构造函数的重载)
    void Swim(bool isFreshWaterFish) {
        
        if (isFreshWaterFish)
            cout << "淡水鱼在游泳..." << endl;
        else
            cout << "咸水鱼在游泳..." << endl;
    }
};

class Tuna: public Fish {
    
public:
    
    void Swim() {
        cout << "金枪鱼在游泳..." << endl;
    }
};

int main(void) {
    
    Tuna myDinner;
    cout << "About my dinner: " << endl;
    myDinner.Swim();
    // myDinner.Swim(true);
    
    return 0;
}
