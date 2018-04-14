//
//  Person.h
//  05-自定义构造方法
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/** 姓名 */
@property NSString *name;

/** 年龄 */
@property int age;

/** 自定义的构造函数 */
- (instancetype)initWithName: (NSString *)name andAge: (int)age;

@end
