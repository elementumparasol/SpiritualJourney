//
//  main.cpp
//  处理类型
//
//  Created by Enrica on 2018/7/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 1、类型别名
    
    /**
     * 类型别名是一个名字，它是某种类型的同义词。使用类型别名有很多好处，它让复杂的类型名字变得简单
     * 明了、易于理解和使用，还有助于程序员清除的知道使用该类型的真实目的。使用类型别名有两种方式:
     * - (1)、使用关键字typedef, eg: tpyedef double shuangjiangdufudianxing;
     * - (2)、使用别名声明来定义类型的别名, eg: using shuangjingdufudianxing = double;
     */
    
    // (1)、使用typedef来定义类型别名
    typedef double wages;
    wages pi = 3.14159;
    std::cout << "圆周率π的值为: " << pi << std::endl;
    std::cout << "类型wages占用的字节数为: " << sizeof(wages) << std::endl;
    
    // (2)、使用别名声明来定义类型的别名
    using math = double;  // 声明类型别名
    math e = 2.71828;
    std::cout << "自然数e的值为: " << e << std::endl;
    std::cout << "类型math占用的字节数为: " << sizeof(math) << std::endl;
    
    // 注意: 类型别名和类型的名字等价，只要是类型的名字能出现的地方，就能使用类型别名
    
    return 0;
}
