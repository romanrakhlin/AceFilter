//
//  ViewController.swift
//  AceFilter
//
//  Created by Roman Rakhlin on 07.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let context = CIContext()
    var original: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var firstFilter: UIButton!
    @IBOutlet weak var secondFilter: UIButton!
    @IBOutlet weak var thirdFilter: UIButton!
    @IBOutlet weak var fourthFilter: UIButton!
    @IBOutlet weak var fithFilter: UIButton!
    @IBOutlet weak var sixthFilter: UIButton!
    @IBOutlet weak var seventhFilter: UIButton!
    @IBOutlet weak var eighthFilter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: firstFilter.bounds.width - firstFilter.bounds.height)
        firstFilter.imageView?.layer.cornerRadius = firstFilter.bounds.height/2.0
        
        secondFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: secondFilter.bounds.width - secondFilter.bounds.height)
        secondFilter.imageView?.layer.cornerRadius = secondFilter.bounds.height/2.0
        
        thirdFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: thirdFilter.bounds.width - thirdFilter.bounds.height)
        thirdFilter.imageView?.layer.cornerRadius = thirdFilter.bounds.height/2.0
        
        fourthFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: fourthFilter.bounds.width - fourthFilter.bounds.height)
        fourthFilter.imageView?.layer.cornerRadius = fourthFilter.bounds.height/2.0
        
        fithFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: fithFilter.bounds.width - fithFilter.bounds.height)
        fithFilter.imageView?.layer.cornerRadius = fithFilter.bounds.height/2.0
        
        sixthFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: sixthFilter.bounds.width - sixthFilter.bounds.height)
        sixthFilter.imageView?.layer.cornerRadius = sixthFilter.bounds.height/2.0
        
        seventhFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: seventhFilter.bounds.width - seventhFilter.bounds.height)
        seventhFilter.imageView?.layer.cornerRadius = seventhFilter.bounds.height/2.0
        
        eighthFilter.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: eighthFilter.bounds.width - eighthFilter.bounds.height)
        eighthFilter.imageView?.layer.cornerRadius = eighthFilter.bounds.height/2.0
    }

    @IBAction func choosePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func applyTrasfer(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectTransfer")
        display(filter: filter!)
    }
    
    @IBAction func applyTonal(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectTonal")
        display(filter: filter!)
    }
    
    @IBAction func applyProcess(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    @IBAction func applyNoir(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
    }
    
    @IBAction func applyMono(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectMono")
        display(filter: filter!)
    }
    
    @IBAction func applyInstant(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectInstant")
        display(filter: filter!)
    }
    
    @IBAction func applyFade(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectFade")
        display(filter: filter!)
    }
    
    @IBAction func applyChrome(_ sender: Any) {
        if original == nil {
            return
        }

        let filter = CIFilter(name: "CIPhotoEffectChrome")
        display(filter: filter!)
    }
    
    func display(filter: CIFilter) {
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        let output = filter.outputImage
        imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent)!)
    }
    
    @IBAction func saveImage(_ sender: Any) {
        let imageData = imageView.image!.pngData()
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Saved", message: "Your image has been saved", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            original = image
        }
    }
}
