//
//  main.c
//  0501-数组引言
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入5位球员的得分，计算他们得分的总和以及平均得分
 */

int main(void) {
    
    int james;
    int love;
    int hill;
    int calderon;
    int nance;
    
    int sum = 0;
    
    printf("请依次输入5位球员的得分。\n");
    printf("LeBron James: ");
    scanf("%d", &james);
    sum += james;
    
    printf("Kevin Love: ");
    scanf("%d", &love);
    sum += love;
    
    printf("George Hill: ");
    scanf("%d", &hill);
    sum += hill;
    
    printf("Jose Calderon: ");
    scanf("%d", &calderon);
    sum += calderon;
    
    printf("Larry Nance: ");
    scanf("%d", &nance);
    sum += nance;
    
    printf("5位球员的总得分是: %d\n", sum);
    printf("5位球员的平均得分是: %.2f\n", (double)sum / 5);
    
    return 0;
}

/**
 * 从上面的代码中我们可以看到，其实每位球员的得分都是整型int，
 * 在球员比较少的时候，定义多个变量，然后再计算总得分和平均分
 * 还是可以的，但是一旦球员变多，计算起来就比较麻烦。一般情况下，
 * 对于处理这种类型相同的数据，往往使用数组比较方便，接下来，我
 * 们会在后面的代码中使用数组来处理。
 */
