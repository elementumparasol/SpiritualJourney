//
//  main.cpp
//  1.4.1-while语句
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    int sum = 0, val = 1;
    
    while (val <= 10) {
        
        // 将sum + val赋值给sum
        sum += val;
        
        // 每次进入while循环，都将val的值累加1
        ++val;
    }
    
    std::cout << "从1累加到10的结果为: " << sum << std::endl;
    
    return 0;
}
