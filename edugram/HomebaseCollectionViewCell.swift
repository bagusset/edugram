//
//  HomebaseCollectionViewCell.swift
//  edugram
//
//  Created by Bagus setiawan on 14/01/21.
//

import UIKit

class HomebaseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgViewCell: UIView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.postImage.image = nil
        configureCard()
    }
    
    func configureCard(){
       
        postImage.layer.cornerRadius = 20
        
        bgViewCell.layer.cornerRadius = 15
        bgViewCell.layer.borderWidth = 1.0
        bgViewCell.layer.borderColor = UIColor.clear.cgColor
        bgViewCell.layer.masksToBounds = true
        bgViewCell.layer.backgroundColor = UIColor.white.cgColor
        bgViewCell.layer.shadowColor = UIColor.gray.cgColor
        bgViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        bgViewCell.layer.shadowRadius = 2.0
        bgViewCell.layer.shadowOpacity = 1.0
        bgViewCell.layer.masksToBounds = false
        bgViewCell.layer.shadowPath = UIBezierPath(roundedRect:bgViewCell.bounds, cornerRadius:bgViewCell.layer.cornerRadius).cgPath
    }
}
