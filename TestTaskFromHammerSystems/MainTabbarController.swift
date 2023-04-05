//
//  ViewController.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Создаем контроллеры вкладок
        let menuVC = MainSceneAssembly.build()
        let contactsVC = ContactsSceneViewController()
        let profileVC = ProfileSceneViewController()
        let cartVC = CartSceneViewController()
        
        // Добавляем контроллеры в массив viewControllers таб-бара
        viewControllers = [
            generateVC(viewController: menuVC, title: "Меню", image: UIImage(systemName: "house.fill")),
            generateVC(viewController: contactsVC, title: "Контакты", image: UIImage(systemName: "cursorarrow")),
            generateVC(viewController: profileVC, title: "Профиль", image: UIImage(systemName: "person.fill")),
            generateVC(viewController: cartVC, title: "Корзина", image: UIImage(systemName: "cart")),
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
}
