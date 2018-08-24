//
//  ESEmployee.h
//  继承
//
//  Created by Enrica on 2018/8/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESEmployee : ESPerson

/** 员工ID */
@property (nonatomic) unsigned int employeeID;

/** 警报代码 */
@property (nonatomic) unsigned int officeAlarmCode;

/** 雇用日期 */
@property (nonatomic) NSDate *hireDate;


/** 计算雇佣年限 */
- (double)yearOfEmployment;

@end

NS_ASSUME_NONNULL_END
