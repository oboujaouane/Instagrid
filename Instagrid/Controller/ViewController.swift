//
//  ViewController.swift
//  Instagrid
//
//  Created by ousama boujaouane on 10/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Internal Outlets
    
    @IBOutlet weak var gridView: GridView?
    @IBOutlet private var oneTwoSelectionImage: UIImageView?
    @IBOutlet private var twoOneSelectionImage: UIImageView?
    @IBOutlet private var twoTwoSelectionImage: UIImageView?
    
    // MARK: - Private property
    
    private var selectedButton = 0 {
        didSet {
            showSelectionForButton(selectedButton)
        }
    }
    
    // MARK: - Private functions

    private func changeGridLayout(numberOfColumnsForFirstLine: Int, numberOfColumnsForSecondLine: Int) {
        gridView?.numberOfColumnsForFirstLine = numberOfColumnsForFirstLine
        gridView?.numberOfColumnsForSecondLine = numberOfColumnsForSecondLine
    }
    
    private func showSelectionForButton(_ index: Int) {
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

    // MARK: - Action
    
    @IBAction private func buttonTouched(_ sender: UIButton) {
            switch sender.tag {
            case 0:
                changeGridLayout(numberOfColumnsForFirstLine: 1, numberOfColumnsForSecondLine: 2)
                selectedButton = sender.tag
            case 1:
                changeGridLayout(numberOfColumnsForFirstLine: 2, numberOfColumnsForSecondLine: 1)
                selectedButton = sender.tag
            case 2:
                changeGridLayout(numberOfColumnsForFirstLine: 2, numberOfColumnsForSecondLine: 2)
                selectedButton = sender.tag
            default:
                break
            }
    }

}

