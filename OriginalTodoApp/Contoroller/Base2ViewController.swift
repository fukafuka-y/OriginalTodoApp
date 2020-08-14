//
//  Base2ViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//
import UIKit
import SegementSlide

class Base2ViewController: SegementSlideDefaultViewController {

    let titleArray:[String] = ["トップニュース","スポーツ","エンタメ","経済","国際","科学","生活","国内"]
    
    let ud = UserDefaults.standard
    
    var topicArray:[String] = []
    
    var topic:String = "topNews"
    var topic2:String = ""
    var topic3:String = ""
    var topic4:String = ""
    var topic5:String = ""
    var topic6:String = ""
    var topic7:String = ""
    var topic8:String = ""
    
   
    
    var topicCount:Int = 0
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            topicArray.append(topic)
            
            if ud.object(forKey: "topic2") != nil{
                       topic2 = ud.object(forKey: "topic2") as! String
                       ud.removeObject(forKey: "topic2")
                       topicCount = topicCount + 1
                   }else{
                       topic2 = "/SPORTS"
                   }
                   
                   if ud.object(forKey: "topic3") != nil{
                       topic3 = ud.object(forKey: "topic3") as! String
                       ud.removeObject(forKey: "topic3")
                       topicCount = topicCount + 1
                   }else{
                       topic3 = "/ENTERTAINMENT"
                   }
                   
                   if ud.object(forKey: "topic4") != nil{
                       topic4 = ud.object(forKey: "topic4") as! String
                       ud.removeObject(forKey: "topic4")
                       topicCount = topicCount + 1
                   }else{
                       topic4 = "/BUSINESS"
                   }
                   
                   if ud.object(forKey: "topic5") != nil{
                       topic5 = ud.object(forKey: "topic5") as! String
                       ud.removeObject(forKey: "topic5")
                       topicCount = topicCount + 1
                   }else{
                       topic5 = "/WORLD"
                   }
                   
                   if ud.object(forKey: "topic6") != nil{
                       topic6 = ud.object(forKey: "topic6") as! String
                       ud.removeObject(forKey: "topic6")
                        topicCount = topicCount + 1
                   }else{
                       topic6 = "/SCIENCE"
                   }
                   
                   if ud.object(forKey: "topic7") != nil{
                              topic7 = ud.object(forKey: "topic7") as! String
                              ud.removeObject(forKey: "topic7")
                              topicCount = topicCount + 1
                          }else{
                              topic7 = "/HEALTH"
                          }
                   
                   if ud.object(forKey: "topic8") != nil{
                    topic8 = ud.object(forKey: "topic8") as! String
                    ud.removeObject(forKey: "topic8")
                     topicCount = topicCount + 1
                    
                          }else{
                              topic8 = "/NATION"
                          }
                       
                  ud.removeObject(forKey: "topic")
                       
                   
                   topicArray.append(topic2)
                   topicArray.append(topic3)
                   topicArray.append(topic4)
                   topicArray.append(topic5)
                   topicArray.append(topic6)
                   topicArray.append(topic7)
                   topicArray.append(topic8)
                   
                   
                   
                   
                   ud.set(topicArray, forKey: "topic")
                   
                   ud.removeObject(forKey: "topic2")
                   ud.removeObject(forKey: "topic3")
                   ud.removeObject(forKey: "topic4")
                   ud.removeObject(forKey: "topic5")
                   ud.removeObject(forKey: "topic6")
                   ud.removeObject(forKey: "topic7")
                   ud.removeObject(forKey: "topic8")
            
            
            reloadData()
            defaultSelectedIndex = 0
            
            
            
            

        }

        override var titlesInSwitcher: [String]{
    
            switch topicCount{
            case 0:
            return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4],titleArray[5],titleArray[6],titleArray[7]]
            case 1:
                return[titleArray[0]]
            case 2:
                return[titleArray[0],titleArray[1]]
            case 3:
                return[titleArray[0],titleArray[1],titleArray[2]]
            case 4:
                return[titleArray[0],titleArray[1],titleArray[2],titleArray[3]]
            case 5:
                return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4]]
            case 6:
                return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4],titleArray[5]]
            case 7:
                return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4],titleArray[5],titleArray[6]]
            case 8:
                return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4],titleArray[5],titleArray[6],titleArray[7]]
            default:
                return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4],titleArray[5],titleArray[6],titleArray[7]]
            }
    }
    



     override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        
        
        
           switch index {
            
           case 0:
           return NewsViewController()
        
            case 1:
            return News2ViewController()
            
            case 2:
            return News3ViewController()
            
            case 3:
            return News4ViewController()
            
            case 4:
            return News5ViewController()
            
            case 5:
            return News6ViewController()
            
            case 6:
            return News7ViewController()
            
            case 7:
            return News8ViewController()
            
            
           default:
               return NewsViewController()
           }
       }

    }
