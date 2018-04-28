//
//  main.c
//  01-单链表
//
//  Created by Enrica on 2018/4/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

#pragma mark - 定义结构体

/** 定义链表元素 */
typedef struct ListElmt_ {
    
    // 链表的数据域
    void *data;
    
    // 链表的指针域(指向下一个结点)
    struct ListElmt_ *next;
} ListElmt;

/** 定义链表 */
typedef struct List_ {
    
    // 链表大小(也就是链表中元素的个数)
    int size;
    
    // 链表数据结构派生类型
    int (*match)(const void *key1, const void *key2);
    
    // 销毁链表时调用
    void (*destroy)(void *data);
    
    // 链表头部指针
    ListElmt *head;
    
    // 链表尾部指针
    ListElmt *tail;
} List;


#pragma mark - 定义链表的公共接口

/**
 * 初始化链表
 */
void list_init(List *list, void (*destroy)(void *data));

/**
 * 销毁链表
 */
void list_destroy(List *list);

/**
 * 往链表中插入一个元素(在指定的元素后面插入新的元素)
 */
int list_insert_next(List *list, ListElmt *element, const void *data);

/**
 * 移除指定的元素
 */
int list_remove_next(List *list, ListElmt *element, void **data);

/**
 * 返回链表中元素的个数
 */
int list_size(const List *list);

/**
 * 返回指向链表头部元素的指针
 */
ListElmt *list_head(const List *list);

/**
 * 返回指向链表中尾部元素的指针
 */
ListElmt *list_tail(const List *list);

/**
 * 判断是否是链表头部结点，如果是，则返回1；否则，返回-1
 */
int list_is_head(const ListElmt *element);

/**
 * 判断是否是链表尾部结点，如果是，则返回1；否则，返回-1
 */
int list_is_tail(const ListElmt *element);

/**
 * 结点中保存的数据
 */
void *list_data(const ListElmt *element);

/**
 * 返回指向下一个结点的指针
 */
ListElmt *list_next(const ListElmt *element);


int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
