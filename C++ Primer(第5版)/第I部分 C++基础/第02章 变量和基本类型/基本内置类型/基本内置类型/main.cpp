//
//  main.cpp
//  基本内置类型
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 算符类型(需要注意的是，最后的结果可能根据平台的不同而有所差异)
    std::cout << "bool类型的位数是: " << sizeof(bool) << std::endl;  // 1
    std::cout << "char类型的位数是: " << sizeof(char) << std::endl;  // 1
    std::cout << "wchar_t类型的位数是: " << sizeof(wchar_t) << std::endl;  // 4
    std::cout << "char16_t类型的位数是: " << sizeof(char16_t) << std::endl;  // 2
    std::cout << "char32_t类型的位数是: " << sizeof(char32_t) << std::endl;  // 4
    std::cout << "short类型的位数是: " << sizeof(short) << std::endl;  // 2
    std::cout << "int类型的位数是: " << sizeof(int) << std::endl;  // 4
    std::cout << "long类型的位数是: " << sizeof(long) << std::endl;  // 8
    std::cout << "long long类型的位数是: " << sizeof(long long) << std::endl;  // 8
    std::cout << "float类型的位数是: " << sizeof(float) << std::endl;  // 4
    std::cout << "double类型的位数是: " << sizeof(double) << std::endl;  // 8
    std::cout << "long double类型的位数是: " << sizeof(long double) << std::endl;  // 16
    
    return 0;
}
