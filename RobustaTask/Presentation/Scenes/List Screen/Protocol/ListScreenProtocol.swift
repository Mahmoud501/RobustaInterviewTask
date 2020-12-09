//
//  ListScreenProtocol.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation

protocol ListScreenView: class {
    
    func finishGetList()
    func successGetList()
    func errorGetList(error: String)
    
}


protocol ListScreenSeachView: class {
    func finishSearch()
}


protocol ListScreenDataSource {
        
    var list: [RepoModel]? { get set }
    
}

protocol ListScreenDelegate {
    
    func getRepoList()
    func search(text: String)
    
}
