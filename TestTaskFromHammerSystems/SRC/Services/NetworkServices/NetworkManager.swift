//
//  NetworkManager.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 06.04.2023.
//




import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()

    private init() {}

    func fetchBreedDog(from url: String?, with completion: @escaping (DogImages?) -> Void) {
        print("string is came")
        guard let url = URL(string: url ?? "") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                print("Have Error")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let dogsBreed = try JSONDecoder().decode(DogImages.self, from: data)
                DispatchQueue.main.async {
                    completion(dogsBreed)
                    print("Have Parsed")}
            } catch let error {
                print("Somthing Wrong")
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}
