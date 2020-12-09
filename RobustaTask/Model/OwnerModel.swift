//
//  OwnerModel.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation

class OwnerModel {
    
    var login: String?
    var id: Int?
    var node_id: String?
    var avatar_url: String?
    var gravatar_id: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    var organizations_url: String?
    var repos_url: String?
    var events_url: String?
    var received_events_url: String?
    var type: String?
    var site_admin: Bool?

    
    init() { }
    
    init(dict: [String: Any]?) {
        self.login = dict?["login"] as? String
        self.id = dict?["id"] as? Int
        self.node_id = dict?["node_id"] as? String
        self.avatar_url = dict?["avatar_url"] as? String
        self.gravatar_id = dict?["gravatar_id"] as? String
        self.url = dict?["url"] as? String
        self.html_url = dict?["html_url"] as? String
        self.followers_url = dict?["followers_url"] as? String
        self.following_url = dict?["following_url"] as? String
        self.gists_url = dict?["gists_url"] as? String
        self.starred_url = dict?["starred_url"] as? String
        self.subscriptions_url = dict?["subscriptions_url"] as? String
        self.organizations_url = dict?["organizations_url"] as? String
        self.repos_url = dict?["repos_url"] as? String
        self.events_url = dict?["events_url"] as? String
        self.received_events_url = dict?["received_events_url"] as? String
        self.type = dict?["type"] as? String
        self.site_admin = dict?["site_admin"] as? Bool
    }
    
}
