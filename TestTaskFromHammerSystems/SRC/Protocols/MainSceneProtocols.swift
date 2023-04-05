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
    func requestInitForm(_ request: MainScene.InitForm.Request)
}

protocol MainSceneWorkerLogic {}

protocol MainScenePresentationLogic {
    func presentInitForm(_ response: MainScene.InitForm.Response)
}

protocol MainSceneDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: MainScene.InitForm.ViewModel)
}

protocol MainSceneRoutingLogic {}
