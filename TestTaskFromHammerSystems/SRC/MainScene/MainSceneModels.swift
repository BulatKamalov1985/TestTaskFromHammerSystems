//
//  MainSceneModels.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

enum MainScene {
    enum InitForm {
        struct Request {
            var stringRequest = "" {
                didSet {
                    print("data coming to request")
                }
            }
        }
        struct Response {
            var stringResponse = "" {
                didSet {
                    print("data coming to response")
                }
            }
        }
        struct ViewModel {
            var stringViewModel = "" {
                didSet {
                    print("data coming to viewmodel")
                }
            }
        }
    }
}
