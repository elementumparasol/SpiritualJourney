//
//  main.m
//  03-setter和getter的简便写法
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *car = [Car new];
        car.wheels = 4;
        car.speed = 100;
        NSLog(@"car.wheels = %d, car.speed = %.2f\n", car.wheels, car.speed);
    }
    return 0;
}
