//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie

class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    @IBOutlet weak var todoTableView: UITableView!
    
     var todoTextArray:[String] = ["体操","ランニング"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil{
            
            todoTextArray.append(UserDefaults.standard.object(forKey: "TodoList") as! String)
            
            
        }else{
            
        }
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
    
        
    }
    
//    @IBAction func plusButton(_ sender: Any) {
//
//        pushAddButton()
//    }
//
//
//     func pushAddButton() {
//                   let alert = UIAlertController(title: "タスクを追加", message: nil, preferredStyle: .alert)
//                   alert.addTextField { textField in
//                        textField.placeholder = "タスク名を入力"
//                    }
//
//                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//
//                    if let text = alert.textFields?.first?.text{
//
//                        self.todoTextArray.append(text)
//
//                        self.todoTableView.reloadData()
//                        }
//                    }))
//
//                    // キャンセルボタンを追加
//                   alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//                    // アラートを表示す
//                   present(alert, animated: true, completion: nil)
//                }

        
    func showAnimation() {
           
              let animationView = AnimationView(name: "checkAnimation")
              animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width/4, height: view.bounds.height/5)
              animationView.center = self.view.center
              animationView.contentMode = .scaleAspectFit
              animationView.animationSpeed = 0.5
             
              
              view.addSubview(animationView)

              animationView.play()
              
              
              
          }
       
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
     }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return todoTextArray.count
     }
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
        cell.ToDoTextLabel.text = todoTextArray[indexPath.row]
        return cell
    
    }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return view.frame.size.height/8
             }
     
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        showAnimation()
        todoTextArray.remove(at: indexPath.row)
        tableView.reloadData()
        
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
