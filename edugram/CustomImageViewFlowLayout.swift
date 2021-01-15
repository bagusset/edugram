//
//  CustomImageViewFlowLayout.swift
//  edugram
//
//  Created by Bagus setiawan on 15/01/21.
//

import UIKit

class CustomImageViewFlowLayout: UICollectionViewFlowLayout {
    
    override init(){
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder :aDecoder)
        setupLayout()
    }
    
    func setupLayout(){
        minimumInteritemSpacing = 3
        minimumLineSpacing = 2
        scrollDirection = .vertical
        
    }

}
