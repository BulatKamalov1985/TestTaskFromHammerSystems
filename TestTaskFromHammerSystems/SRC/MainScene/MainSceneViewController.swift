//
//  MainSceneViewController.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 04.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit


final class MainSceneViewController: UIViewController, MainSceneDisplayLogic {
    
    var filters: [FilterViewModel] = []
    var dishes: [DishViewModel] = []
    
    // Array of pizza names
    let pizzaNames: TitleTV
    
    var prices: [String] = []
    
    // Data array for the table
    var tableData: [String] = []
    
    var dogImages: DogImages {
        didSet {
            tableView.reloadData()
        }
    }
    
    var messages: [String] {
        dogImages.message.compactMap{ $0 }
    }
    
    var VCstring  = "DATA STRING" {
        didSet {
            print("data coming from presenter to viewcontroller \( VCstring)")
        }
    }
    
    private let interactor: MainSceneBusinessLogic
    private let router: MainSceneRoutingLogic
    
    private var dogsCollectionViewProvider: DogsCollectionViewProvider?
    private var filtersCollectionViewProvider: FiltersCollectionViewProvider?
    
    // MARK: - Dogs Collection View
    private let dogsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 112)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.register(MainSceneCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCellCV")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Filter Collection View
    private let filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 88, height: 32)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.register(MainSceneMenuCollectionViewCell.self, forCellWithReuseIdentifier: "TextButtonCell")
        return collectionView
    }()
    
    // MARK: - Table View
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(MainSceneTableViewCell.self, forCellReuseIdentifier: "\(MainSceneTableViewCell.self)")
        return tableView
    }()
    
    
    init(
        interactor: MainSceneBusinessLogic,
        router: MainSceneRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        self.dogImages = DogImages(message: [], status: "")
        self.pizzaNames = TitleTV.init()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        dogsCollectionViewProvider = DogsCollectionViewProvider()
        setupDogCollectionView()
        filtersCollectionViewProvider = FiltersCollectionViewProvider()
        filtersCollectionViewProvider?.scrollToIndexPath = { [weak self] indexPath in
            guard let indexPath = indexPath else { return }
            self?.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        setupfilterCollectionView()
        setupTableView()
        uploadFetchBreedDog()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("request dogs")
        interactor.update(.updateDogs)
        interactor.update(.updateFilters)
        interactor.update(.updateDishes)
        
    }
    
    func uploadFetchBreedDog() {
        NetworkManager.shared.fetchBreedDog(from: "https://dog.ceo/api/breed/hound/images") { [weak self] resultDogBreed in
            guard let dogsBreed = resultDogBreed else { return }
            self?.dogImages = dogsBreed
        }
    }
    
    func setupDogCollectionView() {
        view.addSubview(dogsCollectionView)
        NSLayoutConstraint.activate([
            dogsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dogsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dogsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dogsCollectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
        dogsCollectionView.dataSource = dogsCollectionViewProvider.self
        dogsCollectionView.delegate  = dogsCollectionViewProvider.self
    }
    
    func setupfilterCollectionView() {
        view.addSubview(filterCollectionView)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: dogsCollectionView.bottomAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 60)
        ])
        filterCollectionView.dataSource = filtersCollectionViewProvider
        filterCollectionView.delegate = filtersCollectionViewProvider
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - MainSceneDisplayLogic
    // Метод, который выводит на экран данные во view контроллер
    func display(_ viewModel:   MainScene.ViewModel) {
        switch viewModel {
        case .dogs(let dogsViewmodel):
            dogsCollectionViewProvider?.updateData(dogsViewmodel)
            dogsCollectionView.reloadData()
        case .filters(let filtersViewModel):
            filtersCollectionViewProvider?.updateData(filtersViewModel)
            filterCollectionView.reloadData()
        case .dishes(let dishes):
            break
        }
    }
}


extension MainSceneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MainSceneTableViewCell.self)") as! MainSceneTableViewCell
        cell.dogImageView.image = nil
        uploadImageFromUrl(indexPath: indexPath)
        
        for price in stride(from: 300, through: 1000, by: 100) {
            prices.append("  от \(price) руб  ")
        }
        
        cell.priceLabel.text = prices[indexPath.row]
        let numberOfPizzas = tableView.numberOfRows(inSection: 0) // Get the number of rows in the table
        for _ in 0..<numberOfPizzas {
            let randomIndex = Int.random(in: 0..<pizzaNames.pizzas.count) // Generate a random index within the range of 0 to the size of the pizza array
            let pizzaName = pizzaNames.pizzas[randomIndex] // Get a random pizza from the pizza array
            tableData.append(pizzaName) // Add the pizza to the data array for the table
            cell.descriptionLabel.text = tableData[indexPath.row]
            cell.dogTitleLabel.text = tableData[indexPath.row]
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func uploadImageFromUrl(indexPath: IndexPath) {
        let stringURL = messages[indexPath.row]
        
        guard let url = URL(string: stringURL) else {
            print("Something went wrong: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                guard let self = self else { return }
                guard let image = UIImage(data: data) else { return }
                guard let cell = self.tableView.cellForRow(at: indexPath) as? MainSceneTableViewCell else { return }
                cell.dogImageView.image = image
                print("Image uploaded successfully.")
            }
        }
        .resume()
    }
}
