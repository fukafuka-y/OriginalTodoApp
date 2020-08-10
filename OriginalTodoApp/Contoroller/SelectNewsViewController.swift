//
//  SelectNewsViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/10.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class SelectNewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let newsArray:[String] = ["国際","エンタメ","IT","地域","国内","経済","スポーツ","科学"]
    
    @IBOutlet weak var newsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        tableView.register(UINib(nibName: "SelectNewsCell", bundle: nil), forCellReuseIdentifier: "SelectNewsCell")
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectNewsCell") as! selectNewsCell
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
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
