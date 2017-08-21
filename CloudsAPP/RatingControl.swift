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
    var stars = 0 {//使用 swift 語法來監看屬性數值的變化
        didSet {//改變之後，執行以下動作
            drawStarButton()
        }
    }
    
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
            button.removeFromSuperview()//把殘影移除
        }
        starButtons.removeAll()//再從陣列中全部移除
        
        let bundle = Bundle(for: type(of:self))//使用 bundle 取得資源，這行是從程式自己
        let starEmpty = UIImage(named: "starEmpty", in: bundle, compatibleWith: self.traitCollection)
        let starHighlight = UIImage(named: "starHighlight", in: bundle, compatibleWith: self.traitCollection)
        let starFilled = UIImage(named: "starFilled", in: bundle, compatibleWith: self.traitCollection)
        
        
        //根據 UI 設定來產生一些 button
        for _ in 0..<starNumber {
            let button = UIButton()
//            button.backgroundColor = UIColor.black
            button.setImage(starEmpty, for: .normal)//為按鈕的不同狀態設定圖檔
            button.setImage(starHighlight, for: .highlighted)
            button.setImage(starFilled, for: .selected)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true//根據 UI 設定的 height, width
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Selector 是從 OC 沿續過來的
//            button.addTarget(self, action: Selector("tapButton:"), for: .touchUpInside)
//            swift 用比較安全的方法，請 compiler 幫忙轉成字串
//            button.addTarget(self, action: #selector(RatingControl.tapButton(button:)), for: .touchUpInside)
            button.addTarget(self, action: .tapButton, for: .touchUpInside)//改到 extension 增加程式可讀
            
            addArrangedSubview(button)
            starButtons.append(button)
        }
    }
    
    func tapButton(button: UIButton) {
        print("點評")
        guard let index = starButtons.index(of: button) else {//確認按到的是陣列中的哪個按鈕
            fatalError("按鈕不在陣列中")
        }
        
        let selectedStarNumber = index + 1//index 是從 0 開始，星星數是從 1 開始
        stars = selectedStarNumber
    }
    
    private func drawStarButton() {
        for (index, button) in starButtons.enumerated() {//將陣列解成 鍵-值 對，這邊即 index-物件 對
            button.isSelected = index < stars//index 比星星數小的時候，會得到 true，所以星星數就對了
        }
    }
}

extension Selector{
    static let tapButton = #selector(RatingControl.tapButton(button:))
}
