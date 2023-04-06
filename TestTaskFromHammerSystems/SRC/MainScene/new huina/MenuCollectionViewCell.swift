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
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
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
