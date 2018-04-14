//
//  Student.h
//  05-自定义构造方法
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Person.h"

@interface Student : Person

/** 学号 */
@property int number;

/** 自定义构造函数 */
- (instancetype)initWithName:(NSString *)name andAge:(int)age number: (int)no;

@end
