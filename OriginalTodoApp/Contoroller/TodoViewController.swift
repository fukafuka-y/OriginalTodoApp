//
//  TodoViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie
import JJFloatingActionButton

class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate{

    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var timeTextFiled: DatePickerKeyboard!
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var plusTodoView: UIView!
    @IBOutlet weak var deliteButton: UIButton!
    
    
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!

   
     var todoTextArray:[String] = ["長押しで消去","右上の＋ボタンよりToDo入力"]
     
     var todoTimeArray:[String] = ["8/2 10:00","8/2 8:00"]
     
     var colorNumberArray:[Int] = [0,0]
     var colorNumber:Int = 0
    
     var DataArray :[Data] = []
    
    let actionButton = JJFloatingActionButton()
    
     

     override func viewDidLoad() {
        super.viewDidLoad()
                  
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil),forCellReuseIdentifier:"ToDoCell")
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
//        plusTodoView.backgroundColor = UIColor(red: 0, green: 0.2, blue: 0.8, alpha: 0.6)
        plusTodoView.isHidden = true
        
        timeTextFiled.delegate = self
        todoTextField.delegate = self
       
        let timeData1 = Data()
        let timeDate1 = dateFromString(string:todoTimeArray[0])
        timeData1.date = timeDate1
        timeData1.string = todoTextArray[0]
        timeData1.Int = colorNumberArray[0]
        DataArray.append(timeData1)
        
        let timeData2 = Data()
        let timeDate2 = dateFromString(string:todoTimeArray[1])
        timeData2.date = timeDate2
        timeData2.string = todoTextArray[1]
        timeData2.Int = colorNumberArray[1]
        DataArray.append(timeData2)
        
//        let timeData3 = Data()
//        let timeDate3 = dateFromString(string:todoTimeArray[2])
//        timeData3.date = timeDate3
//        timeData3.string = todoTextArray[2]
//        timeData3.Int = colorNumberArray[2]
//        DataArray.append(timeData3)
        
        
        dataChange()
        
