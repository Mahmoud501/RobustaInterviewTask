//
//  String+Codable.swift
//  Wagb3aza
//
//  Created by Mahmoud on 7/17/1398 AP.
//  Copyright © 1398 Mahmoud. All rights reserved.
//

import Foundation
extension String
{
    var encodeUrl: String {
        get {
            return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!
        }
    }
    
}
