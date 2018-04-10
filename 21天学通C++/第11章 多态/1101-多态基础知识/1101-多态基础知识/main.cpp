//
//  main.cpp
//  1101-多态基础知识
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将Tuna实例作为参数传递给Fish，并且通过该参数调用方法(父类指向子类)
 */

#include <iostream>
using namespace std;

class Fish {
    
public:
    void Swim() {
        cout << "鱼在游泳。" << endl;
    }
};

class Tuna: public Fish {
    
public:
    
    // 重写父类的方法
    void Swim() {
        cout << "金枪鱼在游泳。" << endl;
    }
};

void MakeFishSwim(Fish &fishObj) {
    
    fishObj.Swim();
}

int main(void) {
    
    Tuna myDinner;
    myDinner.Swim();  // 调用自己的方法
    
    cout << endl;
    
    cout << "调用MakeFishSwim方法，将实例myDinner作为参数进行传递。" << endl;
    MakeFishSwim(myDinner);
    
    return 0;
}
