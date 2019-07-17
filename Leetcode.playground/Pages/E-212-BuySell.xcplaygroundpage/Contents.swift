//: [Previous](@previous)

import Foundation

//Runtime: 32 ms, faster than 99.51% of Swift online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 21.1 MB, less than 5.05% of Swift online submissions for Best Time to Buy and Sell Stock.


func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else { return 0 }
    let count = prices.count
    
    var minPrice = Int.max
    var profit = 0
    
    for i in 0...count-1 {
        profit = max(profit, (prices[i] - minPrice))
        minPrice = min(prices[i], minPrice)
    }
    
    return profit
}

//maxProfit([7, 3, 5, 2, 3, 1])
//maxProfit([7, 1, 5, 12, 11, 2])
 //maxProfit([7, 2, 5, 6, 11, 1, 11, 2])
//maxProfit([7, 2, 5, 6, 9, 1, 11, 2])

//maxProfit([7,6,4,3,1])
maxProfit([])


//: [Next](@next)
