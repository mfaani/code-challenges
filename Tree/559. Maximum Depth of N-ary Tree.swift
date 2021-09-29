// https://leetcode.com/problems/maximum-depth-of-n-ary-tree/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        // start with a depth of 0
        
        // you add all the children of a level at once to a queue. 
        // Then you loop through each the node itself, but add its children
        // you do this until the queue is cleared out
        
        var dep = 0
        guard let root = root else { return 0 }
        guard root.children.isEmpty == false else { return 1 }
        
        var queue: [Node] = [root]
        
        while queue.isEmpty == false { 
            for node in queue { 
                queue.removeFirst()
                for child in node.children { 
                    queue.append(child)
                }                
            }
            dep += 1
        }
        
        return dep
    }
}

/* LESSONS learned: 
- read the question well enough. The question givs a hint for its special case where there's only 1 item. But also ask your interviewer
- it's interesting to clear a queue, while you're in its while block, only to add onto it again in the while block. 
- also interesting to note that all children of a given depth, get added in the same iteration — regardless of how left/right in the tree they are. 

*/

