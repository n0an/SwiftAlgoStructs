//
//  BreadthFirstPaths.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class BreadthFirstPaths {
    
    // Is a shortest path to this vertex known?
    private var marked: [Bool]
    
    // last vertex on known path to this vertex
    private var edgeTo: [Int]
    
    // source
    private var s: Int
    
    init(g: Graph, s: Int) {
        self.marked = [Bool](repeating: false, count: g.getVerticesNumber())
        self.edgeTo = [Int](repeating: 0, count: g.getVerticesNumber())
        
        self.s = s
        
        self.bfs(g, s)
    }
    
    private func bfs(_ g: Graph, _ s: Int) {
        
        let queue = Queue<Int>()
        
        // Mark the source
        marked[s] = true
        
        // And put it on the queue
        queue.enqueue(item: s)
        
        while !queue.isEmpty {
            // Remove next vertex from the queue
            let v = (queue.dequeue())!
            
            for w in g.adjacencyList[v] {
                // For every unmarked adjacent vertex,
                if !marked[w] {
                    // Save last edge on a shortest path,
                    edgeTo[w] = v
                    // mark it because path is known,
                    marked[w] = true
                    // and add it to the queue
                    queue.enqueue(item: w)
                }
            }
        }
    }
    
    public func hasPathTo(_ v: Int) -> Bool {
        return marked[v]
    }
    
    public func pathTo(_ v: Int) -> Stack<Int>? {
        if !hasPathTo(v) { return nil }
        
        let path = Stack<Int>()
        
        var x = v
        
        while x != s {
            path.push(item: x)
            x = edgeTo[x]
        }
        
        path.push(item: s)
        
        return path
    }
}
