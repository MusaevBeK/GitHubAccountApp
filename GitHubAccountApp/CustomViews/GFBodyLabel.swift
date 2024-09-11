//
//  GFBodyLabel.swift
//  GitHubAccountApp
//
//  Created by Бексултан Мусаев on 9/9/24.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure() {
        textColor                       = .secondaryLabel
        font                            = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth       = true
        minimumScaleFactor              = 0.75
        lineBreakMode                   = .byWordWrapping
    }
}
