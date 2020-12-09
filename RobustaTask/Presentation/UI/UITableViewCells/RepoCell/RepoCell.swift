//
//  RepoCell.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var imgRepo: UIImageView!
    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgRepo.setCirleCornerRadius()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgRepo.image = UIImage.init(named: "RepoIcon")
    }
    
    var repo: RepoModel? {
        didSet {            
            self.imgRepo.loadImage(fromURL: repo?.owner?.avatar_url ?? "", placeHolder: "RepoIcon")
            self.lblRepoName.text = repo?.name
             // api don't have name so i switch it with login name
            self.lblOwnerName.text = repo?.owner?.login
            //date not exist in api
            self.lblDate.text = "1 year agoe"
        }
    }
}
