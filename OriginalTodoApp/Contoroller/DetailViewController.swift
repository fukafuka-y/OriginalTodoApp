//
//  DetailViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/25.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var memoTextView: UITextView!
    var memoText:String = ""
    var selectedRow:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.text = memoText
    }
    
   
    @IBAction func trush(_ sender: Any) {
        let ud = UserDefaults.standard
            if ud.array(forKey: "memoArray") != nil{
             var saveMemoArray = ud.array(forKey: "memoArray") as![String]
             saveMemoArray.remove(at: selectedRow)
             ud.set(saveMemoArray, forKey: "memoArray" )
             self.navigationController?.popViewController(animated: true)
        
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
