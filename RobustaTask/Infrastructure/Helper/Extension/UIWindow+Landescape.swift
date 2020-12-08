//
//  UIWindow+Landescape.swift
//  Majdona
//
//  Created by MAJED A  ALGARNI on 5/23/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}

