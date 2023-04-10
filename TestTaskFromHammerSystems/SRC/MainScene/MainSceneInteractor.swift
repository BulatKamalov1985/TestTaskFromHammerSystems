//
//  MainSceneInteractor.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class MainSceneInteractor: MainSceneBusinessLogic, MainSceneDataStore {
    
    private let presenter: MainScenePresentationLogic
    private let worker: MainSceneWorkerLogic
    private let dogService: DogServicesInterface
    private let dishesService: DishesServiceInterface
    
    init(
        presenter: MainScenePresentationLogic,
        worker: MainSceneWorkerLogic,
        dogService: DogServicesInterface,
        dishesService: DishesServiceInterface
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dogService = dogService
        self.dishesService = dishesService
    }
    
    func update(_ request: MainScene.Data.Request) {
        switch request {
        case .updateDogs:
            updateDogs()
        case .updateFilters:
            updateFilters()
        case .updateDishes:
            updateDishes()
        }
    }
}

private extension MainSceneInteractor {
    func updateDogs() {
        let dogs = dogService.fetchDogs()
        presenter.refresh(.refreshDogs(dogs: dogs))
    }
    func updateFilters() {
        let filters = dishesService.fetchFilters()
        presenter.refresh(.refreshFilters(filters: filters))
    }
    
    func updateDishes() {
        let dishes = dishesService.fetchDishes()
        presenter.refresh(.refreshDishes(dishes: dishes))
    }
    
}
