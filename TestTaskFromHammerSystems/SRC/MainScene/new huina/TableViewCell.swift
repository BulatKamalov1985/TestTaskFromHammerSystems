//
//  TableViewCell.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 05.04.2023.
//


import UIKit

class TableViewCell: UITableViewCell {
    
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
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dogImageView)
        addSubview(dogTitleLabel)
        setImageConstraints()
        setTitleLabelConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImage(image: UIImage) {
        dogImageView.image = image
    }

    func setTitle(title: String) {
        dogTitleLabel.text = title
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
            dogTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dogTitleLabel.leadingAnchor.constraint(equalTo: dogImageView.trailingAnchor, constant: 20),
            dogTitleLabel.heightAnchor.constraint(equalToConstant: 80),
            dogTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
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

