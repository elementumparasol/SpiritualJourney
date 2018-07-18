//
//  main.cpp
//  引用
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    // 引用为对象起了另外一个名字，引用类型引用另外一种类型。通过
    // 将声明符写成&d的形式来定义引用类型，其中d是声明的变量名
    int ival = 10;
    
    // 声明一个引用类型
    int &irefVal = ival;  // 将irefVal指向ival(即irefVal是ival的另外一个名字)
    
    // 必须注意的是，因为引用类型是指向一个已经存在的类型，因此
    // 引用类型必须被初始化(也就是说它必须指向一个已经存在的类型)
    // int &irefVal2; 像这样就会报错: 引用类型必须初始化。
    // 引用并非对象，它只不过是一个已经存在的对象的别名
    
    
    // 定义一个引用之后，对引用所有的操作实际上都是作用在该引用指向的对象
    // 身上的。反过来，操作引用所指向的对象，最终的结果同样反映在引用身上
    // 核心实质就是: 引用是引用对象的别名，它们本质上是同一个东西，就像是
    // 同一个人，既有自己的名字，又有自己专属的身份证号码一样
    ival = 5;  // 对引用的对象进行赋值
    std::cout << "引用irefVal的值为: " << irefVal << std::endl;  // 引用的值也被修改了
    
    irefVal = 20;  // 对引用进行赋值
    std::cout << "ival的值为: " << ival << std::endl;  // 引用对象的值也被修改了
    
    return 0;
}
