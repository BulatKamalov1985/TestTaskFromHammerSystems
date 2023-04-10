//
//  DogsCollectionViewProvider.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 10.04.2023.
//

import UIKit

final class DogsCollectionViewProvider: NSObject {
    
    private var dogsViewModels: [DogsViewModel] = []
    
    func updateData(_ dogsViewModels: [DogsViewModel]) {
        self.dogsViewModels = dogsViewModels
    }
    
}

extension DogsCollectionViewProvider: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dogsViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCellCV", for: indexPath) as! MainSceneCollectionViewCell
        cell.imageView.image = dogsViewModels[indexPath.item].image
        return cell
    }
    
    
}
