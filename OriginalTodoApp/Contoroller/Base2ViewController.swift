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

    let titleArray:[String] = ["ニュース","スポーツ","エンタメ","経済","国際","科学"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            reloadData()
            defaultSelectedIndex = 0

        }

        override var titlesInSwitcher: [String]{
            
            return[titleArray[0],titleArray[1],titleArray[2],titleArray[3],titleArray[4],titleArray[5]]
            
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
            
           default:
               return NewsViewController()
           }
       }

    }
