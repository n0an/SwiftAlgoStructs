//
//  DirectedDFS.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class DirectedDFS {
    
    private var marked: [Bool]

    init(g: Digraph, s: Int) {
        self.marked = [Bool](repeating: false, count: g.getVerticesNumber())
        
        dfs(g, s)
    }
    
    init(g: Digraph, sources: Array<Int>) {
        self.marked = [Bool](repeating: false, count: g.getVerticesNumber())
        
        for s in sources {
            if !marked[s] {
                dfs(g, s)
            }
        }
    }
    
    private func dfs(_ g: Digraph, _ v: Int) {
        marked[v] = true
        
        for w in g.adjacencyList[v] {
            if !marked[w] {
                dfs(g, w)
            }
        }
    }
    
    public func marked(v: Int) -> Bool {
        return marked[v]
    }
}
