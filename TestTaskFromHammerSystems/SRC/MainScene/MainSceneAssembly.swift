//
//  MainSceneAssembly.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MainSceneAssembly {
    static func build() -> UIViewController {
        let service = DogServices()
        let dishesService = DishesService()
        let presenter = MainScenePresenter()
        let worker = MainSceneWorker()
        let interactor = MainSceneInteractor(presenter: presenter, worker: worker, dogService: service, dishesService: dishesService)
        let router = MainSceneRouter(dataStore: interactor)
        let viewController = MainSceneViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
