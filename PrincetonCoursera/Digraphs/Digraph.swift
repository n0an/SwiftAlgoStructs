//
//  Digraph.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class Digraph {
    private var verticesNumber: Int
    private var edgesNumber: Int
    
    public func getVerticesNumber() -> Int {
        return verticesNumber
    }
    
    public func getEdgesNumber() -> Int {
        return edgesNumber
    }
    
    var adjacencyList: [Bag<Int>]
    
    init(verticesNumber: Int) {
        self.verticesNumber = verticesNumber
        self.edgesNumber = 0
        
        self.adjacencyList = Array<Bag<Int>>(repeating: Bag<Int>(), count: verticesNumber)
        
    }
    
    public func addEdge(v: Int, w: Int) {
        adjacencyList[v].add(item: w)
        edgesNumber += 1
    }
    
    public func getIterator(_ v: Int) -> Bag<Int> {
        return adjacencyList[v]
    }
    
    public func reverse() -> Digraph {
        let reversed = Digraph(verticesNumber: self.verticesNumber)
        
        for v in 0 ..< self.verticesNumber {
            for w in adjacencyList[v] {
                reversed.addEdge(v: w, w: v)
            }
        }
        
        return reversed
    }
}
