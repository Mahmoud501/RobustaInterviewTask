//
//  RepoModel.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation

class RepoModel {
    
    
    var id: Int?
    var node_id: Int?
    var name: String?
    var full_name: String?
    var iSprivate: Bool? //private
    var owner: OwnerModel?
    var html_url: String?
    var description: String?
    var teams_url: String?
    
    
        
    init() { }
    
    init(dict: [String: Any]?) {
        self.id = dict?["id"] as? Int
        self.node_id = dict?["node_id"] as? Int
        self.name = dict?["name"] as? String
        self.full_name = dict?["full_name"] as? String
        self.iSprivate = dict?["private"] as? Bool
        let owner = dict?["owner"] as? [String: Any]
        self.owner = OwnerModel.init(dict: owner)
        self.html_url = dict?["html_url"] as? String
        self.description = dict?["description"] as? String
        self.teams_url = dict?["teams_url"] as? String
    }
    
}
