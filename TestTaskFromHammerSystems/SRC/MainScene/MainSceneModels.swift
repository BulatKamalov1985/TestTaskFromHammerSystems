//
//  MainSceneModels.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

enum MainScene {
    enum Data {
        
        // Mediator between view and interactor
        enum Request {
            case updateDogs
            case updateFilters
            case updateDishes
        }
        
        // Mediator between interactor and presenter
        enum Response {
            case refreshDogs(dogs: [Dog])
            case refreshFilters(filters: [Filter])
            case refreshDishes(dishes: [Dish])
        }
    }
    
    enum ViewModel {
        case dogs([DogsViewModel])
        case filters([FilterViewModel])
        case dishes([DishViewModel])
    }
}

struct FilterViewModel {
     
    private let filter: Filter
    
    var name: String {
        filter.name
    }
    
    init(filter: Filter) {
        self.filter = filter
    }
    
    
}

struct DishViewModel {
    
    private let dish: Dish
    
    var name: String {
        dish.name
    }
    
    init(dish: Dish) {
        self.dish = dish
    }
}

struct DogsViewModel {
    
    var image: UIImage {
        dog.image
    }
    
    var title: String{
        dog.title
    }
    
    private let dog: Dog
    
    init(dog: Dog) {
        self.dog = dog
    }
}

struct DogImages: Codable {
    let message: [String]
    let status: String
}


