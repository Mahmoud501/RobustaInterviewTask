//
//  ZDSkeletonCell.swift
//  FOODTRUCK
//
//  Created by Mahmoud on 5/29/1398 AP.
//  Copyright © 1398 Mahmoud. All rights reserved.
//

import UIKit

class ZDSkeletonCell: UITableViewCell {

    @IBOutlet weak var vuContain: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vuContain.bor22()
        vuContain.shadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
