//: [Previous](@previous)

// Unsolved
//func maxProfit(_ prices: [Int]) -> Int {
//   
//    var profit1 = 0
//    var profit2 = 0
//    
//    var buyPrice1 = Int.max
//    var buyPrice2 = Int.max
//    
//    var sellPrice1 = 0
//    var sellPrice2 = 0
//    
//    var isFirstBuyOver = false
//    
//    for i in 0...prices.count - 1 {
//        
//        if !isFirstBuyOver {
//            if profit1 < prices[i] - buyPrice1 {
//                profit1 = prices[i] - buyPrice1
//                sellPrice1 = prices[i]
//                isFirstBuyOver = true
//            }
//            else {
//                if prices[i] < buyPrice1 {
//                    buyPrice1 = prices[i]
//                }
//            }
//        }
//        else {
//            
//            
//            if profit2 < prices[i] - buyPrice2 {
//                profit2 = prices[i] - buyPrice2
//                sellPrice1 = prices[i]
//                isFirstBuyOver = true
//            }
//            else {
//                
//            }
//        }
//      
//        
//    }
//    
//    
//    return 0
//    
//}

//: [Next](@next)
