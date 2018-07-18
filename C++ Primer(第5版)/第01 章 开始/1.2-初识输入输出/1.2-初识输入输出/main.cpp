//
//  main.cpp
//  1.2-初识输入输出
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 * iostream: 标准输入输出库，它包含istream和ostream两部分，分别表示输入流和输出流
 * - cin: 读作see-in，用来处理输入
 * - count: 读作see-out，用来处理输出
 * - cerr: 读作see-err，用来输出警告和错误信息
 * - clog: 读作see-log，用来输出程序运行时的一般信息
 */

#include <iostream>

int main(int argc, const char * argv[]) {
    
    std::cout << "请输入两个正整数(整数之间用空格隔开):";
    
    // 定义两个变量，并且对其进行初始化。所谓的初始化，就是在定义变量时
    // 给它赋予一个初始值。必须注意的时，在很多教材，比如说谭浩强的C++
    // 教材中，我们看到他在定义变量时并没有对其进行初始化，这样做虽然程
    // 序也能正确运行，但是我们要知道，这是一种很不规范的写法。因此，我们
    // 在编程时，一定要注意，定义变量时一定要初始化。未经过初始化的变量在
    // 使用时很有可能会出现一些莫名其妙的问题。并且，在很多现代编程语言，
    // 比如说Swift中，未经过初始化的变量是不允许使用的
    int v1 = 0, v2 = 0;  // 用来接收输入的正整数
    std::cin >> v1 >> v2;
    
    // 计算并输出这两个正整数的值
    std::cout << "这两个正整数的和为: " << v1 << " + " << v2 << " = " << v1 + v2 << std::endl;
    
    return 0;
}

// 在上面的代码中，前缀std::指出了名字coutcin，以及endl是定义在名为std的命名空间(namespace)
// 中的。命名空间可以帮助我们避免不经意的名字定义冲突，以及使用库中相同名字导致的冲突。标准库定义的
// 所有名字都在命名空间std中。另外::(连着两个冒号)是作用域运算符，就是用来指出我们想要使用的名字是
// 定义在哪个命名空间中的，eg: std::cout就表明我们要使用的cout是定义在std这个命名空间中的。
