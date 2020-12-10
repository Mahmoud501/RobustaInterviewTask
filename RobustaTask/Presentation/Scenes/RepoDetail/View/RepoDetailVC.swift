//
//  RepoDetailVC.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import UIKit

class RepoDetailVC: UIViewController {

    //variables
    var presenter: RepoDetailPresenter?
        
    //outlets
    
    @IBOutlet weak var imgOwner: UIImageView!
    @IBOutlet weak var lblDescRepo: UILabel!
    @IBOutlet weak var btnOwnerName: UIButton!
    @IBOutlet weak var btnRepoNam: UIButton!
    @IBOutlet weak var btnPrivacy: UIButton!
    @IBOutlet weak var btnRepoURL: UIButton!
    @IBOutlet weak var btnOwnerRepoURL: UIButton!
    
    
    //actions
    @IBAction func repoURLCLicked(_ sender: Any) {
        if let link = presenter?.repo?.html_url {
            if let url = URL(string: link) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func ownerRepoClicked(_ sender: Any) {
        if let link = presenter?.repo?.owner?.html_url {
            if let url = URL(string: link) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    
}

//life cycle
extension RepoDetailVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if presenter == nil {
            presenter = RepoDetailPresenter()
        }
        bind()
    }
    
}

//setupUI
extension RepoDetailVC {


}

//business of ui like binding | of any logic
extension RepoDetailVC {


}
