//
//  GridStackView.swift
//  Instagrid
//
//  Created by ousama boujaouane on 11/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

@IBDesignable
class GridView: UIView {
    
    // MARK: - Private properties
    
    private var spacingStackView: CGFloat = 15.0
    
    // MARK: - Internal inspectables
    
    @IBInspectable var numberOfColumnsForFirstLine: Int = 1 {
        didSet {
            stackViewSetup()
        }
    }
    @IBInspectable var numberOfColumnsForSecondLine: Int = 2 {
        didSet {
            stackViewSetup()
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackViewSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        stackViewSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        stackViewSetup()
    }
    
    // MARK: - Fileprivate functions
    
    fileprivate func createLine(numberOfColumns: Int, in stackView: UIStackView) {
        // Create stackView line
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = spacingStackView
        
        // Create stackViews columns
        for _ in 0 ..< numberOfColumns {
            let addImageView = AddImageView()
            addImageView.xibSetup()
            horizontalStackView.addArrangedSubview(addImageView)
        }
        
        stackView.addArrangedSubview(horizontalStackView)
    }
    
    fileprivate func stackViewSetup() {
        // Remove all subviews
        subviews.forEach({
            $0.removeFromSuperview()
        })
        
        // Initialization of vertical stackView which contains two lines of stackViews
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = spacingStackView
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        // Create two lines of stackViews
        createLine(numberOfColumns: numberOfColumnsForFirstLine, in: stackView)
        createLine(numberOfColumns: numberOfColumnsForSecondLine, in: stackView)
        
        // Add stackView with two lines to current GridView
        addSubview(stackView)
        
        // Add constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
        
        // Set images if exists
        for (index, element) in Images.dictionary.enumerated() {
            if subviews[0].subviews[0].subviews.count == 1 && subviews[0].subviews[1].subviews.count == 2 {
                switch index {
                case 0:
                    if let addImageView = subviews[0].subviews[0].subviews[0] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 1:
                    if let addImageView = subviews[0].subviews[1].subviews[0] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 2:
                    if let addImageView = subviews[0].subviews[1].subviews[1] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                default:
                    break
                }
            } else if subviews[0].subviews[0].subviews.count == 2 && subviews[0].subviews[1].subviews.count == 1 {
                switch index {
                case 0:
                    if let addImageView = subviews[0].subviews[0].subviews[0] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 1:
                    if let addImageView = subviews[0].subviews[0].subviews[1] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 2:
                    if let addImageView = subviews[0].subviews[1].subviews[0] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                default:
                    break
                }
            } else if subviews[0].subviews[0].subviews.count == 2 && subviews[0].subviews[1].subviews.count == 2 {
                switch index {
                case 0:
                    if let addImageView = subviews[0].subviews[0].subviews[0] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 1:
                    if let addImageView = subviews[0].subviews[0].subviews[1] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 2:
                    if let addImageView = subviews[0].subviews[1].subviews[0] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                case 3:
                    if let addImageView = subviews[0].subviews[1].subviews[1] as? AddImageView {
                        updateImage(addImageView, element.value)
                    }
                default:
                    break
                }
            }
        }
    }
    
    fileprivate func updateImage(_ addImageView: AddImageView, _ image: UIImage) {
        DispatchQueue.main.async {
            addImageView.addImageButton?.isHidden = true
            addImageView.imageView?.contentMode = .scaleAspectFill
            addImageView.imageView?.image = image
        }
    }
    
}
