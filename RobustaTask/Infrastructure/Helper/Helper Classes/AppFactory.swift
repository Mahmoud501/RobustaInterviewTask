//
//  AppFactory.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/8/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

class AppFactory {
    
    static let shared = AppFactory()
    
    private init() { }
    
    var isPad: Bool {
        get {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    
    
}

class calator {
    func cal(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}
