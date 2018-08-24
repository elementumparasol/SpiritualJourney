//
//  ESEmployee.h
//  类扩展
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESEmployee : ESPerson

// MARK: - 属性的声明

/** 员工ID */
@property (nonatomic) unsigned in employeeID;

@end

NS_ASSUME_NONNULL_END
