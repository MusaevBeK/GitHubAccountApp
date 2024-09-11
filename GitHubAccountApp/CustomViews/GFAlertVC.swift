//
//  GFAlertVC.swift
//  GitHubAccountApp
//
//  Created by Бексултан Мусаев on 9/9/24.
//

import UIKit
import SnapKit

class GFAlertVC: UIViewController {

    let containerView   = UIView()
    let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel    = GFBodyLabel(textAlignment: .center)
    let actionButton    = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
        
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        
        containerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
    }
    
    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Some title"
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(20)
            make.horizontalEdges.equalTo(containerView.snp.horizontalEdges).inset(20)
            make.height.equalTo(28)
        }
    }
    
    private func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(containerView.snp.horizontalEdges).inset(20)
            make.height.equalTo(44)
        }
    }
    
    private func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Some message"
        messageLabel.numberOfLines = 4
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(containerView.snp.horizontalEdges).inset(20)
            make.bottom.equalTo(actionButton.snp.top).offset(-12)
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
