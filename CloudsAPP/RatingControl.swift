//
//  RatingControl.swift
//  CloudsAPP
//
//  Created by mike on 2017/8/17.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

//與 Interface Builder 連接
@IBDesignable class RatingControl: UIStackView {

    private var starButtons = [UIButton]()//存放生成的物件，以供後來使用
    var stars = 0
    
    //與 Interface Builder 連接
    @IBInspectable var starSize: CGSize = CGSize(width: 15.0, height: 15.0) {
        didSet {
            setupButtons()
        }
    }
    
    //與 Interface Builder 連接
    @IBInspectable var starNumber: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setupButtons()
    }

    private func setupButtons() {
        
        //先根據陣列中的物件從 UI 移除
        for button in starButtons {
            removeArrangedSubview(button)
        }
        starButtons.removeAll()//再從陣列中全部移除
        
        //根據 UI 設定來產生一些 button
        for _ in 0..<starNumber {
            let button = UIButton()
            button.backgroundColor = UIColor.black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true//根據 UI 設定的 height, width
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(RatingControl.tapButton(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            starButtons.append(button)
        }
    }
    
    func tapButton(button: UIButton) {
        print("點評")
    }
}
