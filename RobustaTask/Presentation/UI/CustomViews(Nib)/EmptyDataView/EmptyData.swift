//
//  EmptyData.swift
//  EventHub
//
//  Created by Mahmoud on 4/4/1398 AP.
//  Copyright © 1398 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

class EmptyData: UIView {
    
    @IBOutlet var contentView: UIView!
    var didClickedButton: () -> () = {}
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnRload: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commit()
        
    }
    func commit(){
        Bundle.main.loadNibNamed("EmptyData", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
        lblTitle.textColor = .black
        lblMessage.textColor = .darkGray
        self.btnRload.setTitleColor(.black, for: .normal)
        self.btnRload.bor(radius: self.btnRload.frame.height / 2, color: .black)
    }
    
    func config(img:String?,title:String?,message:String?,showButton: Bool? = nil){
        if showButton == false
        {
            self.btnRload.isHidden = true
        }
        self.Img.image = UIImage(named: img ?? "")
        self.lblTitle.text = title ?? ""
        self.lblMessage.text = message ?? ""
    }
    
    
    func config2(img:String?,title:String?,message:String?){
           self.btnRload.setTitleColor(.white, for: .normal)
           self.lblTitle.textColor = .white
           self.lblMessage.textColor = .white
           if (img ?? "") == ""{
               self.Img.isHidden = true
           }
           if (title ?? "") == ""{
               self.lblTitle.isHidden = true
           }
           if (message ?? "") == ""{
               self.lblMessage.isHidden = true
           }
           self.Img.image = UIImage(named: img ?? "")
           self.lblTitle.text = title ?? ""
           self.lblMessage.text = message ?? ""
       }
    
    func setupViewConstraint(vu: UIView)
    {
        vu.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        vu.addConstraint(NSLayoutConstraint(item: self as Any, attribute: .trailing, relatedBy: .equal, toItem: vu, attribute: .trailing, multiplier: 1, constant: 0))
        vu.addConstraint(NSLayoutConstraint(item: self as Any, attribute: .leading, relatedBy: .equal, toItem: vu, attribute: .leading, multiplier: 1, constant: 0))
        vu.addConstraint(NSLayoutConstraint(item: self as Any, attribute: .top, relatedBy: .equal, toItem: vu, attribute: .top, multiplier: 1, constant: 0))
        vu.addConstraint(NSLayoutConstraint(item: self as Any, attribute: .bottom, relatedBy: .equal, toItem: vu, attribute: .bottom, multiplier: 1, constant: 0))
    }
    
    @IBAction func reloadClicked(_ sender: Any) {
        didClickedButton()
    }
    
    
    
    
    
}
