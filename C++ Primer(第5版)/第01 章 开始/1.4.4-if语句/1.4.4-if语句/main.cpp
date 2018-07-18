//
//  main.cpp
//  1.4.4-if语句
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    int currVal = 0, val = 0;
    
    // 输入完成之后，用Ctrl + D来表示输入结束
    std::cout << "请连续输入正整数(用空格隔开): ";
    
    if (std::cin >> currVal) {
        
        int cnt = 1;
        
        while (std::cin >> val) {
            if (val == currVal) {
                ++cnt;
            } else {
                std::cout << currVal << "出现了" << cnt << "次" << std::endl;
                currVal = val;
                cnt = 1;
            }
        }
        
        std::cout << currVal << "出现了" << cnt << "次" << std::endl;
    }
    
    return 0;
}
