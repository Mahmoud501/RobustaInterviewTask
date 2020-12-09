//
//  SkeletonProfileView.swift
//  ShopApp
//
//  Created by MAJED A  ALGARNI on 7/8/20.
//  Copyright © 2020 Wakeb. All rights reserved.
//

import UIKit
import SkeletonView

class SkeletonProfileView: UIView {

    var listOnly : Bool = false {
        didSet {
            if listOnly == true {
                self.vuProfilePic.isHidden = true
            }else {
                self.vuProfilePic.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var vuProfilePic: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var vuContain: UIStackView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commit()
    }
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commit()
    }
       
    func commit(){
        Bundle.main.loadNibNamed("SkeletonProfileView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
        setupUI()
        DispatchQueue.main.async {
            self.showAnimatedGradientSkeleton()
        }
    }
    
    func setupUI() {
        self.listOnly = true
        cornerMethod(self)
    }
    
    func cornerMethod (_ vu: UIView) {
        if vu.subviews.count == 0 {
            if vu.tag == 1 {
                vu.setCirleCornerRadius()
                vu.backgroundColor = .clear
            }
        }else {
            for item in vu.subviews {
                cornerMethod(item)
            }
        }
    }
    
    
    func testSkeleton(vuContain: UIView) {
           self.alpha = 1
           vuContain.alpha = 0
           DispatchQueue.main.async {
               self.showAnimatedGradientSkeleton()
               self.vuContain.showAnimatedGradientSkeleton()
           }
                
           DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
               self.hideSkeleton(transition: .crossDissolve(0.3))
               self.alpha = 0
               vuContain.alpha = 1
           }
       }
    
}
