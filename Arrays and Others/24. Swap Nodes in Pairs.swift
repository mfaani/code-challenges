// https://leetcode.com/problems/swap-nodes-in-pairs/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var head = head
        if head?.next == nil {
            return head
        } else {
            var dummyNode = ListNode(-1,head)
            var previousNode = dummyNode
            
            while let node = head, let nextNode = head?.next {
                let firstNode = node
                let secondNode = nextNode
                
                previousNode.next = secondNode
                firstNode.next = secondNode.next
                secondNode.next = firstNode
                
                previousNode = firstNode
                head = firstNode.next 
            }
            
            return dummyNode.next
        }  
    }
}


// 1 -> 2 -> 3 -> 4
// UPDATE ALL THE NEXTS
// previous.next = secondNode
// firstNode.next = secondNode.next
// secondNode.next = firstNode

// Update you previous node
// prevNode = firstNode

// Jump to the updated next node of the firstNode. 
// head = firstNode.next


// LESSONS: 
// FOR LINKED LISTS: always focus on settings what's next
// USE A DUMMY Previous
// 


// Quesetion: 
// Given a linked list, swap every two adjacent nodes and return its head. 
// You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

