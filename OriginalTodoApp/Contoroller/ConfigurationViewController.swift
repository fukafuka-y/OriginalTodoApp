//
//  ConfigurationViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var configurationTableView: UITableView!
   
    var TableTitle = [ ["menuTitle01", "title01", "title02"],
                       ["menuTitle02", "title03", "title04"],

                       ["menuTitle03", "menuTitle05", "menuTitle06"],
                       ["menuTitle04", "menuTitle07"]
                     ]


    var TableSubtitle = [ ["", "subtitle02", "subtitle03"],
                          ["","subtitle05", "subtitle06"],
                          ["", "subtitle06", "subtitle07"],
                          ["", "subtitle08"]
                        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurationTableView.delegate = self
        configurationTableView.dataSource = self
    }
    
    
    override var prefersStatusBarHidden: Bool {
           return true
       }


       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }


       func numberOfSections(in tableView: UITableView) -> Int {
           return TableTitle.count
       }


       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return TableTitle[section].count - 1
       }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
           cell.textLabel?.text = TableTitle[indexPath.section][indexPath.row + 1]
           cell.detailTextLabel?.text = TableSubtitle[indexPath.section][indexPath.row + 1]
           return cell
       }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return TableTitle[section][0]
       }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
