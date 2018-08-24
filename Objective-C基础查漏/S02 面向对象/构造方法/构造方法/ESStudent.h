//
//  ESStudent.h
//  构造方法
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface ESStudent : ESPerson

// MARK: - 声明属性

/** 学号 */
@property (nonatomic, assign) int studentID;


// MARK: - 声明实例方法

/** 自定义构造方法，用于初始化studentID */
- (instancetype)initWithStudentID: (int)studentID;

@end

NS_ASSUME_NONNULL_END
