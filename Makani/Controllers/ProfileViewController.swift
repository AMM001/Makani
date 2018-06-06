//
//  ProfileViewController.swift
//  Makani
//
//  Created by mac on 6/2/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController  , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var genderTF: UILabel!
    @IBOutlet weak var countryTF: UILabel!
    @IBOutlet weak var ageTF: UILabel!
    @IBOutlet weak var phoneTF: UILabel!
    @IBOutlet weak var governmentTF: UILabel!
    @IBOutlet weak var containerview: UIView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    let picker = UIImagePickerController()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

    var interset_Array:Array = ["1","2","3" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageview.layer.cornerRadius = imageview.frame.height/2
        imageview.clipsToBounds = true
        imageview.layer.borderWidth = 1.0
        imageview.layer.borderColor = UIColor.white.cgColor

        picker.delegate = self
        collectionView.delegate   = self
        collectionView.dataSource = self
        
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / 4, height: width / 6 )
        
       layout.minimumInteritemSpacing = 2
       collectionView!.collectionViewLayout = layout
       
        if interset_Array.count >= 3 {
            
            self.containerview.frame = CGRect(x: 38, y: 297, width: self.containerview.frame.width, height: 140)
        }else{
            
            self.containerview.frame = CGRect(x: 38, y: 297, width: self.containerview.frame.width, height: self.containerview.frame.height )

            
        }


    }
    
    @IBAction func editProfileBtn(_ sender: Any) {
        
        let editVc = storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        self.present(editVc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func changePhotoBtn(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            
            
            
            present(picker, animated: true, completion: nil)
        }
        
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @objc  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageview.contentMode = .scaleAspectFill
            imageview.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension ProfileViewController:UICollectionViewDelegate , UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interset_Array.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "interestCell", for: indexPath) as!
         InterestCollectionViewCell
        
        return cell
    }
    

    
    
    
}















