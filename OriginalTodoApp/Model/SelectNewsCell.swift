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
    var topic4:String = "/BUSINESS"
    var topic5:String = "/WORLD"
    var topic6:String = "/SCIENCE"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func changeNews(){
        
        if selectButton.selectedSegmentIndex == 0{
            newsBool = true
        }else{
            newsBool = false
        }
        
    }
    
}
