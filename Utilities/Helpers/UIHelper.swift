//
//  UIHelper.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 18.11.2022.
//

import UIKit

enum UIHelper {
    
    static func createHomeCompositionlLayout() -> UICollectionViewCompositionalLayout {
        // item
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        // group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/7)), subitems: [item])
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .margin
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    static func createAttributesFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        let itemWidth = (.attributesViewWidth / 2) - (.margin / 2)
        let itemHeight = (.attributesViewHeight / 3) - ( 2 * CGFloat.margin / 3)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        layout.minimumLineSpacing = .margin
        layout.minimumInteritemSpacing = .margin / 2
        
        return layout
    }
}
