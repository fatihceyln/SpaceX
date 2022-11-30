//
//  FKAttributesVC.swift
//  MobilliumJrCase
//
//  Created by Fatih Kilit on 19.11.2022.
//

import UIKit
import SnapKit

final class FKAttributesVC: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createAttributesFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(AttributeCell.self, forCellWithReuseIdentifier: AttributeCell.reuseID)
        collectionView.isUserInteractionEnabled = false
        
        collectionView.backgroundColor = .theme.background
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension FKAttributesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttributeCell.reuseID, for: indexPath) as! AttributeCell
        let attribute = launch._attributeNames[indexPath.item]
        let value = launch._attributeValues[indexPath.item]
        cell.setup(attribute: attribute, value: value)
        return cell
    }
}
