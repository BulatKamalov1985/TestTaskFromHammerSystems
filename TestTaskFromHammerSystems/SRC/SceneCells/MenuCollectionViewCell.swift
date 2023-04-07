//
//  MenuCollectionViewCell.swift
//  TestTaskFromHammerSystems
//
//  Created by Bulat Kamalov on 06.04.2023.
//

import UIKit

class TextButtonCell: UICollectionViewCell {
    
    let button = UIButton()
    var title: String? {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(button)
        
        // Настраиваем внешний вид кнопки
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .light)
        button.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        button.layer.borderWidth = 0.2
        button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1), for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        
        // Задаем констрейнты для кнопки
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        button.addTarget(target, action: action, for: controlEvents)
    }
}
