//
//  Person.h
//  04-重写init方法
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/** 年龄 */
@property (nonatomic, assign) int age;

/** 姓名 */
@property (nonatomic, copy) NSString *name;

@end
