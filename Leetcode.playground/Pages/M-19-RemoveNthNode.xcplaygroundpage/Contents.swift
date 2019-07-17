//: [Previous](@previous)

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    func addNext(_ val: Int) {
        
    }
}

 func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    var start = head
    var runner = head
    
    //Move fast in front so that the gap between slow and fast becomes n
    for _ in 1...n {
        runner = runner?.next
    }
    
    //Move fast to the end, maintaining the gap
    while(runner != nil) {
        start = start?.next;
        runner = runner?.next
    }
    //Skip the desired node
    start?.next = start!.next!.next;
    
    return start!.next;
    
}

let head = ListNode(1)
let l = ListNode(1)

//: [Next](@next)
