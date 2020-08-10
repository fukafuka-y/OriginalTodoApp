//
//  MojiChangeViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/10.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class MojiChangeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var mojiTableView: UITableView!
    
    let mojiArray:[String] = ["大きい","少し大きい","通常","少し小さい","小さい"]
    let checkArray:[String] = ["checkmark.circle","circle","circle","circle","circle"]
    let checkImage = UIImage(systemName:"checkmark.circle")! as UIImage
    let nocheckImage = UIImage(systemName:"circle")! as UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mojiTableView.delegate = self
        mojiTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mojiArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "mojiCell")
        cell.textLabel?.text = mojiArray[indexPath.row]
        cell.imageView?.image = UIImage(systemName: checkArray[indexPath.row])
        return cell
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
