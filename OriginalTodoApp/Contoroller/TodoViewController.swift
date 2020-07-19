//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    @IBOutlet weak var todoTableView: UITableView!
    
     var todoTextArray:[String] = ["体操","ランニング"]
    
     var todoTimeArray:[String] = ["10:00","09:00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
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
        cell.ToDoTimeLabel.text = todoTimeArray[indexPath.row]
        return cell
    
    }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return view.frame.size.height/8
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
