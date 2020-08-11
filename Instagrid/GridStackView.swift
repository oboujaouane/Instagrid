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

    private var spacingStackView: CGFloat = 0.0
    
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
    
    // MARK: - Internal function
    
    func stackViewSetup() {
        
        // Init StackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = spacingStackView
        
        // Create first line
        let firstHorizontalStackView = UIStackView() // TODO: extract in one function to use for secondHorizontalStackView too
        firstHorizontalStackView.axis = .horizontal
        firstHorizontalStackView.alignment = .fill
        firstHorizontalStackView.distribution = .fillEqually
        firstHorizontalStackView.spacing = spacingStackView

        for _ in 0 ..< numberOfColumnsForFirstLine {
            let view = UIView()
            let redValue = CGFloat(arc4random_uniform(255)) / 255.0; // TODO: Remove when true view added
            let greenValue = CGFloat(arc4random_uniform(255)) / 255.0; // TODO: Remove when true view added
            let blueValue = CGFloat(arc4random_uniform(255)) / 255.0; // TODO: Remove when true view added
            let alphaValue: CGFloat = 1.0 // TODO: Remove when true view added
            view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
            firstHorizontalStackView.addArrangedSubview(view)
        }
        
        stackView.addArrangedSubview(firstHorizontalStackView)

        // Create second line
        let secondHorizontalStackView = UIStackView()
        secondHorizontalStackView.axis = .horizontal
        secondHorizontalStackView.alignment = .fill
        secondHorizontalStackView.distribution = .fillEqually
        secondHorizontalStackView.spacing = spacingStackView
            
        for _ in 0 ..< numberOfColumnsForSecondLine {
            let view = UIView()
            let redValue = CGFloat(arc4random_uniform(255)) / 255.0;
            let greenValue = CGFloat(arc4random_uniform(255)) / 255.0;
            let blueValue = CGFloat(arc4random_uniform(255)) / 255.0;
            let alphaValue: CGFloat = 1.0
            view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
            secondHorizontalStackView.addArrangedSubview(view)
        }
        
        stackView.addArrangedSubview(secondHorizontalStackView)
        
        self.addSubview(stackView)

        // Add constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
    }
    
}
