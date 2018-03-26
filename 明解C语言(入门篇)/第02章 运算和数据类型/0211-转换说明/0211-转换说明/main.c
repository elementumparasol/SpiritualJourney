//
//  main.c
//  0211-转换说明
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取三个整数，并显示出它们的合计值和平均值
 */

int main(void) {
    
    int a, b, c;
    int sum;
    double ave;
    
    puts("请依次输入三个整数.");
    printf("第一个整数是: ");  scanf("%d", &a);
    printf("第二个整数是: ");  scanf("%d", &b);
    printf("第三个整数是: ");  scanf("%d", &c);
    
    // 计算a, b, c三个整数的和
    sum = a + b + c;
    
    // 计算a, b, c三个整数的平均值
    ave = (double)(sum) / 3;
    
    // 格式说明符后面的整数5表示输出时的字符宽度(我们这里占用5个字符的宽度)
    // 整数5前面的0是一种标志，以我们这里为例，如果输出结果没有占用5个字符
    // 的宽度，那么不足的部分将用0补齐，比如说43、67和93的和是203，它只有
    // 3位字符，不足5位，使用0标志之后，会用00203显示
    printf("整数%d、%d、和%d的和是: %05d\n", a, b, c, sum);
    
    // 输出结果占用5个字符的宽度，并且平均值保留1位小数
    printf("整数%d、%d、和%d的平均值是: %05.1f\n", a, b, c, ave);
    
    return 0;
}
