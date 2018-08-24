//
//  ESPerson.h
//  构造方法
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESPerson : NSObject

// MARK: - 声明属性

/** 姓名 */
@property (nonatomic, copy) NSString *name;

/** 年龄 */
@property (nonatomic, assign) int age;

// MARK: - 对象方法

/** 自定义构造函数 */
- (instancetype)initWithAge: (int)age andName: (NSString *)name;

@end

NS_ASSUME_NONNULL_END
