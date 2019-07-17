//: [Previous](@previous)

import Foundation


//Runtime: 44 ms, faster than 31.32% of Swift online submissions for Maximum Subarray.
 //   Memory Usage: 21.3 MB, less than 5.04% of Swift online submissions for Maximum Subarray.
func maxSubArray(_ nums: [Int]) -> Int {
   
    if nums.count == 1 { return nums[0] }
    var sum = nums[0]
    var maxSum = nums[0]
    for i in 1...nums.count-1 {
        print(i)
        if nums[i] < sum+nums[i] {
            sum = sum+nums[i]
        }
        else {
            sum = nums[i]
         }
        
        if maxSum < sum {
            maxSum = sum
        }
        
        print(i, nums[i], sum, maxSum)
    }
    
    return maxSum
}

//maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
maxSubArray([1])




//: [Next](@next)

//input
