//
//  HomebaseVC.swift
//  edugram
//
//  Created by Bagus setiawan on 14/01/21.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import SDWebImage

class HomebaseVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var postListCollectionView: UICollectionView!
    
    var imageStorage = [imageModel]()
    
    //connect to DB
    var dbRef : DatabaseReference!
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference().child("images")
        loadDB()
    }
    
    @IBAction func postPressBtn() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        guard let imageData = image.jpegData(compressionQuality: 8.0) else {
            return
        }
        
        storage.child("images").putData(imageData,
                                        metadata: nil,
                                        completion: { _, error in
                                            guard error == nil else {
                                                print("Failed to uplod")
                                                return
                                            }
                                            
                                            self.storage.child("images").downloadURL(completion: { url, error in
                                                guard let url = url, error == nil else {
                                                    return
                                                }
                                                
                                                let urlString = url.absoluteString
                                                let key = self.dbRef.childByAutoId().key
                                                let image = ["url": urlString]
                                                
                                                let childUpdate = ["/\(String(describing: key))": image]
                                                self.dbRef.updateChildValues(childUpdate)
                                            })
                                        }
        )
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func loadDB(){
        dbRef.observe(DataEventType.value, with: { (snapshot) in
            var newImage = [imageModel]()
            
            for ImageModelSnapshot in snapshot.children {
                let modelObject = imageModel(snapshot: ImageModelSnapshot as! DataSnapshot)
                newImage.append(modelObject)
            }
            self.imageStorage = newImage
            self.postListCollectionView.reloadData()
        })
    }
    
}

extension HomebaseVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStorage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomebaseCollectionViewCell
        
        let image = imageStorage[indexPath.row]
        cell.postImage.sd_setImage(with: URL(string: image.url), placeholderImage: UIImage(named: "images1"))
        return cell
    }
    
    
}
