import UIKit

example(of: "加1操作") {
    
    let resutl = addOne(num: 10)
    print(resutl)
}



example(of: "柯里化") {
    
    let addThree = addTo(3)
    let result = addThree(9)
    print(result)
}
