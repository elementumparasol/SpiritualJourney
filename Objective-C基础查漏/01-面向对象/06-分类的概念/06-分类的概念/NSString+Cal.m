//
//  NSString+Cal.m
//  06-分类的概念
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "NSString+Cal.h"

@implementation NSString (Cal)

+ (int)numberOfIntegersInString:(NSString *)string {
    
    int count = 0;
    
    // 如果字符串string不为空
    if (string) {
        
        // 遍历字符串string
        for (int i = 0; i < string.length; i++) {
            
            // 取出字符串中所有的字符c
            unichar c = [string characterAtIndex:i];
            
            // 判断字符c是否为整数
            if (c >= '0' && c <= '9') {
                count++;
            }
        }
    }
    
    return count;
}

- (int)numberOfIntegersInString:(NSString *)string {
    
    int count = 0;
    
    // 如果字符串string不为空
    if (string) {
        
        // 遍历字符串string
        for (int i = 0; i < string.length; i++) {
            
            // 取出字符串中所有的字符c
            unichar c = [string characterAtIndex:i];
            
            // 判断字符c是否为整数
            if (c >= '0' && c <= '9') {
                count++;
            }
        }
    }
    
    return count;
}

@end
