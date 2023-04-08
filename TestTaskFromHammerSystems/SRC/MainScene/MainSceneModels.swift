//
//  MainSceneModels.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

enum MainScene {
    enum InitForm {
        
        // Mediator between view and interactor
        struct Request {
            var stringRequest = "" {
                didSet {
                    print("Data coming to request")
                }
            }
        }
        
        // Mediator between interactor and presenter
        struct Response {
            var stringResponse = "" {
                didSet {
                    print("Data coming to response")
                }
            }
        }
        
        // Mediator between presenter and view
        struct ViewModel {
            var stringViewModel = "" {
                didSet {
                    print("Data coming to viewmodel")
                }
            }
        }
    }
}

struct DogImages: Codable {
    let message: [String]
    let status: String
}

struct TableViewCellModel {
    var image: UIImage
    var title: String
}

