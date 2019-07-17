//: [Previous](@previous)

// example 1 2 3 1

// 2 houses - none
// 3 houses - house 2 // 1 2 3
// 4 houses -   //  1 2 3 1  arrayrange(1-(n-1)) or arrayrange(2-(n)) whichever is greater
// 5 houses -  // 1 2 3 4 1


// try top down
// 5 houses -  // 1 2 3 4 1 / 6
    // 1 2 3 4 /1+3
        // 1 2 3 /2
        // 2 3 4 /3

    // 2 3 4 1 // 2+4
        // 2 3 4 /3
        // 3 4 1 /4

func rob1(_ nums: [Int]) -> Int {
    
    let n = nums.count
    if n == 0 { return 0 }
    if n == 1 { return nums[0] }
    if n == 2 { return max(nums[0], nums[1]) }
    
    let la = Array(nums.dropFirst())
    let ra = Array(nums.dropLast())
    
    let l = rob(la)
    let r = rob(ra)
    
    print("n=", n, "nums=", nums, "la=", la, "ra=", ra, " --> l=", l, "r=", r)
    if n % 2 == 0 {
//        if r == l {
//            return r + max(nums[n-1] , nums[0])
//        }
        
        return max(nums[n-1] + r, nums[0] + l)

    }
    else {
        return max(r, l)
    }
}

func rob(_ nums: [Int]) -> Int {
    let count = nums.count
    var dpleft =  Array<Int>(repeating: 0, count: count)
    var dpright =  Array<Int>(repeating: 0, count: count)
    
    if count == 0 { return 0 }
    
    if count == 1 { return nums[0] }
    
    if count == 2 { return max(nums[0], nums[1]) }
   
    dpleft[0] = nums[0]
    dpleft[1] = max(nums[0], nums[1])
   
    
    // process 0 to n-2
    for i in stride(from: 2, to: dpleft.count-1, by: 1) {
        
    dpleft[i] = max(dpleft[i-1], (nums[i] + dpleft[i-2]))
    print("dpleft", dpleft, ", i", i)
        
    }
    print("final dpleft", dpleft)
    
    print("------")
    
    dpright[0] = 0
    dpright[1] = nums[1]
    dpright[2] = max(nums[1], nums[2])
    
    print("dpright", dpright)
    // process 1 to n-1
    for i in stride(from: 3, to: dpright.count, by: 1) {
         dpright[i] = max(dpright[i-1], (nums[i] + dpright[i-2]))
        print("dpright=", dpright, ", i=", i, "nums[i]=", nums[i])
    }
    
    print("final dpright", dpright)
    
    return max(dpleft[count-2], dpright[count-1])
    
}

rob([1,3,1,3,100])
rob([1,2,1,0])
rob([1,1,1,2])
rob([1])
rob([2, 3, 2, 1])
rob([1,7,9,4])
rob([2, 3, 2])


//let a = [1, 3, 2, 1]
//a.dropLast()
//a.dropFirst()

//max(1,2)
//: [Next](@next)
