//
//  MusicViewController.swift
//  ItunesApp
//
//  Created by Nikolai Maksimov on 16.10.2022.
//

import UIKit

enum Sections: Int {
    case TopAlbums = 0
    case Empty = 1
    case JustHits = 2
    case Preorders = 3
    case PopularRockAlbums = 4
    case PopularPopAlbums = 5
    case PopularHipHopAlbums = 6
}

class MusicViewController: UIViewController {
    
    let sectionsTitles: [String] = ["Топ-альбомы", "", "Только хиты", "Предзаказы",
                                    "Популярные рок-альбомы", "Популярные поп-альбомы",
                                    "Популярные хип-хоп-альбомы"]
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Подборка", "Чарты"])
        
        return segmentedControl
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = segmentedControl
   
        view.addSubview(headerView)
        view.addSubview(tableView)
        
  
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.rowHeight = 120
        
        if #available(iOS 16.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "list.bullet"), target: self, action: #selector(newViewVC))
        } else {
            // Fallback on earlier versions
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Жанры", style: .plain, target: self, action: #selector(newViewVC))
    }
    
    @objc func newViewVC() {
        present(GenreViewController(), animated: true)
    }
}

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    
        func numberOfSections(in tableView: UITableView) -> Int {
            sectionsTitles.count
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = sectionsTitles[indexPath.row]
        
        return cell
    }
    
}

extension MusicViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 120),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}
