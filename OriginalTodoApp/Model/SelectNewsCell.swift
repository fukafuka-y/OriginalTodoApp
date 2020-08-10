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
    
    var newsBool:Bool = true
    
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
