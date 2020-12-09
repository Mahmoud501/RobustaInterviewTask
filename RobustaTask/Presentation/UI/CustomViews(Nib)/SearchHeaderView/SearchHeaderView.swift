//
//  SearchHeaderView.swift
//  RobustaTask
//
//  Created by MAJED A  ALGARNI on 12/9/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import Foundation
import UIKit

//70 iphone
//130 ipad

class SearchHeaderView: UIView {
    
    
    //varibles
    static var CommonHeigth = AppFactory.shared.isPad == true ? 130 : 70
    var didChangeText: ((String)->())?
    
    //outlets
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet var contentView: UIView!
    
    //actions
    
    @IBAction func valueChanged(_ sender: Any) {
        didChangeText?(self.txtSearch.text!)
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commit()
        
    }
    func commit(){
        Bundle.main.loadNibNamed("SearchHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
    }
    
    
}
