//: [Previous](@previous)

import Foundation

func trap1(_ height: [Int]) -> Int {
    
    
    var water = 0
    var maxLeftHeight = height[0]
    var i = 0
    var j = 1
    
    while i < j && i < height.count-1 {
        print(">>", i, j)
        
         while(height[j] <= height[i] && j < height.count) {
            j+=1
         }
        
        if j == height.count-1 {
           i+=1
           j = i+1
            
            continue
        }
        else if maxLeftHeight != 0 {
            water +=  (min(height[j], maxLeftHeight) - height[i])
            
            print(">>", j, i, height[j], maxLeftHeight, height[i], water)
        }
        
        maxLeftHeight = max(height[i], maxLeftHeight)
        
        i+=1
        
        if i == j {
            j+=1
        }
        
        
        print("<<", i, j)
    }
    
    return water
}

// Runtime: 24 ms, faster than 98.39% of Swift online submissions for Trapping Rain Water.
// Memory Usage: 21.2 MB, less than 5.41% of Swift online submissions for Trapping Rain Water.
func trap(_ height: [Int]) -> Int {
    
    guard height.count > 2 else { return 0 }
    var water = 0
 
    var leftMaxBar = height[0]
    var rightMaxBar = height[height.count - 1]
    
    var i = 0
    var j = height.count - 1
    
    var nextHeight = height[0]
    
    
    while i < j {
        
        let w = min(leftMaxBar, rightMaxBar) - nextHeight
        water +=  w > 0 ? w : 0
        
        leftMaxBar = max(leftMaxBar, height[i])
        rightMaxBar = max(rightMaxBar, height[j])
        
        if leftMaxBar <= rightMaxBar {
             i+=1
            nextHeight = height[i]
        }
        else {
            j-=1
            nextHeight = height[j]
        }
        print(i, j, height[i], height[j], leftMaxBar, rightMaxBar, nextHeight, water)
     }
 
    return water
}


trap([0,1,0,2,0,1])
trap([0,1,0,1,2,1,0,1,3])
trap([0,2,0,1])
trap([0,1,0,2,1,0,1,3,2,1,2,1])

trap([])
trap([2,1])
trap([0,1,0,1])

trap([4,2,3])

trap([0,1,0,2,1,0,1,3,2,1,2,1])


//ANOTHERE SOLUTION FROM LC -
// TAKE A LOOK looks better
func trapXX(_ heights: [Int]) -> Int {
    
    guard heights.count > 2 else { return 0 }
    
    var left = 0
    var right = heights.count - 1
    var result = 0
    var leftMax = 0
    var rightMax = 0
    
    while left < right {
        if heights[left] < heights[right] {
            if heights[left] >= leftMax {
                leftMax = heights[left]
            } else {
                let water = leftMax - heights[left]
                result += water > 0 ? water : 0
            }
            left += 1
        } else {
            if heights[right] >= rightMax {
                rightMax = heights[right]
            } else {
                let water = rightMax - heights[right]
                result += water > 0 ? water : 0
            }
            right -= 1
        }
    }
    return result
}


//: [Next](@next)
