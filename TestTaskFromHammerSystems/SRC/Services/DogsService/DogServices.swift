//
//  DogServices.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 09.04.2023.
//

import UIKit

protocol DogServicesInterface {
    func fetchDogs() -> [Dog]
}


final class DogServices: DogServicesInterface  {
    func fetchDogs() -> [Dog] {
        [
            Dog(image:Images.dog1, title: "DOG 1"),
            Dog(image:Images.dog2, title: "DOG 2"),
            Dog(image:Images.dog3, title: "DOG 3"),
            Dog(image:Images.dog4, title: "DOG 4"),
            Dog(image:Images.dog5, title: "DOG 5"),
        ]
    }
}
