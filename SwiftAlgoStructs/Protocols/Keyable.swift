//
//  Keyable.swift
//  SwiftAlgoStructs
//
//  Created by nag on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

// determine hash table compliance
protocol Keyable {
    
    // conforming types require property
    var keystring: String { get }
    
    func hashIndex<T>(for key: String?, using buckets: Array<T>) -> Int
}


extension Keyable {
    
    func hashIndex<T>(for key: String?, using buckets: Array<T>) -> Int {
        var remainder = 0
        var divisor = 0
        
        guard let key = key else {
            return -1
        }
        
        for item in key.unicodeScalars {
            divisor += Int(item.value)
        }
        
        remainder = divisor % buckets.count
        
        return remainder
    }
}

