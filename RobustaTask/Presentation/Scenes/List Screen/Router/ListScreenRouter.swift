//
//  ListScreenRouter.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

class ListScreenRouter {
    
    static var storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    static func createVC() -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: "ListScreenVC") as! ListScreenVC
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static func createNav() -> UINavigationController {
        let nav = storyboard.instantiateViewController(withIdentifier: "navList") as! UINavigationController
        nav.modalPresentationStyle = .fullScreen
        return nav
    }
    
    
}
