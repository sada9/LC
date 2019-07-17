//: [Previous](@previous)

// Time out  - Coun't finish with in time for huge input array
func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
    
    guard n != 0 else { return Array<Int>() }
    var result = Array(repeating:0, count: n)
    
    for i in 0...bookings.count - 1 {
        for j in bookings[i][0]...bookings[i][1] where j <= n {
            result[j-1] = result[j-1] + bookings[i][2]
        }
    }
    
    return result
}

//Runtime: 1232 ms, faster than 72.73% of Swift online submissions for Corporate Flight Bookings.
//Memory Usage: 24.3 MB, less than 100.00% of Swift online submissions for Corporate Flight Bookings.
func corpFlightBookings2(_ bookings: [[Int]], _ n: Int) -> [Int] {
    
     var result = Array(repeating: 0, count: n)
    
    for i in 0...bookings.count - 1 {
        let st = bookings[i][0]
        let end = bookings[i][1]
        let seats = bookings[i][2]
        
        result[st-1] += seats
        
        if end < n {
            result[end] -= seats
        }
     }
    
    if n > 1 {
        for i in 1...n - 1 {
            result[i] += result[i-1]
        }
     }
   
    return result
}

//corpFlightBookings2([[1,2,10],[2,3,20],[2,5,25]], 5)
//corpFlightBookings([[1,2,10],[2,3,20],[2,5,25]], 0)

corpFlightBookings2([[1,1,10]], 1)


//: [Next](@next)
