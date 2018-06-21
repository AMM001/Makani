//
//  AddSpaceThirdViewController.swift
//  Makani
//
//  Created by mac on 6/14/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class AddSpaceThirdViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var numofPersonroom1: UILabel!
    @IBOutlet weak var salaryroom1: UILabel!
    @IBOutlet weak var nameRoom1: UILabel!
    @IBOutlet weak var nameRoom2: UILabel!
    @IBOutlet weak var numofpersonroom2: UILabel!
    @IBOutlet weak var salaryroom2: UILabel!
    @IBOutlet weak var nameRoom3: UILabel!
    @IBOutlet weak var numofpersonroom3: UILabel!
    @IBOutlet weak var salaryroom3: UILabel!
    @IBOutlet weak var uploadPhotoSetimage: UIButton!
    @IBOutlet weak var uploadPhotoSetimage2: UIButton!
    @IBOutlet weak var uploadPhotoSetimage3: UIButton!

    var room = Array<Room>()
    var space:Space?
    
    let picker = UIImagePickerController()
    
    var imagepicked:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        numofPersonroom1.font = numofPersonroom1.font.withSize(10)
        salaryroom1.font = salaryroom1.font.withSize(13)
        numofpersonroom2.font = numofpersonroom2.font.withSize(10)
        salaryroom2.font = salaryroom2.font.withSize(13)
        numofpersonroom3.font = numofpersonroom3.font.withSize(10)
        salaryroom3.font = salaryroom3.font.withSize(13)
        self.scrollview.contentSize = self.view.bounds.size
        roomview1.layer.cornerRadius = 5
        roomview1.layer.borderColor = UIColor.gray.cgColor
        roomview1.layer.borderWidth = 1
        roomview2.layer.cornerRadius = 5
        roomview2.layer.borderColor = UIColor.gray.cgColor
        roomview2.layer.borderWidth = 1
        roomview3.layer.cornerRadius = 5
        roomview3.layer.borderColor = UIColor.gray.cgColor
        roomview3.layer.borderWidth = 1
    }
    
    
    @IBAction func uploadPhoto1(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            self.imagepicked = 1
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func uploadPhoto2(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            self.imagepicked = 2
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func uploadPhoto3(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            self.imagepicked = 3
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func addMorePhotoBtn(_ sender: Any) {
        
    }
    
    
    @objc  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            if(self.imagepicked == 1){
                self.uploadPhotoSetimage.setBackgroundImage(pickedImage, for: .normal)
                self.uploadPhotoSetimage.setTitle("", for: .normal)
                self.uploadPhotoSetimage.setImage(UIImage(named:""), for: .normal)
                self.uploadPhotoSetimage.imageView?.contentMode =  .scaleAspectFit
            }
            
            if(self.imagepicked == 2){
                self.uploadPhotoSetimage2.setBackgroundImage(pickedImage, for: .normal)
                self.uploadPhotoSetimage2.setTitle("", for: .normal)
                self.uploadPhotoSetimage2.setImage(UIImage(named:""), for: .normal)
                self.uploadPhotoSetimage2.imageView?.contentMode =  .scaleAspectFit
            }
            
            if(self.imagepicked == 3){
                self.uploadPhotoSetimage3.setBackgroundImage(pickedImage, for: .normal)
                self.uploadPhotoSetimage3.setTitle("", for: .normal)
                self.uploadPhotoSetimage3.setImage(UIImage(named:""), for: .normal)
                self.uploadPhotoSetimage3.imageView?.contentMode =  .scaleAspectFit
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
 
    @IBAction func addRoom(_ sender: Any) {
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        let addspaceforthVc = storyboard?.instantiateViewController(withIdentifier: "AddSpaceFourthViewController") as! AddSpaceFourthViewController
        
        
        addspaceforthVc.space = space
        self.present(addspaceforthVc, animated: true, completion: nil)
        
    }
    
    @IBAction func backBtn2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
