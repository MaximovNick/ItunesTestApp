//
//  MusicViewController.swift
//  ItunesApp
//
//  Created by Nikolai Maksimov on 16.10.2022.
//

import UIKit

class MusicViewController: UIViewController {
    
    let sectionsTitles: [String] = ["", "Топ-альбомы", "", "Только хиты", "Предзаказы",
                              "Популярные рок-альбомы", "Популярные поп-альбомы",
                              "Популярные хип-хоп-альбомы"]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
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
        
   
        return cell
    }
    
    
}
