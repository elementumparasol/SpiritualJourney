//
//  ESAssets.h
//  对象实例变量和属性
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESAssets : NSObject

// MARK: - 声明属性

/** label */
@property (nonatomic, copy) NSString *label;

/** 零售额 */
@property (nonatomic) int resaleValue;

@end

NS_ASSUME_NONNULL_END
