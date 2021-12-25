//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // do bfs
        // which ever node that you find first, 
        // if they're in the same level then return the parent. Need to hold reference to parent
        
        // if not then look into the children of the first one you found. If present then return the first one
        var res: TreeNode?
        guard let root = root, let p = p, let q = q else { 
            return res
        }
        
        var queue: [(TreeNode, TreeNode)] = [(root,root)]
        var foundP = false
        var foundQ = false
        while !queue.isEmpty {
            var copyQ = queue
            queue.removeAll
            
            for (root,node) in queue { 
                if node.val = p.val {
                    foundP = true
                } else if node.val = q.val {
                    foundQ = true
                }
                if foundP && foundQ {
                    return parent
                } else if foundP {
                    if let left = node.left {
                        queue.append((node, left))
                    } 
                    if let r = node.right { 
                        queue.append((node, right))
                    }
                } else if foundQ {
                    
                }
            }
        }        
    }
}

/*

LESSON: If you need something but haven't passed on, then simply put, just pass it. e.g. if you need the parent nodes, then just pass that. 

If your logic is about needing to have a previous for all nodes, then perhaps for your root node, you'd need a previous node. In this case that parent node is fine to be itself. Such hacks are OK!
                GOD TIP: storing an array of (parent, node) isn't super smart. As you can't build a path with them. However you can build a path with dictionary with a dict as simple as `p = parent.get(p)`

QUESTION: 
Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

