//
//  SelectNewsCell.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/10.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class SelectNewsCell: UITableViewCell {

    @IBOutlet weak var newsTextLabel: UILabel!
    
    @IBOutlet weak var selectButton: UISegmentedControl!
    
    let ud = UserDefaults.standard
    
    var newsBool:Bool = true
    
    let newsArray:[String] = ["スポーツ","エンタメ","経済","国際","科学","生活","国内"]

    var topic2:String = "/SPORTS"
    var topic3:String = "/ENTERTAINMENT"
    var topic4:String = "/ENTERTAINMENT"
    var topic5:String = "/WORLD"
    var topic6:String = "/SCIENCE"
    var topic7:String = "/HEALTH"
    var topic8:String = "/NATION"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  

    
    func selectNews(cellIndex:Int){
        
        let selectIndex = selectButton.selectedSegmentIndex
        
        if selectIndex == 0 && cellIndex == 0{
            ud.set(topic2, forKey: "topic2")
        }
          
        if selectIndex == 0 && cellIndex == 1{
            ud.set(topic3, forKey: "topic3")
        }
        
        
        if selectIndex == 0 && cellIndex == 2{
            ud.set(topic4, forKey: "topic4")
        }
        
        if selectIndex == 0 && cellIndex == 3{
            ud.set(topic5, forKey: "topic5")
        }
        
        if selectIndex == 0 && cellIndex == 4{
            ud.set(topic6, forKey: "topic6")
        }
        
        if selectIndex == 0 && cellIndex == 5{
            ud.set(topic7, forKey: "topic7")
        }
        
        if selectIndex == 0 && cellIndex == 6{
            ud.set(topic8, forKey: "topic8")
        }
        
        if selectIndex == 1 && cellIndex == 0{
                 ud.removeObject(forKey: "tooic2")
               }
                 
               if selectIndex == 1 && cellIndex == 1{
                    ud.removeObject(forKey: "tooic3")
               }
               
               
               if selectIndex == 1 && cellIndex == 2{
                   ud.removeObject(forKey: "tooic4")
               }
               
               if selectIndex == 1 && cellIndex == 3{
                  ud.removeObject(forKey: "tooic5")
               }
               
               if selectIndex == 1 && cellIndex == 4{
                    ud.removeObject(forKey: "tooic6")
               }
               
               if selectIndex == 1 && cellIndex == 5{
                ud.removeObject(forKey: "tooic7")
               }
               
               if selectIndex == 1 && cellIndex == 6{
                   ud.removeObject(forKey: "topic8")
               }
//
//        switch cellIndex{
//        case 0:
//            ud.set(topic2, forKey: "topic2")
//        case 1:
//            ud.set(topic3, forKey: "topic3")
//        case 2:
//            ud.set(topic4, forKey: "topic4")
//        case 3:
//            ud.set(topic5, forKey: "topic5")
//        case 4:
//            ud.set(topic6, forKey: "topic6")
//        case 5:
//            ud.set(topic7, forKey: "topic7")
//        case 6:
//            ud.set(topic8, forKey: "topic8")
//
 }
}
