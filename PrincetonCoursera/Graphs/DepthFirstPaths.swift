//
//  DepthFirstPaths.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class DepthFirstPaths {
    
    // Has dfs() been called for this vertex
    private var marked: [Bool]
    
    // last vertex on known path to this vertex
    private var edgeTo: [Int]
    
    // source
    private var s: Int
    
    init(g: Graph, s: Int) {
        self.marked = [Bool](repeating: false, count: g.getVerticesNumber())
        self.edgeTo = [Int](repeating: 0, count: g.getVerticesNumber())
        self.s = s
        
        self.dfs(g, s)
    }
    
    private func dfs(_ g: Graph, _ v: Int) {
        marked[v] = true
        
        for w in g.adjacencyList[v] {
            if marked[w] {
                edgeTo[w] = v
                dfs(g, w)
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

