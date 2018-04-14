//
//  NSString+Cal.h
//  06-分类的概念
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Cal)

/** 计算传入字符串中数字的个数 */
+ (int)numberOfIntegersInString: (NSString *)string;

/** 计算传入字符串中数字的个数 */
- (int)numberOfIntegersInString: (NSString *)string;

@end
