//: [Previous](@previous)

import Foundation

// REMEMBER, YOu TOOK more than 15 mins solve this.

//Runtime: 172 ms, faster than 7.32% of Swift online submissions for Duplicate Zeros.
//Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Duplicate Zeros.
func duplicateZeros(_ arr: inout [Int]) {
    
    var i = 0
    
    while(i <= arr.count-1) {
        if arr[i] == 0 {
            
            var j = arr.count - 1
            
            while j>i {
                arr[j] = arr[j-1]
                j-=1
            }
            if i+1 < arr.count {
                 arr[i+1] = 0
            }
           
            i+=1
        }
        i+=1
    }
}

//Runtime: 40 ms, faster than 97.56% of Swift online submissions for Duplicate Zeros.
//Memory Usage: 21.4 MB, less than 100.00% of Swift online submissions for Duplicate Zeros.
func duplicateZeros1(_ arr: inout [Int]) {
    var result: [Int] = []
    
    var i = 0
    while(i <= arr.count-2 && (result.count < arr.count)) {
        
        if arr[i] == 0  {
            result.append(0)
            
            if((result.count < arr.count)) {
                result.append(0)
            }
            
            i+=1
            continue
        }
        else {
            result.append(arr[i])
            i+=1
        }
    }
    
    if arr.count == result.count {
        arr = result
    }
   
}

//Runtime: 40 ms, faster than 97.59% of Swift online submissions for Duplicate Zeros.
//Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Duplicate Zeros.

func duplicateZeros2(_ arr: inout [Int]) {
    
    var result: [Int] = Array(repeating: 0, count: arr.count)
    
    var i = 0
    var j = 0
    while(i <= arr.count-1 && j <= result.count-1) {
        
        if arr[i] == 0  {
            j+=1
        }
        else {
            result[j] = arr[i]
        }
        
        i+=1
        j+=1
    }
    
   arr = result
}



// Best solution
// 36mins
// BUT NOT SURE HOW IS THIS BEST SOLUTION, DOES THE SAME THING AS MINE ABOVE
func duplicateZeros4(_ arr: inout [Int]) {
    let copy = arr
    let n = arr.count
    
    var stack = [Int]()
    
    var x = 0
    var y = 0
    while y < n {
        
        if copy[x] == 0 && y < n-1 {
            arr[y] = 0
            y += 1
            arr[y] = 0
        } else {
            arr[y] = copy[x]
        }
        
        
        x += 1
        y += 1
    }
}

var x = [1,0,2,3,0,4,5,0]
duplicateZeros3(&x)

x = [1,2,3]
duplicateZeros2(&x)

x = [0,0,0,0,0,0,0]
duplicateZeros2(&x)

x = []
duplicateZeros2(&x)

//: [Next](@next)
