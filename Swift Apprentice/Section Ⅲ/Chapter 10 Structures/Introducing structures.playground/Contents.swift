//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、*/
let restaurantLocation = (2, 4)
let restaurantRange = 2.5

func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double {

    let distanceX = Double(source.x - target.x)

    let distanceY = Double(source.y - target.y)

    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    return deliveryDistance < restaurantRange
}

// 定义一个简单的struct结构体
struct Location {
    let x: Int
    let y: Int
}

// 使用结构体
let storeLocation = Location(x: 2, y: 4)
