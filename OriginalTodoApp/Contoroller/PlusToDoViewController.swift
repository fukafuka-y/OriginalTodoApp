//
//  PlusToDoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class PlusToDoViewController: UIViewController,UITextFieldDelegate {

   
    @IBOutlet weak var TodoTextField: UITextField!
    @IBOutlet weak var TodoTimeTextField: TimePickerKeyboard!
    
    var todoText:String = ""
    var todoTime:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2)
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        TodoTextField.delegate = self
        TodoTimeTextField.delegate = self

    }
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        todoText = TodoTextField.text!
        saveText(todoText: todoText)
        todoTime = TodoTimeTextField.text!
        saveTime(todoTime: todoTime)
        
        return true
        
    }
    
    @IBAction func plusTodoList(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func saveText(todoText: String){

           // Keyを指定して保存
        UserDefaults.standard.set(todoText, forKey: "TodoList")
       }

    func saveTime(todoTime:String){
        
         UserDefaults.standard.set(todoTime, forKey: "TodoTime")
        
    }
   
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
