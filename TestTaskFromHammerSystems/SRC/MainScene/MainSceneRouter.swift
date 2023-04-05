//
//  MainSceneRouter.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MainSceneRouter: MainSceneRoutingLogic, MainSceneDataPassing {
    weak var viewController: UIViewController?
    let dataStore: MainSceneDataStore

    init(dataStore: MainSceneDataStore) {
        self.dataStore = dataStore
    }
}

private extension MainSceneRouter {
//    func passDataTo_() {
//        source: MainSceneDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
