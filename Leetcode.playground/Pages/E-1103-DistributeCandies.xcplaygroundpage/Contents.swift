//: [Previous](@previous)


//Runtime: 8 ms, faster than 74.36% of Swift online submissions for Distribute Candies to People.
//Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Distribute Candies to People.

// Optimize this more

func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    
    var remaining = candies
    var distribution = Array(repeating: 0, count: num_people)
    
    var prevCount = 0
    
    while(remaining != 0) {
        for i in (0...num_people-1) {
            print(i, remaining, prevCount, distribution)
            if remaining >= (prevCount+1) {
                distribution[i] += (prevCount+1)
                prevCount = (prevCount+1)
                remaining -= prevCount
            }
            else {
                distribution[i] += remaining
                remaining = 0
            }
        }
    }
    
    return distribution
}



//distributeCandies(7, 4)
distributeCandies(10, 3)









//: [Next](@next)
