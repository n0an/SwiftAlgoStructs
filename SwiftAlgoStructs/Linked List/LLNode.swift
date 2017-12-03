//
//  LLNode.swift
//  SwiftAlgoStructs
//
//  Created by Anton Novoselov on 03/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}
