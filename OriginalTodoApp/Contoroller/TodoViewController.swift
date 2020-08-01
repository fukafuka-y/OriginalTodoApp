//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie

class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate{

    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var timeTextFiled: DatePickerKeyboard!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var plusTodoView: UIView!
    @IBOutlet weak var priorityTextField: UITextField!
    @IBOutlet weak var deliteButton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    
   
     var todoTextArray:[String] = ["ToDo入力","勉強する"]
     var todoText:String = ""
     var todoTimeArray:[String] = ["時間を入力","8/1 19:00"]
     var todoTime:String = ""
     var colorNumberArray:[Int] = [0,0]
     var colorNumber:Int = 0
    
     override func viewDidLoad() {
        super.viewDidLoad()
                  
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        plusTodoView.backgroundColor = UIColor(red: 0, green: 0.2, blue: 0.8, alpha: 0.6)
        plusTodoView.isHidden = true
        
        timeTextFiled.delegate = self
        todoTextField.delegate = self
     
//        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
//        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
//        space.width = 12
//        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
//        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
//        toolbar.setItems([flexSpaceItem,cancelItem,doneItem,space], animated: true)
//
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(cellLongPressed))
        longPressRecognizer.delegate = self
        todoTableView.addGestureRecognizer(longPressRecognizer)
        
        deliteButton.layer.cornerRadius = 20
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
        
              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                animationView.isHidden = true
                
             }
     
          }
    
    @IBAction func blueButtonTap(_ sender: Any) {
        
        blueButton.layer.borderColor = UIColor.white.cgColor
        blueButton.layer.borderWidth = 2.0
        yellowButton.layer.borderWidth = 0
        colorNumber = 1
        
    }
    
    @IBAction func yellowButtonTap(_ sender: Any) {
        
        yellowButton.layer.borderColor = UIColor.white.cgColor
        yellowButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        colorNumber = 2
    }
    
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoTimeArray.count
           }
           
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
                 cell.ToDoTextLabel.text = todoTextArray[indexPath.row]
                 cell.ToDoTimeLabel.text = todoTimeArray[indexPath.row]
                 cell.selectionStyle = .none
           
            
            switch colorNumberArray[indexPath.row] {
            case 1:
                cell.backgroundColor = .systemBlue
            case 2:
                cell.backgroundColor = .yellow
//            case "⭐️":
//                cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0.6, alpha: 0.7)
//            case "🔼":
//                cell.backgroundColor = .white
            default:
                cell.backgroundColor = .white
            }
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
        colorNumberArray.append(colorNumber)
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        colorNumber = 0
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
    
    @IBAction func memoButton(_ sender: Any) {
    performSegue(withIdentifier: "memo", sender: nil)
    }
    
    
    @objc func cellLongPressed(recognizer: UILongPressGestureRecognizer) {
        let point = recognizer.location(in: todoTableView)
        let indexPath = todoTableView.indexPathForRow(at: point)
        if indexPath == nil {

        } else if recognizer.state == UIGestureRecognizer.State.began  {
            // 長押しされた場合の処理
            showAnimation()
            todoTextArray.remove(at: indexPath!.row)
            todoTimeArray.remove(at: indexPath!.row)
            colorNumberArray.remove(at: indexPath!.row)
            todoTableView.reloadData()
         }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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

