//
//  File.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 05.04.2023.
//

import UIKit

struct Images {
    static let dog1 = UIImage(named: "dog1")!
    static let dog2 = UIImage(named: "dog2")!
    static let dog3 = UIImage(named: "dog3")!
    static let dog4 = UIImage(named: "dog4")!
    static let dog5 = UIImage(named: "dog5")!
    static let dog6 = UIImage(named: "dog6")!
    static let dog7 = UIImage(named: "dog7")!
    static let dog8 = UIImage(named: "dog8")!
    static let dog9 = UIImage(named: "dog9")!
    static let dog10 = UIImage(named: "dog10")!
    static let dog11 = UIImage(named: "dog11")!
    static let dog12 = UIImage(named: "dog12")!
    static let dog13 = UIImage(named: "dog13")!
}

func fetchDataCV() -> [TableViewCellModel] {
    let image1 = TableViewCellModel(image: Images.dog1 , title: "DOG 1")
    let image2 = TableViewCellModel(image: Images.dog2 , title: "DOG 2")
    let image3 = TableViewCellModel(image: Images.dog3 , title: "DOG 3")
    let image4 = TableViewCellModel(image: Images.dog4 , title: "DOG 4")
    let image5 = TableViewCellModel(image: Images.dog5 , title: "DOG 5")
    let image6 = TableViewCellModel(image: Images.dog6 , title: "DOG 6")
    let image7 = TableViewCellModel(image: Images.dog7 , title: "DOG 7")
    let image8 = TableViewCellModel(image: Images.dog8 , title: "DOG 8")
    let image9 = TableViewCellModel(image: Images.dog9 , title: "DOG 11")
    let image10 = TableViewCellModel(image: Images.dog10, title: "DOG 13")
    let image11 = TableViewCellModel(image: Images.dog11 , title: "DOG 8")
    let image12 = TableViewCellModel(image: Images.dog12 , title: "DOG 11")
    let image13 = TableViewCellModel(image: Images.dog13, title: "DOG 13")
    
    return [image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12, image13]
}
struct TitleTV {
    let pizzas = ["Маргарита", "Пепперони", "Гавайская", "Четыре сезона", "Мексиканская", "Барбекю", "Карбонара", "Фунги", "Суприм", "Вегетарианская", "Сырная", "Морская", "Тосканская", "Дьябола", "Капричоза", "Кальцоне", "Салями", "Баварская", "Филадельфия", "Цезарь", "Американо", "Ньокки", "Карпаччо", "Крабовая", "Карибская", "Итальянская", "Хачапури", "Шоколадная", "Фруктовая", "Охотничья", "Копченая", "Лососевая", "Куринная", "Брускетта", "Миндальная", "Шоколадно-ореховая", "Мясная", "Томатная", "Моцарелла", "Мексикано", "Песто", "Прошутто", "Свинина", "Тунцовая", "Устричная", "Филе-миньон", "Цыпленок терияки", "Черноморская"]
}

let buttonTitles = ["Пицца", "Комбо", "Десерты", "Напитки", "Роллы"]

