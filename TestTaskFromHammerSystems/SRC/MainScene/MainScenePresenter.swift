//
//  MainScenePresenter.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MainScenePresenter: MainScenePresentationLogic {
    
    weak var viewController: MainSceneDisplayLogic?
    
    func refresh(_ response: MainScene.Data.Response) {
        switch response {
        case .refreshDogs(let dogs):
            refresh(dogs)
        case .refreshFilters(filters: let filter):
           refreshFilters(filter)
        case .refreshDishes(dishes: let dishes):
         refreshDishes(dishes)
            
        }
    }
}

private extension MainScenePresenter {
    func refresh(_ dogs: [Dog]) {
        let dogViewModels = dogs.map { DogsViewModel(dog: $0) }
        viewController?.display(MainScene.ViewModel.dogs(dogViewModels))
    }
    
    func refreshFilters(_ filters: [Filter]) {
        let filterViewmodels = filters.map { FilterViewModel(filter: $0) }
        viewController?.display(MainScene.ViewModel.filters(filterViewmodels))
    }
    
    func refreshDishes(_ dishes: [Dish]) {
        let dishesViewmodels = dishes.map { DishViewModel(dish: $0) }
        viewController?.display(MainScene.ViewModel.dishes(dishesViewmodels))
    }
}

