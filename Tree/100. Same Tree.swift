// https://leetcode.com/problems/same-tree/solution/

class Solution {
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
        // no more comparisons from below _this empty_ node, but other nodes might still continue
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

Question: 
/*

*/Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
