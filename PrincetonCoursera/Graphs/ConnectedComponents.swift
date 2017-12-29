//
//  ConnectedComponents.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class ConnectedComponents {
    private var marked: [Bool]
    private var id: [Int]
    private var count: Int = 0
    
    init(g: Graph) {
        self.marked = [Bool](repeating: false, count: g.getVerticesNumber())
        
        self.id = [Int](repeating: 0, count: g.getVerticesNumber())
        
        for s in 0 ..< g.getVerticesNumber() {
            if !marked[s] {
                dfs(g, s)
                count += 1
            }
        }
        
    }
    
    private func dfs(_ g: Graph, _ v: Int) {
        marked[v] = true
        id[v] = count
        
        for w in g.adjacencyList[v] {
            if marked[w] {
                dfs(g, w)
            }
        }
    }
    
    public func connected(v: Int, w: Int) -> Bool {
        return id[v] == id[w]
    }
    
    public func id(v: Int) -> Int {
        return id[v]
    }
    
    public func getCount() -> Int {
        return count
    }
    
}
