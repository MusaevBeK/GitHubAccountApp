//
//  SearchVC.swift
//  GitHubAccountApp
//
//  Created by Бексултан Мусаев on 9/9/24.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowesListVC() {
//        if let redirectUrl = URL(string: "https://mobile.optima24.kg/payments/payment-create?serviceId=f23a5b24-44dc-11ef-9348-0242ac11001f&requisites=996550646493&amount=123.0") {
//            UIApplication.shared.open(redirectUrl, options: [:], completionHandler: nil)
//        }
        guard isUserNameEntered else {
            print("No username")
            return
        }
        let vc = FollowesListVC()
        vc.userName = usernameTextField.text ?? ""
        vc.title = usernameTextField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(resource: .gitHubLogo)
        logoImageView.contentMode = .scaleAspectFill
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowesListVC), for: .touchUpInside)
        callToActionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowesListVC()
        return true
    }
}
