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


        override func viewDidLoad() {
            super.viewDidLoad()
            
            reloadData()
            defaultSelectedIndex = 0

        }

        override var titlesInSwitcher: [String]{

            return["ニュース","スポーツ","エンタメ","経済","ライフ"]
            
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
            
           default:
               return NewsViewController()
           }
       }

    }
