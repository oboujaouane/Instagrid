//
//  LayoutButtonsView.swift
//  Instagrid
//
//  Created by ousama boujaouane on 11/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

@IBDesignable
class LayoutButtonsView: UIView {
    
    // MARK: - Private outlets

    @IBOutlet private var oneTwoSelectionImage: UIImageView?
    @IBOutlet private var twoOneSelectionImage: UIImageView?
    @IBOutlet private var twoTwoSelectionImage: UIImageView?
    
    // MARK: - Internal inspectables
    
    @IBInspectable var nibName: String?
    @IBInspectable var selectedButton = 0 {
        didSet {
            showSelectionForButton(selectedButton)
        }
    }

    // MARK: - Private properties
    
    private var contentView: UIView?
    private var selectedImage: Int = 0
    
    // MARK: - Initializers

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        showSelectionForButton(selectedButton)
        contentView?.prepareForInterfaceBuilder()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
         xibSetup()
    }
    
    // MARK: - Setup Xib View

    func xibSetup() {
        guard let view = loadViewFromNib() else {
            return
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else {
            return nil
        }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
                    withOwner: self,
                    options: nil).first as? UIView
    }
    
    // MARK: - Action
    
    @IBAction private func buttonTouched(_ sender: UIButton) {
        let topViewController = UIApplication.topViewController()
        if let viewController = topViewController as? ViewController {
            switch sender.tag {
            case 0:
                viewController.changeGridLayout(numberOfColumnsForFirstLine: 1, numberOfColumnsForSecondLine: 2)
                selectedButton = sender.tag
            case 1:
                viewController.changeGridLayout(numberOfColumnsForFirstLine: 2, numberOfColumnsForSecondLine: 1)
                selectedButton = sender.tag
            case 2:
                viewController.changeGridLayout(numberOfColumnsForFirstLine: 2, numberOfColumnsForSecondLine: 2)
                selectedButton = sender.tag
            default:
                break
            }
        }
    }
    
    // MARK: - Fileprivate function
    
    fileprivate func showSelectionForButton(_ index: Int) {
        switch index {
        case 0:
            oneTwoSelectionImage?.isHidden = false
            twoOneSelectionImage?.isHidden = true
            twoTwoSelectionImage?.isHidden = true
        case 1:
            oneTwoSelectionImage?.isHidden = true
            twoOneSelectionImage?.isHidden = false
            twoTwoSelectionImage?.isHidden = true
        case 2:
            oneTwoSelectionImage?.isHidden = true
            twoOneSelectionImage?.isHidden = true
            twoTwoSelectionImage?.isHidden = false
        default:
            break
        }
    }

}
