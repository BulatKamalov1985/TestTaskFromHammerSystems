//
//  model.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 05.04.2023.
//

import UIKit

struct DogImageResponse: Codable {
    let message: [String]
    let status: String
}

struct TableViewCellModel {
    var image: UIImage
    var title: String
}

