//
//  FiltersCollectionViewProviders.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 10.04.2023.
//

import Foundation

import UIKit

final class FiltersCollectionViewProvider: NSObject {

    var scrollToIndexPath: ((IndexPath?) -> ())?
    private var filtersViewModels: [FilterViewModel] = []

    func updateData(_ filtersViewModels: [FilterViewModel]) {
        self.filtersViewModels = filtersViewModels
    }
}

extension FiltersCollectionViewProvider: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtersViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextButtonCell", for: indexPath) as! MainSceneMenuCollectionViewCell

        cell.title = filtersViewModels[indexPath.row].name
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

        return cell
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let buttonTag = sender.tag

        var indexPath: IndexPath?

        switch buttonTag {
        case 0:
            indexPath = IndexPath(row: 10, section: 0)
        case 1:
            indexPath = IndexPath(row: 20, section: 0)
        case 2:
            indexPath = IndexPath(row: 30, section: 0)
        case 3:
            indexPath = IndexPath(row: 40, section: 0)
        case 4:
            indexPath = IndexPath(row: 50, section: 0)
        default:
            break
        }

        scrollToIndexPath?(indexPath)
    }
}
