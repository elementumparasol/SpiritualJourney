//
//  main.cpp
//  1008-私有继承
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * Car类以私有的方式继承Motor类
 */

#include <iostream>
using namespace std;

class Motor {
    
public:
    
    void SwitchIgnition() {
        cout << "点火" << endl;
    }
    
    void PumpFuel() {
        cout << "踩油门儿" << endl;
    }
    
    void FireCylinders() {
        cout << "发动机正在运转" << endl;
    }
};

class Car: private Motor {
    
public:
    void Move() {
        SwitchIgnition();
        PumpFuel();
        FireCylinders();
    }
};

int main(void) {
    
    Car myDreamCar;
    myDreamCar.Move();
    
    return 0;
}
