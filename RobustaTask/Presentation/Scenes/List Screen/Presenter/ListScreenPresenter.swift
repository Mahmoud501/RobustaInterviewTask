//
//  ListScreenPresenter.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation

class ListScreenPresenter: ListScreenDataSource {
  
    var cacheList: [RepoModel]? // cache list is all repos
    var list: [RepoModel]? // list is display repos may be all , or may be filter by name
    weak var GetListView: ListScreenView?
    weak var SeachView: ListScreenSeachView?
    
    init(GetListView: ListScreenView?) {
        self.GetListView = GetListView
    }
    
}

extension ListScreenPresenter: ListScreenDelegate {
    
    func search(text: String)  {
        if text.count >= 2 {            
            self.list = self.cacheList?.filter{ ($0.name?.contains(text) ?? false) }
        }else {
            if text.count == 0 {
                self.list = self.cacheList
            }
        }
        SeachView?.finishSearch()
    }
    
    
    func getRepoList() {
        NetworkHandler.getJsonArrayResponse(NetworkRouter.ListRepo, success: { (array) in
            self.GetListView?.finishGetList()
            let arr = array as? [[String: Any]]
            self.cacheList = arr?.map { RepoModel.init(dict: $0) }
            self.list = self.cacheList
            self.GetListView?.successGetList()
        }) { (error) in
            self.GetListView?.finishGetList()
            self.GetListView?.errorGetList(error: error.localizedDescription)
        }
    }
    
    
    
}
