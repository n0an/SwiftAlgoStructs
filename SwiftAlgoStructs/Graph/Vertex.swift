//
//  Vertex.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 29/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

public class Vertex {
    var key: String?
    var neighbors: Array<Edge>
    var visited = false
    
    init() {
        self.neighbors = Array<Edge>()
    }
}

extension Vertex: Keyable {
    var keystring: String {
        return self.key!
    }
}
