//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/** 1、结构体的基本介绍 */
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



/** 2、访问结构体的成员 */

struct DeliveryArea {
    let center: Location
    var radius: Double
}

var storeArea = DeliveryArea(center: storeLocation, radius: 4)

print(storeArea.radius)
print(storeArea.center.x)

storeArea.radius = 250




/** 3、方法 */

let areas = [
    DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 9, y: 7), radius: 4.5)
]


func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: (area.center.x, area.center.y),
                                       to: (location.x, location.y))
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

print(isInDeliveryRange(customerLocation1)) // false
print(isInDeliveryRange(customerLocation2)) // true



