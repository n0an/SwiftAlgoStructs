//
//  Graph.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 29/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// *** Bishop

public class Graph {
    
    // declare graph canvas
    private var canvas: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        self.canvas = Array<Vertex>()
        isDirected = true
    }
    
    // create a new vertex
    func addVertex(key: String) -> Vertex {
        
        // set the key
        let childVertex = Vertex()
        childVertex.key = key
        
        // add the vertex to the graph canvas
        canvas.append(childVertex)
        
        return childVertex
    }
    
    // add edge to source vertex
    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        
        // new edge
        let newEdge = Edge()
        
        // establish default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        print("The neighbor of vertex: \(source.key ?? "nil") is \(neighbor.key ?? "nil")..")
        
        // check condition for an unidirected graph
        if !isDirected {
            
            // create a new reversed edge
            let reversedEdge = Edge()
            
            // establish the reversed properties
            reversedEdge.neighbor = source
            reversedEdge.weight = weight
            neighbor.neighbors.append(reversedEdge)
            
            print("The neighbor of vertex: \(neighbor.key ?? "nil") is \(source.key ?? "nil")..")

        }
    }
    
    // reverse the sequence of paths given the shortest path. process analagous to reversing a linked list.
    
    func reversePath(_ head: Path!, source: Vertex) -> Path! {
        
        guard head != nil else {
            return head
        }
        
        //mutated copy
        var output = head
        
        var current: Path! = output
        var prev: Path!
        var next: Path!
        
        while(current != nil) {
            next = current.previous
            current.previous = prev
            prev = current
            current = next
        }
        
        //append the source path to the sequence
        let sourcePath: Path = Path()
        
        sourcePath.destination = source
        sourcePath.previous = prev
        sourcePath.total = 0
        
        output = sourcePath
        
        return output
    }
    
    // Optimized version of Dijkstra's shortest path algorithm
    func processDijkstra(source: Vertex, destination: Vertex) -> Path? {
        
        var frontier = Array<Path>()
        var finalPaths = Array<Path>()
        
        // use source edges to create the frontier
        for edge in source.neighbors {
            
            let newPath = Path()
            
            newPath.destination = edge.neighbor
            newPath.previous = nil
            newPath.total = edge.weight
            
            frontier.append(newPath)
        }
        
        print("frontier.count after looking through source.neighbors = \(finalPaths.count)")

        
        // construct the best path
        var bestPath: Path = Path()
        
        while frontier.count != 0 {
            
            // support path changes using the greedy approach
            bestPath = Path()
            var pathIndex = 0
            
            for index in 0 ..< frontier.count {
                
                let itemPath = frontier[index]
                
                if bestPath.total == 0 || itemPath.total < bestPath.total {
                    bestPath = itemPath
                    pathIndex = index
                }
                
            }
            
            // enumerate the bestPath edges
            for edge in bestPath.destination.neighbors {
                
                let newPath = Path()
                
                newPath.destination = edge.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + edge.weight
                
                // add the new path to the frontier
                frontier.append(newPath)
            }
            
            print("frontier.count after looking through bestPath.destination.neighbors = \(finalPaths.count)")

            
            // preserve the bestPath
            finalPaths.append(bestPath)
            
            print("finalPaths.count = \(finalPaths.count)")
            
            // remove the bestPath from the frontier
            frontier.remove(at: pathIndex)
        }
        
        print("finalPaths after WHILE LOOP = \(finalPaths.count)")

        var shortestPath = Path()
        
        for itemPath in finalPaths {
            
            if itemPath.destination.key == destination.key {
                if shortestPath.total == 0 || itemPath.total < shortestPath.total {
                    shortestPath = itemPath
                }
            }
        }
        
        return shortestPath
    }
    
    // Dijkstra's shortest path algorithm
    func processDijkstraWithHeap(source: Vertex, destination: Vertex) -> Path? {

        let frontier: PathHeap = PathHeap()
        let finalPaths: PathHeap = PathHeap()
        
        // use source edges to create the frontier
        for edge in source.neighbors {
            
            let newPath = Path()
            
            newPath.destination = edge.neighbor
            newPath.previous = nil
            newPath.total = edge.weight
            
            frontier.enQueue(key: newPath)
        }
        
        // construct the best path
        while frontier.count != 0 {
            
            // use the greedy approach to obtain the best path
            guard let bestPath = frontier.peek() else {
                break
            }
            
            // enumerate the bestPath edges
            
            for edge in bestPath.destination.neighbors {
                
                let newPath = Path()
                
                newPath.destination = edge.neighbor
                newPath.previous = bestPath
                newPath.total = bestPath.total + edge.weight
                
                // addd the new path to the frontier
                frontier.enQueue(key: newPath)
            }
            
            // preserve the bestPaths that match destination
            if bestPath.destination.key == destination.key {
                finalPaths.enQueue(key: bestPath)
            }
            
            // remove the bestPath from the frontier
            frontier.deQueue()
            
        }
        
        // obtain the shortest path from the heap
        return finalPaths.peek()
        
    }
    
}
