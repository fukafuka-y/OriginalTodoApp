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

//        override var titlesInSwitcher: [String]{
//
//            return["天気"]
//            
//            }



     override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
           switch index {
           case 0:
           return WeatherViewController()
            
//           case 1:
//            return NewsViewController()
//
//            case 2:
//            return News2ViewController()
//
//            case 3:
//            return News3ViewController()
//
//            case 4:
//            return News4ViewController()
//
//            case 5:
//            return News5ViewController()
            
           
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


