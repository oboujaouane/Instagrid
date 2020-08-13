//
//  UIApplication+Extension.swift
//  Instagrid
//
//  Created by ousama boujaouane on 13/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

extension UIApplication {
    // Get top view controller
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
