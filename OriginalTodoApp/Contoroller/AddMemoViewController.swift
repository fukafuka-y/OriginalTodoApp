//
//  AddMemoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/25.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    
    @IBOutlet weak var memoTextFiled: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func AddMemo(_ sender: Any) {
        
        let inputText = memoTextFiled.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
            if inputText != ""{
                saveMemoArray.append(inputText!)
                ud.set(saveMemoArray, forKey: "memoArray")
            }else{
                showAlert(title: "何も入力されていません")
            }

        }else{
            //最初、何も書かれていない場合
            var newMemoArray = [String]()
            //nilを強制アンラップはエラーが出るから
            if inputText != ""{
                //inputtextはoptional型だから強制アンラップ
                newMemoArray.append(inputText!)
                ud.set(newMemoArray, forKey: "memoArray")
            }else{
                showAlert(title: "何も入力されていません")
            }
        }
        showAlert(title: "保存完了")
    }
    

    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion:nil)
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
