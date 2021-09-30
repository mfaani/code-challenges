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

// Even more slick solution
func maxDepth(_ root: Node?) -> Int {
    guard let node = root else { return 0 }
    return (node.children.map(maxDepth).max() ?? 0)  + 1
}

class Solution2 {
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


class Solution {
    var res = 0
    func maxDepth(_ root: Node?) -> Int {
        guard let node = root else { return 0}
        traverse(node, 1) 
        return res
    } 
    
    func traverse(_ node: Node, _ dep: Int) {
        guard node.children.isEmpty == false else { 
            res = max(res, 1) // exception case of having 1 item. 
            return 
        }
        res = max(res, dep + 1)
        for child in node.children { 
            traverse(child, dep + 1)
        }
    }    
}



// LESSONS: in recursions, never call your function again before your next iteration/level/mutation. you should only call yourself AFTER some mutation/leveling up
// Otherwise it would be an endless loop. 
// avoid having external param names for functions, just use `_`
// Exceptions requires hacks/tweaks and it's fine! Exceptions are usually for items that happen before you can form a base-class...
// Anytime your loop don't end it should imply your leveing down is incorrect. 
// if there aren't any queues then it's DFS, 
// DFS: is for loop on all children and recursive calling of the func on the new child...
// BFS: is enqueue node, do a WHILE loop on queue + for loop on what's in the queue, remove what's at the tip of the queue. Add each child (from the block...remember the node has just been removed) into queue. Something like that...
