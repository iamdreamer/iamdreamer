//
//  ViewController.swift
//  CloudsAPP
//
//  Created by mike on 2017/7/24.
//  Copyright © 2017年 mike. All rights reserved.
//

import UIKit
import Alamofire

//加入選擇照片用的協定：UIImagePickerControllerDelegate，UIImagePickerControllerDelegate
class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var apiGithubComJsonsGloss: [ApiGithubComJsonGloss] = []//用來放 completion 傳來的資料
    
    var helper = Helper.sharedInstance//用來放 singleton 物件
    
    //UI 連結
    @IBOutlet weak var bigHeadPhotoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    //UI 連結
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: UIBarButtonItem) {//2個 segue 跳回上一頁的方式不同
        
        let isPresentingInAddItem = presentingViewController is UINavigationController
        
        if isPresentingInAddItem {
            dismiss(animated: true, completion: nil)//原來的 navitation controller 方式，modal 頁面的方式
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)//用 show 產生的頁面的方式
        } else {
            fatalError("沒有屬於任何 navigation controller")
        }
    }
    
    var studentData: StudentData!//用來在放要傳送的資料
    
    //使用 segue 跳回之前頁面時，可以準備一些要傳的資料
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)//有的類別會需要用到
        
        if saveButton === sender as? UIBarButtonItem {
            let name = nameTextField.text ?? "No data"
            let gender = genderTextField.text ?? "No data"
            let birth = birthTextField.text ?? "No data"
            let email = emailTextField.text ?? "No data"
            let phone = phoneTextField.text ?? "No data"
            let address = addressTextField.text ?? "No data"
            
            studentData = StudentData(name: name, gender: gender, birth: birth, photo: nil, stars: 1)//StudentData 參數改變
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let studentDataTmp = studentData else {
            //            fatalError("沒有傳進來的資料")//新增資料時會掛，改用 return
            return
        }
       
        nameTextField.delegate = self
        genderTextField.delegate = self
        birthTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        addressTextField.delegate = self
        
        //點別處收起鍵盤
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false//讓 tableView 可以正常動作
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)//方法一
        
//        nameTextField.resignFirstResponder()//方法二
//        genderTextField.resignFirstResponder()
//        birthTextField.resignFirstResponder()
//        emailTextField.resignFirstResponder()
//        phoneTextField.resignFirstResponder()
//        addressTextField.resignFirstResponder()
        
        return true
    }
    
    //點選照片時觸發的動作, 由 UI 的 tap gesture 拉過來
    @IBAction func selectPhoto(_ sender: UITapGestureRecognizer) {
        let selectPhotoController = UIImagePickerController()//選擇照片的頁面
        selectPhotoController.sourceType = .photoLibrary//從照片庫
//        selectPhoto.sourceType = .camera
        selectPhotoController.delegate = self
        
        present(selectPhotoController, animated: true, completion: nil)
    }
    
    //協定必需完成的 取消 方法
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //協定必需完成的 選了一個照片 方法
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("解不出照片 - \(info)")
        }
        
        bigHeadPhotoImageView.image = selectedPhoto//把解出來的照片放到程式中的大頭照位置
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

