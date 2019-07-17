
//: [Previous](@previous)


// This is recuriver solution
func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
    var count = 0
    var coinsList = coins
    var remainingAmt = amount
    
    print("coins: ", coins)
    
    for i in (0...(coins.count - 1)).reversed() {
        
        if(coinsList[i] <= remainingAmt && coinsList[i] != 0) {
            print("coins: ", coinsList[i], "remaining: ", remainingAmt)
            if(remainingAmt > 0) {
                remainingAmt = remainingAmt - coinsList[i]
            }
            else {
                remainingAmt = remainingAmt + coinsList[i]
            }
            if remainingAmt == 0 {
                return 1
            }
            else if remainingAmt > 0 {
                count = 1 + coinChange1(coinsList, remainingAmt)
                return count
            }
        }
        let _ = coinsList.removeLast()
    }
    
    return count
}
//print(coinChange1([186,419,83,408], 6249))



func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    
    var count = 0
    var amt = amount
    for (_, coin) in coins.sorted().enumerated().reversed() where coin <= amt {
        
        while(coin<=amt) {
            count+=1
            amt-=coin
            print(coin, amt)
        }
    }
    
    if amt != 0 {
        count = -1
    }
    
    return count
}

// ----------_Works great ----------
func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
    var ways = Array<Int>(repeating: 0, count: amount+1)
    ways[0] = 1
    var numberOfCoins = ways
    
    //coinChangeDP(coins, amount, &ways, &numberOfCoints)
    
    for coin in coins {
        print("----------- ", coin, " -----------")
        for amt in stride(from: 0, to: amount+1, by: 1) {
            
            if(amt >= coin) {
                print("amt:", amt, " prev:", ways[amt], " last:", ways[amt - coin], " next:", ways[amt]+ways[amt - coin] )
                ways[amt] = ways[amt - coin] + ways[amt]
                numberOfCoins[amt] += 1
            }
        }
        print(ways)
        print(numberOfCoins)
    }
    
    return numberOfCoins[amount] == 0 ? -1 : numberOfCoins[amount]
}
// This is similar to this explaination -
//https://www.geeksforgeeks.org/understanding-the-coin-change-problem-with-dynamic-programming/
func coinChangeDP(_ coins: [Int], _ amount: Int, _ ways: inout [Int], _ numberOfCoints: inout [Int]) {
    ways[0] = 1
    numberOfCoints[0] = 1
    
    print(ways)
    for coin in coins {
         print("----------- ", coin, " -----------")
        for amt in stride(from: 0, to: amount+1, by: 1) {
            
            if(amt >= coin) {
                print("amt:", amt, " prev:", ways[amt], " last:", ways[amt - coin], " next:", ways[amt]+ways[amt - coin] )
                 ways[amt] = ways[amt - coin] + ways[amt]
                numberOfCoints[amt] += 1
            }
        }
        print(ways)
        print(numberOfCoints)
    }
}


func coinChange_Final(_ coins: [Int], _ amount: Int) -> Int {
     var dp = Array(repeating: 0, count: amount+1)
    
     dp[0] = 1
    
    for coin in coins {
        print("---", coin)
        for i in 1...amount where i >= coin {
            let prev = dp[i]
            dp[i] =  dp[i] + dp[i-coin]
            print(i, coin, i-coin, dp[i-coin], prev, dp[i])
         }
    }
    print(dp)
    return dp[amount]
    
}


//Runtime: 128 ms, faster than 92.78% of Swift online submissions for Coin Change.
//Memory Usage: 20.8 MB, less than 9.30% of Swift online submissions for Coin Change.

func coinChange_Accepted(_ coins: [Int], _ amount: Int) -> Int {
    
    if amount == 0 { return 0 }
    
    var dp: [Int]= Array(repeating: 0, count: amount+1)
    
    
    for coin in coins {
        if coin > amount { continue }
        for i in 1...amount where i >= coin {
            
 
            if i == coin {
                dp[i] = 1
            }
            else if dp[i] == 0 && dp[i-coin] != 0 {
                dp[i] = dp[i-coin]+1
            }
            else if dp[i] != 0 && dp[i-coin] != 0 {
                dp[i] =  min(dp[i], dp[i-coin]+1)
            }
            
        }
    }
    
    return dp[amount] == 0 ? -1 : dp[amount]
    
}


//Runtime: 108 ms, faster than 98.45% of Swift online submissions for Coin Change.
//Memory Usage: 20.8 MB, less than 9.30% of Swift online submissions for Coin Change.

func coinChange_Optimized(_ coins: [Int], _ amount: Int) -> Int {
    
    if amount == 0 { return 0 }
    
    var dp = Array(repeating: 0, count: amount+1)
    
    for coin in coins {
        print("---", coin)
        if coin > amount { continue }
        for i in 1...amount where i >= coin {
            
            let prev = dp[i]
            
            if i == coin {
                dp[i] = 1
            }
            else if dp[i-coin] != 0 {
                if dp[i] == 0 {
                    dp[i] = dp[i-coin]+1
                }
                else {
                    dp[i] =  min(dp[i], dp[i-coin]+1)
                }
            }
            
        }
        print(dp)
    }
    
    return dp[amount] == 0 ? -1 : dp[amount]
    
}

//func coinChange_More(_ coins: [Int], _ amount: Int) -> Int {
//    var dp = Array(repeating: 0, count: coins.count+1)
//
//
//
//
//}

coinChange_Accepted([1], 0)
coinChange_Accepted([2], 3)
coinChange_Accepted([1, 2, 3], 8)

coinChange_Accepted([1, 2, 3, 5], 11)

coinChange_Accepted([1, 2, 3, 5, 10], 9)

coinChange_Accepted([1, 2, 4], 3)

coinChange_Accepted([2], 3)

coinChange_Accepted([10, 25], 225)

coinChange_Accepted([186,419,83,408], 6249)


// 1. Solution bottom - up approach
// This is from LC solutions, habe't analyzed this is what I tried doing initially
func coinChange_FromLC(_ coins: [Int], _ amount: Int) -> Int {
    guard amount > 0 else { return 0 }
    let max = amount + 1
    var dp: [Int] = Array(repeating: max, count: max)
    dp[0] = 0
    for i in 1...amount {
        for j in 0..<coins.count {
            if coins[j] <= i {
                dp[i] = min(dp[i], dp[i - coins[j]] + 1)
            }
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}

//coinChange_Real([83,186,408,419], 6249)
//: [Next](@next)
