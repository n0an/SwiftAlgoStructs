//
//  Graph.swift
//  PrincetonCoursera
//
//  Created by nag on 29/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class Graph {
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

//        for index in 0 ..< verticesNumber {
//            adjacencyList[index] = Bag<Int>()
//        }
        
    }
    
    public func addEdge(v: Int, w: Int) {
        adjacencyList[v].add(item: w)
        adjacencyList[w].add(item: v)
        edgesNumber += 1
    }
    
}
