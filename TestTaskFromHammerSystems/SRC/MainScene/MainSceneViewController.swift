//
//  MainSceneViewController.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MainSceneViewController: UIViewController, MainSceneDisplayLogic {

    private let interactor: MainSceneBusinessLogic
    private let router: MainSceneRoutingLogic

    init(
        interactor: MainSceneBusinessLogic,
        router: MainSceneRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        view.backgroundColor = .white
    }

    // MARK: - MainSceneDisplayLogic

    func displayInitForm(_ viewModel: MainScene.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(MainScene.InitForm.Request())
    }
}


