//
//  RepoDetailVC+Bind.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

extension RepoDetailVC {

    func bind() {
        let repo = presenter?.repo
        self.imgOwner.loadImage(fromURL: repo?.owner?.avatar_url ?? "")
        self.btnOwnerName.setTitle(repo?.owner?.login ?? "", for: .normal)
        self.btnRepoNam.setTitle(repo?.name ?? "", for: .normal)
        self.btnRepoURL.setTitle(repo?.html_url ?? "", for: .normal)
        self.btnOwnerRepoURL.setTitle(repo?.owner?.html_url ?? "", for: .normal)
        let privacyString = repo?.iSprivate == true ? "Private" : "Public"
        self.btnPrivacy.setTitle(privacyString, for: .normal)
        self.lblDescRepo.text = repo?.description
    }
    
    

}
