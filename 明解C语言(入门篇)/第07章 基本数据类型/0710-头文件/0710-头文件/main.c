//
//  main.c
//  0710-头文件
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 求出两点之间的距离
 */

#include <stdio.h>
#include <math.h>

/**
 * 求出点(x1, y1)和点(x2, y2)之间的距离
 */
double dist(double x1, double y1, double x2, double y2) {
    return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
}

int main(void) {
    
    double x1, y1, x2, y2;
    
    printf("求两点之间的距离。\n");
    printf("第一个点的x坐标: ");   scanf("%lf", &x1);
    printf("第一个点的y坐标: ");   scanf("%lf", &y1);
    
    printf("第二个点的x坐标: ");   scanf("%lf", &x2);
    printf("第二个点的y坐标: ");   scanf("%lf", &y2);
    
    printf("这两点之间的距离为: %f\n", dist(x1, y1, x2, y2));
    
    return 0;
}
