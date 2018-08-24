//
//  ESEmployee.m
//  类扩展
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESEmployee.h"

@interface ESEmployee ()

// MARK: - 声明实例变量
{
    /** _assets */
    NSMutableArray *_assets;
}

// MARK: - 声明属性

/** 警报代码 */
@property (nonatomic) unsigned int officeAlarmCode;

@end

@implementation ESEmployee

@end


/**
 类扩展是一组私有的声明，只有在当前类和它的实例中才能使用类扩展
 中声明的属性、实例变量或实例方法；
 类扩展是不能被继承的。如果你希望只在父类中拥有，而对子类不可见，
 那么最好是将其声明在类扩展中。
 */
