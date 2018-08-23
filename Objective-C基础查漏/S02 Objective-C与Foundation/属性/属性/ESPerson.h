//
//  ESPerson.h
//  属性
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESPerson : NSObject


/** 身高 */
@property (nonatomic) float heightInMeters;


/** 体重 */
@property (nonatomic) int weightInKilos;

/** 计算bmi */
- (float)bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
