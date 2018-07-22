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
    
    
    /** 4、算术平方根函数sqrt(double x) */
    double db4 = sqrt(2.0);
    printf("2的算术平方根为: %.3f\n", db4);
    
    
    /** 5、以自然数为底的对数函数log(double x) */
    double db5 = log(10.0);
    printf("10以自然数e为底的对数为: %.2f\n", db5);
    
    // 注意: 因为C语言中没有一任意数为底的对数函数，因此，如果需要求以任意数为底
    // 的对数函数，必须用换底公式: loga(b) = logb / loga
    double x = log(3.0) / log(2.0);  // 表示求以2为底3的对数
    printf("以2为底3的对数结果为: %.2f\n", x);
    
    return 0;
}
