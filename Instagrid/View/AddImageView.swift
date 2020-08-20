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
    
//    @IBOutlet var imageView: UIImageView?
    @IBOutlet var button: UIButton?

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
    
    @IBAction func selectImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            if let topController = UIApplication.topViewController() {
                topController.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Internal function
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        button?.setImage(nil, for: .normal)
        if let imageTaken = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if  button?.backgroundImage(for: .normal) == nil {
                Images.dictionary.updateValue(imageTaken, forKey: imageTaken.description)
                button?.setBackgroundImage(imageTaken, for: .normal)
            } else {
                if button?.imageView?.description != imageTaken.description {
                    if let strongImageView = button?.imageView, let strongImage = strongImageView.image {
                        Images.dictionary.updateValue(imageTaken, forKey: strongImage.description)
                        button?.setBackgroundImage(imageTaken, for: .normal)
                    }
                }
            }
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
