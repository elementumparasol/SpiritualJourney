//
//  ESPerson.h
//  类扩展
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESPerson : NSObject

// MARK: - 属性的声明

/** 身高 */
@property (nonatomic) float heightInMeters;

/** 体重 */
@property (nonatomic) int weightInKilos;


// MARK: - 实例方法的声明

/** 计算mbi */
- (float)bodyMassIndex;

@end

NS_ASSUME_NONNULL_END
