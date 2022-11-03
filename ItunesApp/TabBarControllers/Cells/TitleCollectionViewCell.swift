//
//  TitleCollectionViewCell.swift
//  ItunesApp
//
//  Created by Nikolai Maksimov on 18.10.2022.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let trackTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название трека"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя артиста"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        addSubview(trackTitleLabel)
        addSubview(artistTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            artistTitleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 0),
            artistTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            artistTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
}
