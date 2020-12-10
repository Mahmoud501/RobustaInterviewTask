//
//  ListScreenVC+TableView.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

extension ListScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoCell
        let item = presenter?.list?[indexPath.row]
        cell.repo = item
        
        //TEST Date because api dont have date
        if indexPath.row == 0 {
            cell.lblDate.text = "2019-12-14 10:44:00".getDatePeriodString(format: "yyyy-MM-dd HH:mm:ss")
        }else {
            cell.lblDate.text = "2019-12-14 10:44:00".getDateStringLocalized(format: "yyyy-MM-dd HH:mm:ss")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.TVRepo.deselectRow(at: indexPath, animated: true)
        let item = presenter?.list?[indexPath.row]
        let vc = RepoDetailRouter.createVC(repo: item)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

       let repo = UITableViewRowAction(style: .default, title: "GoTo Repo") { (action, indexPath) in
            let repo = self.presenter?.list?[indexPath.row]
            if let link = repo?.html_url {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url)
                }
            }
        }
        repo.backgroundColor = UIColor.blue
        return [repo]
    }
   
    
}
