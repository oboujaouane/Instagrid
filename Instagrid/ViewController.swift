//
//  ViewController.swift
//  Instagrid
//
//  Created by ousama boujaouane on 10/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var gridView: GridView?
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        gridView?.numberOfColumnsForFirstLine = 2 // TODO: add to action with switch case
        gridView?.numberOfColumnsForSecondLine = 1 // TODO: add to action with switch case
    }


}

