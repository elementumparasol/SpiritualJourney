//
//  main.cpp
//  1009-保护继承
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * RaceCar类以保护方式继承了Car类，而Car类以保护方式继承了Motor类
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

class Car: protected Motor {
    
public:
    void Move() {
        SwitchIgnition();
        PumpFuel();
        FireCylinders();
    }
};

class RaceCar: protected Car {
    
public:
    void Move() {
        
        SwitchIgnition();
        PumpFuel();
        FireCylinders();
        FireCylinders();
        FireCylinders();
    }
};

int main(void) {
    
    RaceCar myRaceCar;
    myRaceCar.Move();
    
    return 0;
}