//        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
//        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
//        space.width = 12
//        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
//        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
//        toolbar.setItems([flexSpaceItem,cancelItem,doneItem,space], animated: true)
//
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(cellLongPressed))
        longPressRecognizer.delegate = self
        todoTableView.addGestureRecognizer(longPressRecognizer)
     
       
        
        
        

        
        actionButton.buttonImage = UIImage(systemName: "line.horizontal.3")
        actionButton.buttonImageSize = CGSize(width: 50, height: 50)
        actionButton.buttonColor = .blue
        actionButton.buttonDiameter = 60
        actionButton.isHidden = false
        
        actionButton.buttonAnimationConfiguration = .transition(toImage: UIImage(systemName: "xmark")!)
        actionButton.itemAnimationConfiguration = .slideIn(withInterItemSpacing: 80)
        
        
        let item1 = actionButton.addItem()
        item1.titleLabel.text = "天気予報     "
        item1.imageView.image = UIImage(named: "weatherIcon")
        item1.imageSize = CGSize(width: 90, height: 90)
        item1.action = { item in
           self.performSegue(withIdentifier: "weather", sender: nil)
        }
        
        let item2 = actionButton.addItem()
        item2.titleLabel.text = "ニュース     "
        item2.imageView.image = UIImage(named: "newsIcon")
        item2.imageSize = CGSize(width: 90, height: 90)
        item2.action = { item in
            let base2viewContorller = Base2ViewController()
            self.present(base2viewContorller,animated: true ,completion: nil)
        }
        
        let item3 = actionButton.addItem()
        item3.titleLabel.text = "メモ     "
        item3.imageView.image = UIImage(named: "memoIcon")
        item3.imageSize = CGSize(width: 90, height: 90)
        item3.action = { item in
         self.performSegue(withIdentifier: "memo", sender: nil)
        }
        
        
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        

            }

        
    
   

    override func viewWillAppear(_ animated: Bool) {
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
   
    
    func showAnimation() {
           
              let animationView = AnimationView(name: "checkAnimation")
              animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width/4, height: view.bounds.height/5)
              animationView.center = self.view.center
              animationView.contentMode = .scaleAspectFit
              animationView.animationSpeed = 0.5
              view.addSubview(animationView)
              animationView.play()
        
              DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                animationView.isHidden = true
                
             }
     
          }
    
    @IBAction func whiteButtonTap(_ sender: Any) {
        
        colorNumber = 0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        
    }
    
    
    @IBAction func blueButtonTap(_ sender: Any) {
        
        blueButton.layer.borderColor = UIColor.white.cgColor
        blueButton.layer.borderWidth = 2.0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 1
        
    }
    
    @IBAction func yellowButtonTap(_ sender: Any) {
        
        yellowButton.layer.borderColor = UIColor.white.cgColor
        yellowButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 2
    }
    
    @IBAction func orangeButtonTap(_ sender: Any) {
        
        orangeButton.layer.borderColor = UIColor.white.cgColor
        orangeButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 3
        
    }
    
    @IBAction func greenButtonTap(_ sender: Any) {
        
        greenButton.layer.borderColor = UIColor.white.cgColor
        greenButton.layer.borderWidth = 2.0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        colorNumber = 4
    }
    
    
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todoTimeArray.count
           }
           
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
                 let data1 : String = self.stringFromDate(date: DataArray[indexPath.row].date)
                 let text1 : String = DataArray[indexPath.row].string
                 let colorNumber :Int = DataArray[indexPath.row].Int
                 cell.ToDoTextLabel.text = text1
                 cell.ToDoTimeLabel.text = data1
                 cell.selectionStyle = .none
           
            
            switch colorNumber {
            case 0:
                cell.backgroundColor = .white
            case 1:
                cell.backgroundColor = UIColor(red: 90/255, green: 255/255, blue: 255/255, alpha: 0.5)
            case 2:
                cell.backgroundColor = UIColor(red: 255/255, green: 219/255, blue: 85/255, alpha: 0.5)
            case 3:
                cell.backgroundColor = UIColor(red: 255/255, green: 149/255, blue: 225/255, alpha: 0.5)
            case 4:
                cell.backgroundColor = UIColor(red: 73/255, green: 206/255, blue: 164/255, alpha: 0.5)
            default:
                cell.backgroundColor = .white
            }
                return cell
            }
                
       
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
     }
   
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return view.frame.size.height/14
             }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    
    @IBAction func plusToDo(_ sender: Any) {
        
        plusTodoView.isHidden = false
        actionButton.isHidden = true
        timeTextFiled.text = ""
        todoTextField.text = ""
        
    }
    
    
    @IBAction func ToDoInput(_ sender: Any) {
        
        if timeTextFiled.text != "" && todoTextField.text != ""{
        
        var todoText:String = ""
        var todoTime:String = ""
        let todotimeCount:Int = todoTimeArray.count
        let todotextCount:Int = todoTimeArray.count
        let colorNumberCount:Int = colorNumberArray.count
        
        todoTime = timeTextFiled.text!
        todoText = todoTextField.text!
        
        todoTextArray.append(todoText)
        todoTimeArray.append(todoTime)
        colorNumberArray.append(colorNumber)
        
            
        let timeData4 = Data()
        let timeDate4 = dateFromString(string:todoTimeArray[todotimeCount])
        timeData4.date = timeDate4
        timeData4.string = todoTextArray[todotextCount]
        timeData4.Int = colorNumberArray[colorNumberCount]
        DataArray.append(timeData4)
        dataChange()
       
        todoTableView.reloadData()
            
        timeTextFiled.text = ""
        todoTextField.text = ""
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 0
        plusTodoView.isHidden = true
        actionButton.isHidden = false
        
            
        }
//        }else if todoTextField.text != ""{
//
//            todoText = todoTextField.text!
//            todoTextArray.append(todoText)
//            todoTimeArray.append("")
//            todoTextField.text = ""
//            timeTextFiled.text = ""
//            colorNumberArray.append(colorNumber)
//            blueButton.layer.borderWidth = 0
//            yellowButton.layer.borderWidth = 0
//            colorNumber = 0
//            plusTodoView.isHidden = true
//            todoTableView.reloadData()
//
//        }
    }
    
    @IBAction func todoReturn(_ sender: Any) {
        
        timeTextFiled.text = ""
        todoTextField.text = ""
        plusTodoView.isHidden = true
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        orangeButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        colorNumber = 0
        actionButton.isHidden = false
        
        
    }
    
    
    
    
    
    
//    
//    @IBAction func memoButton(_ sender: Any) {
//    performSegue(withIdentifier: "memo", sender: nil)
//    }
//    
//   
//    
//    @IBAction func calender(_ sender: Any) {
//        let CalendarViewContorller = calendarViewController()
//        present(CalendarViewContorller,animated: true ,completion: nil)
//        
//    }
    
    
  
    
    
    @objc func cellLongPressed(recognizer: UILongPressGestureRecognizer) {
        let point = recognizer.location(in: todoTableView)
        let indexPath = todoTableView.indexPathForRow(at: point)
        if indexPath == nil {

        } else if recognizer.state == UIGestureRecognizer.State.began  {
            // 長押しされた場合の処理
            showAnimation()
            todoTextArray.remove(at: indexPath!.row)
            todoTimeArray.remove(at: indexPath!.row)
            colorNumberArray.remove(at: indexPath!.row)
            DataArray.remove(at: indexPath!.row)
            todoTableView.reloadData()
         }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
   func dateFromString(string: String) -> Date {
                   
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate:"MM/dd H:mm", options: 0, locale: Locale(identifier: "ja_JP"))
    return formatter.date(from: string)!
               
      }
               
      func stringFromDate(date: Date) -> String {
                   
          let formatter: DateFormatter = DateFormatter()
          formatter.calendar = Calendar(identifier: .gregorian)
          formatter.dateFormat = DateFormatter.dateFormat(fromTemplate:"MM/dd H:mm", options: 0, locale: Locale(identifier: "ja_JP"))
          return formatter.string(from: date)
                  }
              
      

      func dataChange(){
       
       DataArray = DataArray.sorted(by: { (a, b) -> Bool in
                  return a.date < b.date
                  })
       
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
