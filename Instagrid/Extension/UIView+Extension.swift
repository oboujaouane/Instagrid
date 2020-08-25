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
    
    // On étend la classe UIView avec une nouvelle propriété "image" comme screenshot. La méthode snapshotView() fournit par Apple renvoie un UIView non un UIImageView, utiliser snapshotView() nécessiterait donc en plus de caster la valeur de retour en UIImageView, la solution d'étendre la classe UIView est donc la plus simple et la plus rapide trouvée.
    var screenshot: UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in layer.render(in: rendererContext.cgContext) }
    }
    
}
