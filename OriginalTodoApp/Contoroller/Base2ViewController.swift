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

            return["天気","ニュース"]
            
            }



     override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
           switch index {
           case 0:
           return WeatherViewController()
            
           case 1:
            return NewsViewController()
           
           default:
               return NewsViewController()
           }
       }

    }
