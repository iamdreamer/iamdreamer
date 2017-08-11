//
//  ViewController.swift
//  CloudsAPP
//
//  Created by mike on 2017/7/24.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI 連結
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    //UI 連結
    @IBAction func okButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    var studentData: StudentData!//用來在放要傳送的資料
    
    //使用 segue 跳回之前頁面時，可以準備一些要傳的資料
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)//有的類別會需要用到
        
        if saveButton === sender as? UIBarButtonItem {
            let name = nameLabel.text ?? "No data"
            let gender = genderLabel.text ?? "No data"
            let birth = birthLabel.text ?? "No data"
            let email = emailLabel.text ?? "No data"
            let phone = phoneLabel.text ?? "No data"
            let address = addressLabel.text ?? "No data"
            
            studentData = StudentData(name: name, gender: gender, birth: birth)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

