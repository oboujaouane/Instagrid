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
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var addImageButton: UIButton?

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
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addImageButton?.isHidden = true
        imageView?.contentMode = .scaleAspectFill
        if let imageTaken = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if imageView?.image == nil {
                ViewController.imagesDictionary.updateValue(imageTaken, forKey: imageTaken.description)
                imageView?.image = imageTaken
            } else {
                if imageView?.image?.description != imageTaken.description {
                    if let strongImageView = imageView, let strongImage = strongImageView.image {
                        ViewController.imagesDictionary.updateValue(imageTaken, forKey: strongImage.description)
                        imageView?.image = imageTaken
                    }
                }
            }
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
