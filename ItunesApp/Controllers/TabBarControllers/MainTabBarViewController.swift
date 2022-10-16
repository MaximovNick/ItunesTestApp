//
//  MainTabBarViewController.swift
//  ItunesApp
//
//  Created by Nikolai Maksimov on 16.10.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let musicVC     = UINavigationController(rootViewController: MusicViewController())
        let movieVC     = UINavigationController(rootViewController: MusicViewController())
        let searchVC    = UINavigationController(rootViewController: SearchViewController())
        let soundVC     = UINavigationController(rootViewController: SoundViewController())
        let moreVC      = UINavigationController(rootViewController: MoreViewController())
        
        musicVC.tabBarItem.image    = UIImage(systemName: "music.note")
        movieVC.tabBarItem.image    = UIImage(systemName: "film")
        searchVC.tabBarItem.image   = UIImage(systemName: "magnifyingglass")
        soundVC.tabBarItem.image    = UIImage(systemName: "bell")
        moreVC.tabBarItem.image     = UIImage(systemName: "ellipsis")
        
        musicVC.title   = "Музыка"
        movieVC.title   = "Фильмы"
        searchVC.title  = "Поиск"
        soundVC.title   = "Звуки"
        moreVC.title    = "Еще"
        
        setViewControllers([musicVC, movieVC, searchVC, soundVC, moreVC], animated: true)
    }
}
