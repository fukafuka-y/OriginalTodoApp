//
//  Weather1ViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/08.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie

class Weather1ViewController: UIViewController {
    
    @IBOutlet weak var weatherIconView: UIView!
    @IBOutlet weak var areaTextLabel: UILabel!
    @IBOutlet weak var temprutureLabel: UILabel!
    @IBOutlet weak var MaxTempLabel: UILabel!
    @IBOutlet weak var MinTempLabel: UILabel!
    @IBOutlet weak var IconScrollView: UIScrollView!
    @IBOutlet weak var baceView: UIView!
    @IBOutlet weak var timeTextLabel: UILabel!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var tempTextLabel: UILabel!
    @IBOutlet weak var timeTextLabelA: UILabel!
    @IBOutlet weak var weatherIconLabelA: UILabel!
    @IBOutlet weak var tempTextLabelA: UILabel!
    @IBOutlet weak var timeTextLabelB: UILabel!
    @IBOutlet weak var weatherIconLabelB: UILabel!
    @IBOutlet weak var tempTextLabelB: UILabel!
    @IBOutlet weak var timeTextLabelC: UILabel!
    @IBOutlet weak var weatherIconLabelC: UILabel!
    @IBOutlet weak var tempTextLabelC: UILabel!
    @IBOutlet weak var timeTextLabelD: UILabel!
    @IBOutlet weak var weatherIconLabelD: UILabel!
    @IBOutlet weak var tempTextLabelD: UILabel!
    @IBOutlet weak var timeTextLabelE: UILabel!
    @IBOutlet weak var weatherIconLabelE: UILabel!
    @IBOutlet weak var tempTextLabelE: UILabel!
    @IBOutlet weak var timeTextLabelF: UILabel!
    @IBOutlet weak var weatherIconLabelF: UILabel!
    @IBOutlet weak var tempTextLabelF: UILabel!
    @IBOutlet weak var timeTextLabelG: UILabel!
    @IBOutlet weak var weatherIconLabelG: UILabel!
    @IBOutlet weak var tempTextLabelG: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let contentWidth = baceView.bounds.width*2
        let contentHeight = baceView.bounds.height
        IconScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
