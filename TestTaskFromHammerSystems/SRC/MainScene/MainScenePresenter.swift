//
//  MainScenePresenter.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MainScenePresenter: MainScenePresentationLogic {
    weak var viewController: MainSceneDisplayLogic?

    func presentInitForm(_ response: MainScene.InitForm.Response) {
        viewController?.displayInitForm(MainScene.InitForm.ViewModel())
    }
}
