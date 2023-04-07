//
//  MainSceneViewController.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

final class MainSceneViewController: UIViewController, MainSceneDisplayLogic {

    // Массив названий пицц
    let pizzaNames: TitleTV
    
    var prices: [String] = []

    // Массив данных для таблицы
    var tableData: [String] = []
    
    let fetchImagesCV = fetchDataCV()
    
   
    var dogImages: DogImageResponse {
        didSet {
            tableView.reloadData()
        }
    }
    
    var messages: [String] {
        dogImages.message.compactMap{ $0 }
    }
   
    
    var VCstring  = "DATA VIEWCONTROLLER" {
        didSet {
            print("data coming from presenter to viewcontroller \( VCstring)")
        }
    }
    
    private let interactor: MainSceneBusinessLogic
    private let router: MainSceneRoutingLogic
    
    // Collection View
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 112)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.register(PhotoCellCV.self, forCellWithReuseIdentifier: "PhotoCellCV")
        return collectionView
    }()
    
    // Collection View2
    private let collectionView2: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 88, height: 32)
        let collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView2.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView2.register(TextButtonCell.self, forCellWithReuseIdentifier: "TextButtonCell")
        return collectionView2
    }()

    // Table View
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "\(TableViewCell.self)")
        return tableView
    }()
    
    
    init(
        interactor: MainSceneBusinessLogic,
        router: MainSceneRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        self.dogImages = DogImageResponse(message: [], status: "")
        self.pizzaNames = TitleTV.init()
            super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
            NetworkManager.shared.fetchBreedDog(from: "https://dog.ceo/api/breed/hound/images") { [weak self] resultDogBreed in
                   guard let self = self, let dogsBreed = resultDogBreed else { return }
                   print(dogsBreed.message.count)
                   self.dogImages = dogsBreed
               }
            
        setupCollectionView()
        setupCollectionView2()
        initForm()
        setupTableView()
        view.backgroundColor = .white
        print("start")
           
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupCollectionView2() {
        view.addSubview(collectionView2)
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            collectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView2.heightAnchor.constraint(equalToConstant: 60)
        ])
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collectionView2.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - MainSceneDisplayLogic
    // Метод, который выводит на экран данные во view контроллера
    func displayInitForm(_ viewModel: MainScene.InitForm.ViewModel) {
        VCstring = viewModel.stringViewModel
        print("получаем инфу из презентера во вьюконтроллер(ВЬЮКОТНРОЛЛЕР)")
    }
    
    // MARK: - Private
    // Метод для инициализации формы, который вызывает запрос данных у интерактора
    private func initForm() {
        interactor.requestInitForm(MainScene.InitForm.Request(stringRequest: VCstring))
        print("отправляем данные из вьюконтроллера в Interactor(ВЬЮКОНТРОЛЛЕР)")
    }
}

extension MainSceneViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableViewCell.self)") as! TableViewCell
        cell.uploadImageFromUrl(messages[indexPath.row])
        for price in stride(from: 300, through: 1000, by: 100) {
            prices.append("  от \(price) руб  ")
        }
        cell.priceLabel.text = prices[indexPath.row]
        let numberOfPizzas = tableView.numberOfRows(inSection: 0) // Получаем количество строк в таблице
        for _ in 0..<numberOfPizzas {
            let randomIndex = Int.random(in: 0..<pizzaNames.pizzas.count) // Генерируем случайный индекс в диапазоне от 0 до размера массива пицц
            let pizzaName = pizzaNames.pizzas[randomIndex] // Получаем случайную пиццу из массива пицц
            tableData.append(pizzaName) // Добавляем пиццу в массив данных для таблицы
            cell.descriptionLabel.text = tableData[indexPath.row]
            cell.dogTitleLabel.text = tableData[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension MainSceneViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == collectionView2 ? buttonTitles.count : fetchImagesCV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextButtonCell", for: indexPath) as! TextButtonCell
            cell.title = buttonTitles[indexPath.row]
            cell.button.tag = indexPath.row // устанавливаем тег кнопки
            cell.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside) // добавляем обработчик нажатия на кнопку
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCellCV", for: indexPath) as! PhotoCellCV
            cell.imageView.image = fetchImagesCV[indexPath.item].image
            return cell
        }
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        let buttonTag = sender.tag
        switch buttonTag {
        case 0:
            // Действие для первой кнопки
            let indexPath = IndexPath(row: 10, section: 0) // индекс секции и ячейки, к которой нужно пролистать таблицу
            tableView.scrollToRow(at: indexPath, at: .top, animated: true) // прокручиваем таблицу к указанной ячейке с анимацией

            print("Нажата первая кнопка")
        case 1:
            let indexPath = IndexPath(row: 20, section: 0) // индекс секции и ячейки, к которой нужно пролистать таблицу
            tableView.scrollToRow(at: indexPath, at: .top, animated: true) // прокручиваем таблицу к указанной ячейке с анимацией
            // Действие для второй кнопки
            print("Нажата вторая кнопка")
        case 2:
            let indexPath = IndexPath(row: 30, section: 0) // индекс секции и ячейки, к которой нужно пролистать таблицу
            tableView.scrollToRow(at: indexPath, at: .top, animated: true) // прокручиваем таблицу к указанной ячейке с анимацией
            // Действие для третьей кнопки
            print("Нажата третья кнопка")
        case 3:
            let indexPath = IndexPath(row: 40, section: 0) // индекс секции и ячейки, к которой нужно пролистать таблицу
            tableView.scrollToRow(at: indexPath, at: .top, animated: true) // прокручиваем таблицу к указанной ячейке с анимацией
            // Действие для четвертой кнопки
            print("Нажата четвертая кнопка")
        case 4:
            let indexPath = IndexPath(row: 50, section: 0) // индекс секции и ячейки, к которой нужно пролистать таблицу
            tableView.scrollToRow(at: indexPath, at: .top, animated: true) // прокручиваем таблицу к указанной ячейке с анимацией
            // Действие для пятой кнопки
            print("Нажата пятая кнопка")
        default:
            break
        }
    }

}


