//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie

 class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
 

    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var timeTextFiled: TimePickerKeyboard!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var plusTodoView: UIView!
    
    var todoTextArray:[String] = ["体操","ランニング"]
     var todoText:String = ""
     var todoTimeArray:[String] = ["09:00","10:00"]
     var todoTime:String = ""
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

