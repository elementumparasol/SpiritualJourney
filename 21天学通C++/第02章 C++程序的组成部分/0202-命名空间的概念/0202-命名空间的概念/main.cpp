//
//  main.cpp
//  0202-命名空间的概念
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 命名空间的概念
 */

#include <iostream>

int main(void) {
    
    // 告诉编译器在哪个命名空间中查找
    using namespace std;
    
    // 向屏幕输出一条信息
    cout << "Hello, World!" << endl;
    
    return 0;
}

/**
 * 在上一节我们说过，在向屏幕输出一条消息时，之所以要在cout前面加上一个std，
 * 主要是因为cout是定义在std中定义的一个流。那么std又是什么呢？std在这里是
 * 一个命名空间，而我们的标准输入和输出就是定义在这个命名空间中的。命名空间存
 * 在的一个作用是减少歧义、降低冲突。打个比方，假设程序中有多个地方定义了cout，
 * 当我们使用cout时，编译器很可能因为不知道到底要使用哪个地方定义的cout而陷入
 * 纠结。而使用命名空间就不会出现这样的问题，它可以清楚明白的指定要是用在哪个
 * 地方定义的cout。
 * 在实际工作中，可能有很多地方要用到std中定义的功能，但是，每次都使用std::就
 * 显得特别的麻烦，为了避免每次都使用std::，我们可以使用using namespace，就
 * 像上面那样。
 */
