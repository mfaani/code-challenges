// https://www.raywenderlich.com/773-swift-algorithm-club-graphs-with-adjacency-list
public struct Vertex<T: Hashable> {
    var data: T
}
extension Vertex: Hashable { }

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> { 
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double?
}

extension Edge: Hashable {}

/// tldr in this setup, the nodes don't hold information itself, rather the adjacency list holds onto that information. 
protocol Graphable { 
    associatedtype Element: Hashable
    func createVertex(data: Element) -> Vertex<Element>
    func add(type: EdgeType, from: Vertex<Element>, to: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element> , to destination: Vertex<Element>) -> Double? 
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
}

public class AdjacencyList<T: Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graphable {
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        <#code#>
    }
    
    public typealias Element = T
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    public func add(type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        guard let edges = adjacencyDict[source] else { // 1
            return nil
        }
        
        for edge in edges { // 2
            if edge.destination == destination { // 3
                return edge.weight
            }
        }
        
        return nil // 4
    }
    
    public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
        return adjacencyDict[source]
    }
    
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
    
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight) // 1
        adjacencyDict[source]?.append(edge) // 2
    }
    
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    

} 
