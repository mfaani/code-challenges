// https://leetcode.com/problems/binary-tree-level-order-traversal/
class Solution {
    var nodes: [[Int]] = []
    var queue: [TreeNode] = []
    func levelOrder(_ root: TreeNode?) -> [[Int]] {        
        guard let root = root else { return nodes }
        queue.append(root)
        
        while queue.isEmpty == false {
            var currentLevel = queue
            queue = [] 
            let vals: [Int] = currentLevel.map { $0.val}
            nodes.append(vals)
            for node in currentLevel { 
                node.left.map { queue.append($0)}
                node.right.map { queue.append($0)}
            }
        }
        return nodes
    }
}
// PRO-TIP: For BFS: you most likely need to just do an `while queue.isEmpty == false` check as opposed to `while let node = queue.popFirst()`
// With BFS you just need to have a good setup and then begin. There's no recursion per sae

// Question: 

// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

