//
//  UIHelper.swift
//  Movies-App
//
//  Created by Akın Çetin on 1.12.2022.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout  {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: .dWidth, height: .dWidth * 1.5)
        
        return layout
        
    }
}
