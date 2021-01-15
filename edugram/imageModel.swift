//
//  imageModel.swift
//  edugram
//
//  Created by Bagus setiawan on 15/01/21.
//

import Foundation
import Firebase
import FirebaseDatabase

struct imageModel {
    let key: String!
    let url : String!
    
    let itemRef: DatabaseReference?
    
    init(url: String, key: String) {
        self.key = key
        self.url = url
        self.itemRef = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageURL = snapshotValue?["url"] as? String {
            url = imageURL
        } else {
            url = " "
        }
    }
}
