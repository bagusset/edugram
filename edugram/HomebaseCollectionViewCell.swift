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
    }
}
