//
//  ViewController.swift
//  FoodTracker
//
//  Created by apple on 2017/9/27.
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }

    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //当用户结束编辑时（比如回车），调用这个函数， text field归还FirstResponser地位
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
 
    func textFieldDidEndEditing(_ textField: UITextField) {
        //textFieldShouldReturn后调用此函数，可以获取用户输入的内容进行操作
        mealNameLabel.text = textField.text
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

