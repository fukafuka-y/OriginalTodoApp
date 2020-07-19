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
//    @IBOutlet weak var TodoTimeTextField: TimePickerKeyboard!
    
    var todoText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.removeObject(forKey: "TodoList")
        TodoTextField.delegate = self
//        TodoTimeTextField.delegate = self

    }
    
    @IBAction func plusTodoList(_ sender: Any) {
        
        todoText = TodoTextField.text!
        saveData(todoText: todoText)
        dismiss(animated: true, completion: nil)
    }
    
    func saveData(todoText: String){
    
           // Keyを指定して保存
        UserDefaults.standard.set(todoText, forKey: "TodoList")
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
