//
//  main.cpp
//  const引用
//
//  Created by Enrica on 2018/7/19.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    /**
     * 引用类型必须与其所引用对象的类型一致。但是，有两种情况例外:
     * - (1)、在初始化常量引用时，允许用任意表达式作为初始值，只要该表达式的结果能够转换成引用类型；
     * - (2)、常量引用在绑定类型不一致的对象时，可以通过
     */
    
    int i = 42;
    std::cout << "变量i的值为: " << i << std::endl;
    
    const int &r1 = i;  // 将const int& 绑定到一个普通的int类型变量i上面
    std::cout << "常量引用r1所表示的值为: " << r1 << std::endl;
    
    const int &r2 = 100;  // 这个是正确的，因为r2是一个常量引用
    std::cout << "常量引用r2所表示的值是: " << r2 << std::endl;
    
    const int &r3 = r1 * 2;
    std::cout << "常量引用r3所表示的值为: " << r3 << std::endl;
    
    // int &r4 = r1 * 2; 这个是不正确的，因为r4是一个普通的非常量引用。
    // 我们在前面说过，引用只能绑定对象，不能与字面量或者某个表达式的计算结果绑定在一起.
    // 很显然，上面r4是跟一个表达式绑定到一起的，这个是不对的
    
    double pi = 3.14;
    const int &ri = pi;
    std::cout << "将一个int类型的引用绑定到一个double类型的变量上的结果为: " << ri << std::endl;
    // 它实际上相当于先将double类型的变量pi转换为int类型(舍去小数部分)的临时量, 然后再将int类型的引用
    // 绑定到转换完成的临时量之上。需要注意的是，此时绑定的对象已经变成了临时量，而非原来的变量pi
    
    return 0;
}
