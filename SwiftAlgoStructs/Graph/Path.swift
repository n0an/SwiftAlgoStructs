//
//  Path.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 29/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//


class Path {
    
    var total: Int
    var destination: Vertex
    var previous: Path?
    
    init() {
        self.destination = Vertex()
        total = 0
    }
    
}


