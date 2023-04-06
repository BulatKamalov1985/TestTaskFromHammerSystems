//
//  MainScenePresenter.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

final class MainScenePresenter: MainScenePresentationLogic {
    weak var viewController: MainSceneDisplayLogic?
    
    var presenterString  = "data presenter" {
        didSet {
            print("data coming from interactor to presenter \( presenterString)")
        }
    }
    
    func presentInitForm(_ response: MainScene.InitForm.Response) {
        presenterString = response.stringResponse
        print("получаем информацию из интерактора в презентер(ПРЕЗЕНТОР)")
        viewController?.displayInitForm(MainScene.InitForm.ViewModel(stringViewModel: presenterString))
        print("передаем данные из презентера во вью контроллер для отображения(ПРЕЗЕНТОР)")
    }
}
