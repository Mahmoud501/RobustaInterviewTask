//
//  RepoDetailRouter.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

class RepoDetailRouter {
    
    static var storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    
    static func createVC(repo: RepoModel?) -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: "RepoDetailVC") as! RepoDetailVC
        vc.modalPresentationStyle = .fullScreen
        let presenter = RepoDetailPresenter.init()
        presenter.repo = repo
        vc.presenter = presenter
        return vc
    }
    
}
