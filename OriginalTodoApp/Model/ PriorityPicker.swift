//
//   PriorityPicker.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/22.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import Foundation
import UIKit

class PriorityPickerKeyboard: UITextField{

  private var priorityPicker: UIPickerView!
  
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commoninit()
       }
       override init(frame: CGRect) {
           super.init(frame: frame)
           commoninit()
       }
    
    private func commoninit() {
        
           priorityPicker = UIPickerView()
//           setText()

           inputView = priorityPicker
           inputAccessoryView = createToolbar()
       }
    
    
    // キーボードのアクセサリービューを作成する
       private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
            toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        
            let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
            space.width = 12
            let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
            let toolbarItems = [flexSpaceItem, doneButtonItem, space]
        
            toolbar.setItems(toolbarItems, animated: true)
        
            return toolbar

       }
    
    
     @objc private func done(){
       resignFirstResponder()
    }

//     @objc private func setText() {
//               text = string(from: )
//           }

    
    
    
//       // datePickerの日付けをtextFieldのtextに反映させる
//       @objc private func setText() {
//           let f = DateFormatter()
//           f.dateStyle = .long
//           f.locale = Locale(identifier: "ja")
//           text = f.string(from: datePicker.date)
//       }
//
//       // クラス外から日付を取り出すためのメソッド
//       func getDate() -> Date {
//           return datePicker.date
//       }
//
//       // コピペ等禁止
//       override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//           return false
//       }
//       // カーソル非表示
//       override func caretRect(for position: UITextPosition) -> CGRect {
//           return CGRect(x: 0, y: 0, width: 0, height: 0)
//       }
    
    
}
