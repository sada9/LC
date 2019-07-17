//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


func climb(n: Int) -> Int {
    
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    var dp = Array.init(repeating: 0, count: n+1)
    
    dp[0] = 1
    dp[1] = 1
    
    for i in stride(from: 2, to: n, by: 1) {
        dp[i] = dp[i-1] + dp[i-2]
    }
    
    print("dp ", dp)
    
    return dp[n]
}

climb(n: 5)

//: [Next](@next)
