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

    init(
        presenter: MainScenePresentationLogic,
        worker: MainSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: MainScene.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(MainScene.InitForm.Response())
        }
    }
}
