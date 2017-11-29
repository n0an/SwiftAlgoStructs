//
//  Edge.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 29/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class Edge {
    var neighbor: Vertex
    var weight: Int
    
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
}
