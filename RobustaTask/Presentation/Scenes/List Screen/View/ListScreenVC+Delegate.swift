//
//  ListScreenVC+Delegate.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

extension ListScreenVC: ListScreenView {
    
    func finishGetList() {
        self.refreshControl.endRefreshing()
        self.showSkeleton(false)
    }
    
    func successGetList() {
        self.TVRepo.alpha = 1
        self.TVRepo.reloadData()
    }
    
    func errorGetList(error: String) {
        self.emptyGetView.alpha = 1
        self.TVRepo.alpha = 0
        self.emptyGetView.config(img: "error_image", title: "Message Error", message: error)
    }
    
}

extension ListScreenVC: ListScreenSeachView {
    
    func finishSearch() {
        self.TVRepo.reloadData()
        self.TVRepo.contentOffset.y = 0
    }
}
