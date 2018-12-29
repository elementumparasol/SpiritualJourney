//
//  RGB.h
//  实例变量的访问权限
//
//  Created by Enrica on 2018/12/30.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RGB : NSObject {
    unsigned char red, green, blue;
}

- (id)initWithRed: (int)r green: (int)g blue: (int)b;
- (id)blendColor: (RGB *)color;
- (void)print;

@end

NS_ASSUME_NONNULL_END
