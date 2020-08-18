//
//  ViewController.swift
//  Instagrid
//
//  Created by ousama boujaouane on 10/08/2020.
//  Copyright © 2020 Sajid. All rights reserved.
//

import Photos
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Internal Outlets
    
    @IBOutlet private weak var swipeLabel: UILabel?
    @IBOutlet private weak var gridContainerView: UIView?
    @IBOutlet private weak var gridView: GridView?
    @IBOutlet private weak var stackView: UIStackView?
    @IBOutlet private weak var stackViewSwipe: UISwipeGestureRecognizer?
    @IBOutlet private var oneTwoSelectionImage: UIImageView?
    @IBOutlet private var twoOneSelectionImage: UIImageView?
    @IBOutlet private var twoTwoSelectionImage: UIImageView?
    
    // MARK: - Private properties
    
    private var selectedButton = 0 {
        didSet {
            showSelectionForButton(selectedButton)
        }
    }
    private var translation = CGAffineTransform()
    
    // MARK: - Internal static property
    
    static var imagesDictionary = [String:UIImage]()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSwipeDirection()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.showSelectionForButton(self.selectedButton)
            self.initSwipeDirection()
        }
    }
    
    // MARK: - Private functions
    
    private func initSwipeDirection() {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            stackViewSwipe?.direction = .up
        } else {
            stackViewSwipe?.direction = .left
        }
    }
    
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
    
    private func swipeGridContainerView() {
        guard let strongGridContainerView = gridContainerView, let strongStackViewSwipe = stackViewSwipe else {
            return
        }
        
        if (strongStackViewSwipe.direction == .up) {
            translation = CGAffineTransform(translationX: 0, y: -strongGridContainerView.frame.maxY)
        }
        else if (strongStackViewSwipe.direction == .left) {
            translation = CGAffineTransform(translationX: -strongGridContainerView.frame.maxX, y: 0)
        }
        
        checkIfPhotoLibraryAccessAuthorized()
    }
    
    private func shareScreenshotOfGridContainer() -> UIActivityViewController {
        let sharedImage = [gridContainerView?.screenshot]
        let activityViewController = UIActivityViewController(activityItems: sharedImage as [Any], applicationActivities: nil)
        activityViewController.completionWithItemsHandler = UIActivityViewController.CompletionWithItemsHandler? { [weak self] activityType, completed, returnedItems, activityError in
                        
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [.curveEaseIn], animations: {
                self?.gridContainerView?.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
        return activityViewController
    }
    
    private func checkIfPhotoLibraryAccessAuthorized() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized, .notDetermined, .restricted:
            presentActivityController()
        default:
            createAlertToGrantAccessToPhotoLibrary()
        }
    }
    
    private func createAlertToGrantAccessToPhotoLibrary() {
        let alert = UIAlertController(title: "Instagrid need access to your Photos",
                                      message: "If you want save image to your photo library please allow access in Instagrid app settings.",
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Don't Allow",
                                      style: UIAlertAction.Style.cancel,
                                      handler: { [weak self] alert -> Void in
                                        self?.presentActivityController()
        }))
        
        alert.addAction(UIAlertAction(title: "Go",
                                      style: UIAlertAction.Style.default,
                                      handler: { alert -> Void in
                                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                                                  options: [:],
                                                                  completionHandler: nil)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    private func presentActivityController() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0, delay: 0, options: [.curveEaseIn], animations: {
            guard let strongGridContainerView = self.gridContainerView else {
                return
            }
            strongGridContainerView.transform = self.translation
        }, completion: { _ in
            let share = self.shareScreenshotOfGridContainer()
            self.present(share, animated: true)
        })
    }
    
    // MARK: - Actions
    
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
    
    @IBAction private func swipeStackView(_ sender: UISwipeGestureRecognizer) {
        swipeGridContainerView()
    }
    
}
