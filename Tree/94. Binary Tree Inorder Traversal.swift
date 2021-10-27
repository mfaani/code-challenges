// https://leetcode.com/problems/binary-tree-inorder-traversal/

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var nodes: [Int] = []        
        
        func traverse(_ node: TreeNode?) {            
            if let node = node?.left {                
                traverse(node)                
            }
            node.map { nodes.append($0.val)}
            
            if let node = node?.right { 
                traverse(node)         
            }
        }
        traverse(root)
        return nodes
    }
}

// LESSONS: I was able to resolve this simply by breaking it to the simplest form. 
// the right half is done after the left half...and so on
// INTERESTING: to see how you only log one node at a time, it's just the traversal that change. Also there's no backtrack, it's just left/right/left/right

// QUESTION:
// Given the root of a binary tree, return the inorder traversal of its nodes' values.

