//
//  main.cpp
//  2.2-顺序结构
//
//  Created by Enrica on 2018/7/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cmath>

int main(int argc, const char * argv[]) {
    
    /** 1、fabs(double x)函数 */
    
    double db = -12.56;
    printf("|db| = %.2f\n", fabs(db));
    
    
    /** 2、floor(double x)和ceil(double x)函数 */
    
    double db1 = -5.2, db2 = 5.2;
    printf("floor(db1) = %.0f, ceil(db1) = %.0f\n", floor(db1), ceil(db1));
    printf("floor(db2) = %.0f, ceil(db2) = %.0f\n", floor(db2), ceil(db2));
    
    
    /** 3、幂指数函数pow(double r, double p) */
    
    double db3 = pow(2.0, 3.0);
    printf("2的3次方: %.0f\n", db3);
    
    return 0;
}
