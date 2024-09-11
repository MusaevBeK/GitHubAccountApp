//
//  FollowesListVC.swift
//  GitHubAccountApp
//
//  Created by Бексултан Мусаев on 9/9/24.
//

import UIKit
import SnapKit

class FollowesListVC: UIViewController {
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureUserName() {
//        view.addSubview(userName)
//        
//        userName.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//        }
    }
}
