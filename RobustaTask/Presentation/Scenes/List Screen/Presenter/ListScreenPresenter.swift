//
//  ListScreenPresenter.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation

class ListScreenPresenter: ListScreenDataSource {
  
    var list: [RepoModel]?
    weak var GetListView: ListScreenView?
    
    init(GetListView: ListScreenView?) {
        self.GetListView = GetListView
    }
    
}

extension ListScreenPresenter: ListScreenDelegate {
    
    func getRepoList() {
        NetworkHandler.getJsonArrayResponse(NetworkRouter.ListRepo, success: { (array) in
            self.GetListView?.finishGetList()
            let arr = array as? [[String: Any]]
            self.list = arr?.map { RepoModel.init(dict: $0) }
            self.GetListView?.successGetList()
        }) { (error) in
            self.GetListView?.finishGetList()
            self.GetListView?.errorGetList(error: error.localizedDescription)
        }
    }
    
    
    
}
