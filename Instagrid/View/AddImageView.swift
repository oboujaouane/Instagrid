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
    
    // MARK: - Private outlets
    
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var addImageButton: UIButton?

    // MARK: - Private properties
    
    private var contentView: UIView?
    private var imagePicker = UIImagePickerController()
    
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
    
}

// MARK: - ImagePicker Extension

extension AddImageView: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Action
    
    @IBAction func plusButtonTouched(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            if let topController = UIApplication.topViewController() {
                topController.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addImageButton?.isHidden = true
        // TODO: add selector to image which call plusButtonTouched
        imageView?.contentMode = .scaleAspectFill
        imageView?.image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
