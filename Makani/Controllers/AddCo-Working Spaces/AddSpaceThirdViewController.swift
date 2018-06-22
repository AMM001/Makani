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
    @IBOutlet weak var uploadPhotoSetimage: UIButton!
    @IBOutlet weak var uploadPhotoSetimage2: UIButton!
    @IBOutlet weak var uploadPhotoSetimage3: UIButton!
    @IBOutlet weak var roomsTable: UITableView!
    var rooms = Array<Room>()
    var space:Space?
    let picker = UIImagePickerController()
    var imagepicked:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        self.scrollview.contentSize = self.view.bounds.size
//        roomview1.layer.cornerRadius = 5
//        roomview1.layer.borderColor = UIColor.gray.cgColor
//        roomview1.layer.borderWidth = 1
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
        space?.rooms = rooms
//        space?.pictures = 
        addspaceforthVc.space = space
        self.present(addspaceforthVc, animated: true, completion: nil)
    }
    
    @IBAction func previous(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddSpaceThirdViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = roomsTable.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as! RoomCell
        cell.roomCapacity.text = rooms[indexPath.row].capacity
        cell.roomCost.text = String(rooms[indexPath.row].cost)
        cell.roomName.text = rooms[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let spaceDetail = self.storyboard?.instantiateViewController(withIdentifier: "spaceDetail") as! SpaceDetailsViewController
//        self.present(spaceDetail, animated: true, completion: nil)
    }
}
