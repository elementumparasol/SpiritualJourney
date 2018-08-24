//
//  ESAssets.m
//  对象实例变量和属性
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESAssets.h"

@implementation ESAssets

- (NSString *)description {
    
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void)dealloc {
    NSLog(@"调用了ESAssets的dealloc方法....");
}

@end
