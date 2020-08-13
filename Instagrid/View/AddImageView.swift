//
//  AddImageView.swift
//  Instagrid
//
//  Created by ousama boujaouane on 13/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

@IBDesignable
class AddImageView: UIView {
    
    // MARK: - Private outlet

    @IBOutlet private var imageView: UIImageView?

    // MARK: - Private property
    
    private var contentView: UIView?
    
    // MARK: - Setup Xib View

    func xibSetup() {
        guard let view = loadViewFromNib() else {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        layer.cornerRadius = 2
        backgroundColor = .white
        addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let nibName = "AddImageView"
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
                    withOwner: self,
                    options: nil).first as? UIView
    }
    
    // MARK: - Action
    
    @IBAction func plusButtonTouched(_ sender: UIButton) {
        print("\(sender.tag)")
    }

}
