//
//  ViewController.swift
//  Instagrid
//
//  Created by ousama boujaouane on 10/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Internal Outlet
    
    @IBOutlet weak var gridView: GridView?
    
    // MARK: - Private Outlet
    
    @IBOutlet private weak var layoutButtonsView: LayoutButtonsView?
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Internal function
    
    func changeGridLayout(numberOfColumnsForFirstLine: Int, numberOfColumnsForSecondLine: Int) {
        gridView?.numberOfColumnsForFirstLine = numberOfColumnsForFirstLine
        gridView?.numberOfColumnsForSecondLine = numberOfColumnsForSecondLine
    }


}

