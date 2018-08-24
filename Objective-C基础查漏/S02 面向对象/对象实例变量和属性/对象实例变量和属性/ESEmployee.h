//
//  ESEmployee.h
//  对象实例变量和属性
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

NS_ASSUME_NONNULL_BEGIN

@class ESAssets;

@interface ESEmployee : ESPerson

// MARK: - 实例变量的声明

{
    /** _assets */
    NSMutableArray *_assets;
}

// MARK: - 属性的声明

/** 员工ID */
@property (nonatomic) unsigned int employeeID;

/** 警报代码 */
@property (nonatomic) unsigned int officeAlarmCode;

/** 雇用日期 */
@property (nonatomic) NSDate *hireDate;

/** 名字 */
@property (nonatomic) NSString *lastName;

/** 配偶 */
@property (nonatomic) ESPerson *spouse;

/** 数组容器 */
@property (nonatomic) NSMutableArray *children;

/** assets */
@property (nonatomic, copy) NSArray *assets;


// MARK: - 实例方法

- (double)yearsOfEmployment;

- (void)addAsset: (ESAssets *)a;

- (unsigned int)valueOfAssets;

@end

NS_ASSUME_NONNULL_END
