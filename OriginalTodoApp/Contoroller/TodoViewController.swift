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
    @IBOutlet weak var plusToDoView: UIView!
    @IBOutlet weak var timeTextFiled: TimePickerKeyboard!
    @IBOutlet weak var todoTextField: UITextField!
    
    
    var todoTextArray:[String] = ["体操","ランニング"]
     var todoText:String = ""
     var todoTimeArray:[String] = ["09:00","10:00"]
     var todoTime:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
                  
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        plusToDoView.backgroundColor = .darkGray
        plusToDoView.alpha = 0.5
        plusToDoView.isHidden = true
        
        timeTextFiled.delegate = self
        todoTextField.delegate = self

               
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

//        if UserDefaults.standard.object(forKey: "TodoList") != nil && UserDefaults.standard.object(forKey: "TodoTime") != nil{
//
//              todoText = UserDefaults.standard.object(forKey: "TodoList") as! String
//              todoTextArray.append(todoText)
//              todoTime = UserDefaults.standard.object(forKey: "TodoTime") as! String
//              todoTimeArray.append(todoTime)
//              todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
//              todoTableView.reloadData()
//              UserDefaults.standard.removeObject(forKey: "ToDoCell")
//
//          }
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
        
        plusToDoView.isHidden = false
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
        plusToDoView.isHidden = true
        todoTableView.reloadData()
        }
        
        
    }
    
    
    @IBAction func todoReturn(_ sender: Any) {
        
        timeTextFiled.text = ""
        todoTextField.text = ""
        plusToDoView.isHidden = true
        
        
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

