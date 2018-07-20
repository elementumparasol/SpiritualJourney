//
//  main.cpp
//  constexpr和常量表达式
//
//  Created by Enrica on 2018/7/20.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    /**
     * 常量表达式，是指值不会改变，并且在编译过程中就能得到计算结果的表达式。比如说，
     * 字面值属于常量表达式，字面值属于常量表达式，用常量表达式初始化的const对象也
     * 是常量表达式
     */
    
    // 1、常量表达式
    
    const int max_files = 20;  // 字面量属于常量秒大使
    std::cout << "常量max_files的值为: " << max_files << std::endl;
    
    const int limit = max_files + 1;  // 用常量表达式初始化的const对象同样是常量表达式
    std::cout << "常量limit的值为: " << limit << std::endl;
    
    // 注意: 像int staff_size = 27;这种不属于常量表达式。因为尽管它的数据是属于字面值常量，
    // 但是，它的数据类型是一个普通的int, 而并非const int，因此它不属于常量表达式
    // 另外，像const int sz = get_size();这种类型也不是常量表达式，因为尽管变量sz最终的结果
    // 是一个常量，但是，get_size()这个函数的结果要到运行时才能确定，不能在编译阶段确定，所以不是
    
    
    // 2、constexpr变量
    
    constexpr int mf = 20;  // 20是常量表达式
    constexpr int limit1 = mf + 1;  // mf + 1也是常量表达式
    std::cout << "常量表达式limit1的的值为: " << limit1 << std::endl;
    
    return 0;
}
