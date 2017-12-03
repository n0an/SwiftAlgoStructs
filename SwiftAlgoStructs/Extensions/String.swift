//
//  String.swift
//  SwiftAlgoStructs
//
//  Created by nag on 30/11/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

extension String: Keyable {
    var keystring: String {
        return self
    }
    
    var length: Int {
        return self.count
    }
    
    func substring(to: Int) -> String {
        
        let range = self.index(self.startIndex, offsetBy: to)
        
        return String(self[..<range])
        
    }
    
    
}
