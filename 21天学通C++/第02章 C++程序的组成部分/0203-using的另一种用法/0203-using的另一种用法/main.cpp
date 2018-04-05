//
//  main.cpp
//  0203-using的另一种用法
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <iostream>

int main(void) {
    
    // 显示的指定命名空间限定符std::
    using std::cout;
    using std::endl;
    
    cout << "Hello, World!" << endl;
    
    return 0;
}
