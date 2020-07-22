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
            defaultSelectedIndex = 1
           
        }

        override var titlesInSwitcher: [String]{

            return["天気","ニュース","スポーツ","エンタメ","経済","ライフ"]
            
            }



     override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
           switch index {
           case 0:
           return WeatherViewController()
            
           case 1:
            return NewsViewController()
           
            case 2:
            return News2ViewController()
            
            case 3:
            return News3ViewController()
            
            case 4:
            return News4ViewController()
            
            case 5:
            return News5ViewController()
            
           default:
               return NewsViewController()
           }
       }

    }
