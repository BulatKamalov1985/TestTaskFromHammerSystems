//
//  TableViewCell.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 05.04.2023.
//


import UIKit

class MainSceneTableViewCell: UITableViewCell {
    
    let dogImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let dogTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        label.backgroundColor = .white
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        label.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        label.layer.borderWidth = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dogImageView)
        addSubview(dogTitleLabel)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        setImageConstraints()
        setTitleLabelConstraints()
        setDescriptionLabelConstraints()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    
    func setImageConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dogImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            dogImageView.heightAnchor.constraint(equalToConstant: 80),
            dogImageView.widthAnchor.constraint(equalTo: dogImageView.heightAnchor, multiplier: 16/9)
        ])
    }
    
    func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            dogTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dogTitleLabel.leadingAnchor.constraint(equalTo: dogImageView.trailingAnchor, constant: 20),
            dogTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    func setDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: dogTitleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: dogImageView.trailingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    func uploadImageFromUrl(_ stringURL: String) {
        guard let url = URL(string: stringURL) else {
            print("Something went wrong: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                guard let self = self else { return }
                guard let image = UIImage(data: data) else { return }
                self.dogImageView.image = image
                print("Image uploaded successfully.")
            }
        }.resume()
    }
}
