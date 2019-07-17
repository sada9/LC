//: [Previous](@previous)

//Runtime: 24 ms, faster than 100.00% of Swift online submissions for Best Time to Buy and Sell Stock II.
//Memory Usage: 21.2 MB, less than 6.73% of Swift online submissions for Best Time to Buy and Sell Stock II.


func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 0 else { return 0 }
    
    var profit = 0
    var minPrice = Int.max
    var fprofit = 0
    
    for i in 0...prices.count-1 {
        
        if profit > (prices[i] - minPrice) {
            fprofit += profit
            profit = 0
            minPrice = prices[i]
        }
        else {
            profit = max(profit, (prices[i] - minPrice))
            minPrice = min(prices[i], minPrice)
        }
    }
     print(prices.count-1, prices[prices.count-1], fprofit, profit, minPrice)
    fprofit += profit
    
    return fprofit
}

maxProfit([7,1,5,3,6,4,8])
maxProfit([1,2,3,4,5])

maxProfit([2,1,2,0,1])

//maxProfit([4,3,2,1])


//: [Next](@next)
