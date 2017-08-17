//
//  RatingControl.swift
//  CloudsAPP
//
//  Created by mike on 2017/8/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

    private var starButtons = [UIButton]()
    var stars = 0
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setupButtons()
    }

    private func setupButtons() {
        //產生 1 個 button
//        let button = UIButton()
//        button.backgroundColor = UIColor.black
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
//        button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
//        
//        button.addTarget(self, action: #selector(RatingControl.tapButton(button:)), for: .touchUpInside)
//        
//        addArrangedSubview(button)
        
        //產生一些 button
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = UIColor.black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
            
            button.addTarget(self, action: #selector(RatingControl.tapButton(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            starButtons.append(button)
        }
    }
    
    func tapButton(button: UIButton) {
        print("點評")
    }
}
