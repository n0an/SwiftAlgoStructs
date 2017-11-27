//
//  BSNode.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 27/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class BSNode<T> {
    var key: T?
    var left: BSNode?
    var right: BSNode?
    var height = 0
}


