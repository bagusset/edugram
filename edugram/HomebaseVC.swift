//
//  HomebaseVC.swift
//  edugram
//
//  Created by Bagus setiawan on 14/01/21.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class HomebaseVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        
    @IBOutlet weak var postListCollectionView: UICollectionView!
    
    var imageStorage = [UIImage]()
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
        let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            let image = UIImage(data: data)
            
            
        })
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
        
        guard let imageData = image.pngData() else {
            return
        }
        
       storage.child("images/file.png").putData(imageData,
                                                metadata: nil,
                                                completion: { _, error in
                                                guard error == nil else {
                                                print("Failed to uplod")
                                                return
                                                }
                                                            
                                                self.storage.child("images/file.png").downloadURL(completion: { url, error in
                                                    guard let url = url, error == nil else {
                                                    return
                                                    }
                                                                
                                                    let urlString = url.absoluteString
                                                    print("Download URL : \(urlString)")
                                                    UserDefaults.standard.setValue(urlString, forKey: "url")
                                                            })
                                                        })
        
    }

   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func loadImages(){
        imageStorage.append(UIImage(named: "image1")!)
        imageStorage.append(UIImage(named: "image1")!)
        self.postListCollectionView.reloadData()
    }
    
}

extension HomebaseVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageStorage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomebaseCollectionViewCell
        
        let image = imageStorage[indexPath.row]
        cell.postImage.image = image;
        return cell
    }
    
    
}
