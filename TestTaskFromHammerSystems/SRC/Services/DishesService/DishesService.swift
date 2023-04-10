//
//  DishesServise.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 10.04.2023.
//

import Foundation

protocol DishesServiceInterface {
    func fetchFilters() -> [Filter]
    func fetchDishes() -> [Dish]
}

final class DishesService: DishesServiceInterface {
    func fetchFilters() -> [Filter] {
        requestFilters()
    }
    
   
    func fetchDishes() -> [Dish] {
        requestDishes()
    }
}

private extension DishesService {
    func requestFilters() -> [Filter] {
        [
            Filter(name: "Пицца"),
            Filter(name: "Комбо"),
            Filter(name: "Десерты"),
            Filter(name: "Напитки"),
            Filter(name: "Роллы"),
        ]
        
    }
    func requestDishes() -> [Dish] {
        [
            Dish(name: "Маргарита"),
            Dish(name: "Пепперони"),
            Dish(name: "Гавайская"),
            Dish(name: "Мексиканская"),
            Dish(name: "Карбонара"),
            Dish(name: "Салями"),
            Dish(name: "Куринная"),
            Dish(name: "Мексикано"),
            Dish(name: "Мясная")
        ]
    }
}
