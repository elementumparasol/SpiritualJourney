//
//  ESPerson.h
//  自定义一个类
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESPerson : NSObject
{
    // 实例变量的声明
    float _heightInMeters;
    int _weigthInKilos;
}

// 读取并设置实例变量的方法
- (float)heightInMeters;
- (void)setHeightInMeters: (float)h;
- (int)weightInKilos;
- (void)setWeightInKilos: (int)w;

//计算Body Mass Index的方法
- (float)bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
