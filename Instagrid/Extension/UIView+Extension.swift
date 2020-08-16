//
//  UIView+Extension.swift
//  Instagrid
//
//  Created by ousama boujaouane on 15/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    public class func findByAccessibilityIdentifier(identifier: String) -> UIView? {
        guard let window = UIApplication.shared.keyWindow else {
            return nil
        }
        
        func findByID(_ view: UIView, _ id: String) -> UIView? {
            if view.accessibilityIdentifier == id {
                return view
            }
            for v in view.subviews {
                if let a = findByID(v, id) {
                    return a
                }
            }
            return nil
        }
        
        return findByID(window, identifier)
    }
}
