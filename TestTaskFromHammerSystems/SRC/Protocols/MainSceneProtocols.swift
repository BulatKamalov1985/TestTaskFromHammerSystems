//
//  MainSceneProtocols.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol MainSceneDataPassing {
    var dataStore: MainSceneDataStore { get }
}

protocol MainSceneDataStore {}

protocol MainSceneBusinessLogic {
    func update(_ request: MainScene.Data.Request)
}

protocol MainSceneWorkerLogic {}

protocol MainScenePresentationLogic {
    func refresh(_ response: MainScene.Data.Response)
}

protocol MainSceneDisplayLogic: AnyObject {
    func display(_ viewModel: MainScene.ViewModel )
}

protocol MainSceneRoutingLogic {}
