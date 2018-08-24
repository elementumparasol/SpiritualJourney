//
//  ESPerson.m
//  自定义一个类
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

@implementation ESPerson

- (float)heightInMeters {
    return _heightInMeters;
}

- (void)setHeightInMeters:(float)h {
    _heightInMeters = h;
}

- (int)weightInKilos {
    return _weigthInKilos;
}

- (void)setWeightInKilos:(int)w {
    _weigthInKilos = w;
}

- (float)bodyMassIndex {
    
    // 使用读取方法来访问实例变量
    float h = [self heightInMeters];
    int w = [self weightInKilos];
    
    return w / (h * h);
}

@end
