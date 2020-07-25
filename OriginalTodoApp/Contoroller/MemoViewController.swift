//
//  MemoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/25.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var memoTabelView: UITableView!
    let ud = UserDefaults.standard
    
    var memoArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memoTabelView.delegate = self
        memoTabelView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "memoCell")
        cell.textLabel?.text = memoArray[indexPath.row]
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }

    func loadMemo(){
           if ud.array(forKey: "memoArray") != nil{
               memoArray = ud.array(forKey: "memoArray") as![String]
               memoTabelView.reloadData()
           }
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            let detailVC = segue.destination as! DetailViewController
            let selectedIndexPath = memoTabelView.indexPathForSelectedRow!
            detailVC.memoText = memoArray[selectedIndexPath.row]
            detailVC.selectedRow = selectedIndexPath.row
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            if editingStyle == .delete {
                memoArray.remove(at: indexPath.row)
                ud.set(memoArray, forKey: "memoArray")
                tableView.reloadData()
            }
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
