//
//  main.cpp
//  1.4.2-for语句
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    int sum = 0;
    
    for (int val = 1; val <= 10; ++val) {
        sum += val;
    }
    
    std::cout << "从1累加到10的i结果为: " << sum << std::endl;
    
    return 0;
}
