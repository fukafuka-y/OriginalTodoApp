//
//  SelectNewsViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/10.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class SelectNewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let newsArray:[String] = ["スポーツ","エンタメ","経済","国際","科学","生活","国内"]
    let news2Array:[String] = ["/SPORTS","/ENTERTAINMENT","/BUSINESS","/WORLD","/SCIENCE","/HEALTH","/NATION"]
    
    @IBOutlet weak var newsTableView: UITableView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.register(UINib(nibName: "SelectNewsCell", bundle: nil), forCellReuseIdentifier: "SelectNewsCell")
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectNewsCell") as! SelectNewsCell
        cell.newsTextLabel.text = newsArray[indexPath.row]
        if indexPath.row < 4{
        cell.selectButton.selectedSegmentIndex = 0
        }else{
        cell.selectButton.selectedSegmentIndex = 1
        }
        cell.changeNews()
        
        if cell.newsBool == true{
            
            let sport:String = news2Array[indexPath.row]
            let entertainment:String = news2Array[indexPath.row]
            let computer:String = news2Array[indexPath.row]
            let local:String = news2Array[indexPath.row]
            UserDefaults.standard.set(sport, forKey: "topic2")
            UserDefaults.standard.set(entertainment, forKey: "topic3")
            UserDefaults.standard.set(computer, forKey: "topic4")
            UserDefaults.standard.set(local, forKey: "topic5")
            print(indexPath.row)
            
        }else{
        
            
    }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/12
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
