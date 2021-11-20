// https://leetcode.com/problems/balanced-binary-tree/
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
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        if abs(height(root?.left) - height(root?.right)) > 1 {
            return false   
        }
        return isBalanced(root?.left) && isBalanced(root?.right)
    }
    
    func height(_ root: TreeNode?) -> Int { 
        var lh: Int = 0
        var rh: Int = 0
        guard let root = root else { return 0}
        if root.left == nil && root.right == nil { return 1}
        
        if let left = root.left { 
            lh = height(left) + 1
        }
        if let right = root.right {
            rh = height(right) + 1
        }
        return max(lh,rh)
    }
}
 
// LESSONS
// Single node and empty node aren't equal. Always ask/accomodate for that. 
// Recursion is beautiful. The answer and the subanswers start from the same code. Like they start from a 0, -1 value in most questiona. 
// What makes them different is that one returns immediately and allows others to backtrack with an increment/mutation

// MISTAKE: I thought I can give it a pass if: I just look two levels down. But that isn't considerate of the global. Not sure really...
// QUESTION: 
/*
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

*
