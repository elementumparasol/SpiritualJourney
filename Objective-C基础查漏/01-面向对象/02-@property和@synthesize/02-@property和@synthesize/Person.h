//
//  Person.h
//  02-@property和@synthesize
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 年龄
@property int age;  // 相当于下面这两句
// - (void)setAge:(int)age;
// - (int)age;

// 姓名
@property NSString *name;
// - (void)setName:(NSString *)name;
// - (NSString *)name;

@end

/**
 * @property会自动帮助生成setter方法和getter方法的声明(仅仅是声明)
 */
