import UIKit


example(of: "算法一") {
    
    let array = [1, 3, 5, 7, 9]
    let target1 = 22
    let result1 = twoSum(nums: array, target1)
    print(result1)
    
    let target2 = 12
    let result2 = twoSum(nums: array, target2)
    print(result2)
}


example(of: "算法二") {
    
    let array = [2, 4, 6, 8, 10]
    let target = 12
    let result = twoSum1(nums: array, target)
    print(result)
}
