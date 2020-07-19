//
//  BaseViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {


        override func viewDidLoad() {
            super.viewDidLoad()
            
            reloadData()
            defaultSelectedIndex = 0
           
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
               return WeatherViewController()
           }
       }

    }

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


