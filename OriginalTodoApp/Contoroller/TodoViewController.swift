//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie

class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var timeTextFiled: TimePickerKeyboard!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var plusTodoView: UIView!
    @IBOutlet weak var dateTextField: DatePickerKeyboard!
    @IBOutlet weak var priorityTextField: UITextField!
    
     var todoTextArray:[String] = ["体操","ランニング"]
     var todoText:String = ""
     var todoTimeArray:[String] = ["09:00","10:00"]
     var todoTime:String = ""
     var prioritylist = ["重要度１","重要度2","重要度3", "重要度4","重要度5"]
     let priorityPickerView: UIPickerView = UIPickerView()
    
     override func viewDidLoad() {
        super.viewDidLoad()
                  
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        plusTodoView.backgroundColor = .darkGray
        plusTodoView.alpha = 0.5
        plusTodoView.isHidden = true
        
        timeTextFiled.delegate = self
        todoTextField.delegate = self
        dateTextField.delegate = self
        
        priorityPickerView.delegate = self
        priorityPickerView.dataSource = self
//        priorityPickerView.showsSelectionIndicator = true

        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([flexSpaceItem,cancelItem,doneItem,space], animated: true)

        self.priorityTextField.inputView = priorityPickerView
        self.priorityTextField.inputAccessoryView = toolbar
        priorityTextField.delegate = self
               
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    func showAnimation() {
           
              let animationView = AnimationView(name: "checkAnimation")
              animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width/4, height: view.bounds.height/5)
              animationView.center = self.view.center
              animationView.contentMode = .scaleAspectFit
              animationView.animationSpeed = 0.5
              view.addSubview(animationView)
              animationView.play()
     
          }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoTimeArray.count
           }
           
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
                 cell.ToDoTextLabel.text = todoTextArray[indexPath.row]
                 cell.ToDoTimeLabel.text = todoTimeArray[indexPath.row]
                return cell
            }
                
       
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
     }
   
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return view.frame.size.height/9
             }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAnimation()
        todoTextArray.remove(at: indexPath.row)
        todoTimeArray.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    @IBAction func plusToDo(_ sender: Any) {
        
        plusTodoView.isHidden = false
        timeTextFiled.text = ""
    }
    
    @IBAction func ToDoInput(_ sender: Any) {
        
        if timeTextFiled.text != "" && todoTextField.text != ""{
        todoTime = timeTextFiled.text!
        todoText = todoTextField.text!
        todoTimeArray.append(todoTime)
        todoTextArray.append(todoText)
        timeTextFiled.text = ""
        todoTextField.text = ""
        plusTodoView.isHidden = true
        todoTableView.reloadData()
        }
    
    }
    
    
    @IBAction func todoReturn(_ sender: Any) {
        
        timeTextFiled.text = ""
        todoTextField.text = ""
        plusTodoView.isHidden = true
        
    }
    
    
    
    @IBAction func weatherButton(_ sender: Any) {
         let baseviewContorller = BaseViewController()
         present(baseviewContorller,animated: true ,completion: nil)
        
    }
    
    
    @IBAction func NewsButton(_ sender: Any) {
        let base2viewContorller = Base2ViewController()
        present(base2viewContorller,animated: true ,completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return prioritylist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return prioritylist[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priorityTextField.text = prioritylist[row]
    }
    
    @objc func cancel() {
           self.priorityTextField.text = ""
           self.priorityTextField.endEditing(true)
       }

    @objc func done() {
           self.priorityTextField.endEditing(true)
       }

       func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
           return CGRect(x: x, y: y, width: width, height: height)
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

