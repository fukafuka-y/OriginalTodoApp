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
    var shareText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTextView.text = memoText
    }
    

    @IBAction func addMemo(_ sender: Any) {
//
        showAlert(title: "保存しました")
       
        
    }
    
        
    @IBAction func trush(_ sender: Any) {
        
        deliteAlert(title: "消去します")
        
            
        }
    
    
    @IBAction func share(_ sender: Any) {
        
        textGet()
        
        let items = [shareText] as [Any]
        
        let activtyVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activtyVC,animated: true,completion: nil)
        print(items)
        
    }
    
    func textGet(){
        
        shareText = memoTextView.text
        
    }
    
    
    
    
    
    
        
    func showAlert(title:String){
        
        let alert: UIAlertController = UIAlertController(title:title,message: nil,preferredStyle:.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK",style: UIAlertAction.Style.default,handler:{(action:UIAlertAction!) -> Void in
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.Decision()
            }
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",style: UIAlertAction.Style.cancel,handler:nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion:nil)
       
     
    }
    

    func deliteAlert(title:String){
        
        
        let alert: UIAlertController = UIAlertController(title:title,message: nil,preferredStyle:.alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK",style: UIAlertAction.Style.default,handler:{(action:UIAlertAction!) -> Void in
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.trush1()
            }
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル",style: UIAlertAction.Style.cancel,handler:nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion:nil)
    }
    

    func trush1(){
        
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
           saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray" )
            self.navigationController?.popViewController(animated: true)
        
      }
}
    
    
    
//    func Decision(){
//       let inputText = memoTextView.text
//        let ud = UserDefaults.standard
//        if ud.array(forKey: "memoArray") != nil{
//            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
//            if inputText != ""{
//                saveMemoArray.append(inputText!)
//                ud.set(saveMemoArray, forKey: "memoArray")
//            }else{
//
//            }
//
//        }else{
//            //最初、何も書かれていない場合
//            var newMemoArray = [String]()
//            //nilを強制アンラップはエラーが出るから
//            if inputText != ""{
//                //inputtextはoptional型だから強制アンラップ
//                newMemoArray.append(inputText!)
//                ud.set(newMemoArray, forKey: "memoArray")
//            }else{
//
//            }
//        }
//       self.navigationController?.popViewController(animated: true)
//
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



}
