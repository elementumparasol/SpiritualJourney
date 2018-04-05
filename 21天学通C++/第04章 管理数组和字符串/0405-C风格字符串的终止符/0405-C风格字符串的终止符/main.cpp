//
//  main.cpp
//  0405-C风格字符串的终止符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 分析C风格字符串的终止空字符'\0'
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 注意，C语言风格的字符串数组中，最后千万不要忘记空字符'\0'，否则最后输出的时候，末尾会出现
    // 垃圾字符(意料之外的字符)，严重的甚至还可能产生系统崩溃。
    char helloWorld[] = {'H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!', '\0'};
    cout << helloWorld << endl;
    
    cout << "数组helloWorld的大小是: " << sizeof(helloWorld) << endl;
    
    cout << "使用空字符替代中间的空格。" << endl;
    helloWorld[6] = '\0';
    
    cout << "再次输出helloWorld中的内容: " << helloWorld << endl;
    cout << "再次打印helloWorld的长度: " << sizeof(helloWorld) << endl;
    
    return 0;
}

/**
 * 最后，我们可以看到，使用空字符'\0'代替中间的空格之后，数组helloWorld的长度
 * 并没有发生改变，但是输出的内容被截断了，也就说最后只是输出了"Hello,"，然后
 * 它后面的"World"完全不再输出了。这是为什么呢？因为在C风格的字符串中，'\0'被当
 * 成是字符串结束的标志，编译器一旦检测到'\0'，输出也就停止了。
 */
