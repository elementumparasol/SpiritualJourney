//
//  main.cpp
//  const指针
//
//  Created by Enrica on 2018/7/19.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 1、指向常量的指针(指针本身不是常量，只不过它是指向常量的)
    
    // 定义一个const变量
    const double pi = 3.14;
    
    // 在定义一个const指针指向变量pi
    const double *ptr = &pi;
    std::cout << "const指针ptr的值为: " << ptr << std::endl;
    
    // 注意: 不能用普通指针去指向const变量，eg: double *ptr = &pi; 这种操作是错误的
    // const类型的变量只能用const类型的指针去指向它。另外，const类型的指针一旦被赋值，是
    // 不可以再修改的，eg: *ptr = 2.718; 因为指针ptr是const类型，它不能被再次赋值
    
    // 虽然const类型的变量必须用const类型的指针去指向它。但是，const类型的指针却
    // 可以指向非const类型的变量。只不过，你不能通过const类型的指针去修改该变量
    double dval = 3.14;
    const double *ptr2 = &dval;
    std::cout << "const类型的指针可以指向非const类型的变量，该指针的值为: " << ptr2 << std::endl;
    
    /**
     * 总结: const类型的指针既可以指向const类型的变量，也可以指向非const类型的变量。
     * 只不过，不能通过const类型的指针来修改它所指向的变量(不管是const类型还是非const类型)
     */
    
    
    
    // 2、常量指针(即指针本身是常量)
    
    /**
     * 指针是对象而不是引用，因此可以像其它普通对象一样，把指针本身定义为一个常量。
     * 常量指针必须初始化，而且一旦初始化完成，则它的值是不能被修改的。注意，常量
     * 指针不变的是指针本身的值，而并非它所指向的变量不可以改变
     */
    
    double e = 2.718;
    
    // 常量指针
    double *const ptr3 = &e;
    std::cout << "常量指针ptr3的值为: " << ptr3 << std::endl;
    std::cout << "常量指针ptr3所指向的变量值为: " << *ptr3 << std::endl;
    
    // 不可以修改常量指针ptr3本身的值，但是可以修改它所指向变量的值
    *ptr3 = 2.9999;
    std::cout << "常量指针ptr3所指向变量的值为: " << *ptr3 << std::endl;
    
    return 0;
}
