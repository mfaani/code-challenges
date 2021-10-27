// https://leetcode.com/problems/same-tree/solution/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

Checks upon a normal traversal...
class Solution2 {
    var doesMatch = true
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        compare(p,q)
        return doesMatch
    }
    
    func compare(_ p: TreeNode?, _ q: TreeNode?) {
        guard p?.val == q?.val else { 
            doesMatch = false
            return
        }
        if p == nil { return }
        guard p?.left?.val == q?.left?.val else { 
            doesMatch = false
            return
        }                
        compare(p?.left, q?.left)
        guard p?.right?.val == q?.right?.val else {
            doesMatch = false
            return
        }
        compare(p?.right, q?.right)
    }
}

// your logic shouldn't be tried to which node you tried **first**


// MORE ELEGANT SOLUTION
// You exit early — if values don't match.
// Beyond that, you keep traversing / checking your left and right. 
// each call either exits early or has to traverse more
class Solution {
    var doesMatch = true
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if (p == nil || q == nil ) { return false }
        if (p?.val != q?.val) { return false }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

Question: 
/*

*/Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
