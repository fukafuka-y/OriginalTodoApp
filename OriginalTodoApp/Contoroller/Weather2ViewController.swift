//
//  Weather2ViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/08.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Lottie
import CoreLocation

class Weather2ViewController: UITableViewController,CLLocationManagerDelegate {

    
    @IBOutlet var weatherTableView: UITableView!
    
    var areaString:String = ""
    var weatherIcon:String = ""
    var tempureture:Double = 0
    var MaxTemp:Double = 0
    var MinTemp:Double = 0
    var weatherId:Int = 0
    
    var timeText:String = ""
    var timeTextA:String = ""
    var timeTextB:String = ""
    var timeTextC:String = ""
    var timeTextD:String = ""
    var timeTextE:String = ""
    var timeTextF:String = ""
    var timeTextG:String = ""
    
    var weatherIdA:Int = 0
    var weatherIdB:Int = 0
    var weatherIdC:Int = 0
    var weatherIdD:Int = 0
    var weatherIdE:Int = 0
    var weatherIdF:Int = 0
    var weatherIdG:Int = 0
    
    var tempA:Double = 0
    var tempB:Double = 0
    var tempC:Double = 0
    var tempD:Double = 0
    var tempE:Double = 0
    var tempF:Double = 0
    var tempG:Double = 0
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
         tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        
        locationManager.requestWhenInUseAuthorization()
             if (CLLocationManager.locationServicesEnabled()) {
                 locationManager.delegate = self
                 locationManager.desiredAccuracy = kCLLocationAccuracyBest
                 locationManager.startUpdatingLocation()
        }
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      let location = locations[0]
      print(location)
      let APIkey = "3583b769077fdfc4880f9fcd27d339bf"
      var lat = 26.8205
      var lon = 30.8024
      lat = location.coordinate.latitude
      lon = location.coordinate.longitude
        
        
        //                let area = "1853908"
        let urlText:String = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&lang=ja&APPID=\(APIkey)"
        let urlQuery = urlText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlQuery!)
        
        AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{ responce in
            
            
            switch responce.result{
                
            case .success:
                
                let json:JSON = JSON(responce.data as Any)
                print(json)
                self.weatherIcon = json["list"][0]["weather"][0]["main"].string!
                let tempureture1 = json["list"][0]["main"]["temp"].double
                let MaxTemp1 = json["list"][0]["main"]["temp_max"].double
                let MinTemp1 = json["list"][0]["main"]["temp_min"].double
                self.areaString  = json["city"]["name"].string!
                self.weatherId = json["list"][0]["weather"][0]["id"].int!
                
                self.weatherIdA = json["list"][1]["weather"][0]["id"].int!
                self.weatherIdB = json["list"][2]["weather"][0]["id"].int!
                self.weatherIdC = json["list"][3]["weather"][0]["id"].int!
                self.weatherIdD = json["list"][4]["weather"][0]["id"].int!
                self.weatherIdE = json["list"][5]["weather"][0]["id"].int!
                self.weatherIdF = json["list"][6]["weather"][0]["id"].int!
                self.weatherIdG = json["list"][7]["weather"][0]["id"].int!
                
                let time = json["list"][0]["dt_txt"].string!
                let timeA = json["list"][1]["dt_txt"].string!
                let timeB = json["list"][2]["dt_txt"].string!
                let timeC = json["list"][3]["dt_txt"].string!
                let timeD = json["list"][4]["dt_txt"].string!
                let timeE = json["list"][5]["dt_txt"].string!
                let timeF = json["list"][6]["dt_txt"].string!
                let timeG = json["list"][7]["dt_txt"].string!
                
                let tempuretureA = json["list"][1]["main"]["temp"].double
                let tempuretureB = json["list"][2]["main"]["temp"].double
                let tempuretureC = json["list"][3]["main"]["temp"].double
                let tempuretureD = json["list"][4]["main"]["temp"].double
                let tempuretureE = json["list"][5]["main"]["temp"].double
                let tempuretureF = json["list"][6]["main"]["temp"].double
                let tempuretureG = json["list"][7]["main"]["temp"].double
                
                let tempNumRound = self.tempChange(temp:tempureture1!)
                let MaxTempRoud = self.tempChange(temp: MaxTemp1!)
                let MinTempRound = self.tempChange(temp: MinTemp1!)
                
                let tempNumRoundA = self.tempChange(temp:tempuretureA!)
                let tempNumRoundB = self.tempChange(temp:tempuretureB!)
                let tempNumRoundC = self.tempChange(temp:tempuretureC!)
                let tempNumRoundD = self.tempChange(temp:tempuretureD!)
                let tempNumRoundE = self.tempChange(temp:tempuretureE!)
                let tempNumRoundF = self.tempChange(temp:tempuretureF!)
                let tempNumRoundG = self.tempChange(temp:tempuretureG!)
                
                self.tempureture = tempNumRound
                self.MaxTemp = MaxTempRoud
                self.MinTemp = MinTempRound
                
                self.tempA = tempNumRoundA
                self.tempB = tempNumRoundB
                self.tempC = tempNumRoundC
                self.tempD = tempNumRoundD
                self.tempE = tempNumRoundE
                self.tempF = tempNumRoundF
                self.tempG = tempNumRoundG
                
                
                self.timeText = self.timeTextChange(time: time)
                self.timeTextA = self.timeTextChange(time: timeA)
                self.timeTextB = self.timeTextChange(time: timeB)
                self.timeTextC = self.timeTextChange(time: timeC)
                self.timeTextD = self.timeTextChange(time: timeD)
                self.timeTextE = self.timeTextChange(time: timeE)
                self.timeTextF = self.timeTextChange(time: timeF)
                self.timeTextG = self.timeTextChange(time: timeG)
                
                
                
                
            case.failure:
                break
                
            }
            self.tableView.reloadData()
        }
        
        
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        
        cell.areaTextLabel.text = areaString
        let tempText = String(tempureture)
        let MaxText = String(MaxTemp)
        let MinText = String(MinTemp)
        cell.temprutureLabel.text = "\(tempText)℃"
        cell.MaxTempLabel.text = "\(MaxText)℃"
        cell.MinTempLabel.text = "\(MinText)℃"
        tableView.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        
        
        switch weatherId{
        //             雷
        case 200..<300:
            cell.backgroundColor = UIColor(red: 17/255, green: 12/255, blue: 108/255, alpha: 1.0)
            cell.animationString = "ThunderIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 17/255, green: 12/255, blue: 108/255, alpha: 1.0)
            cell.baceView.backgroundColor = UIColor(red: 17/255, green: 12/255, blue: 108/255, alpha: 1.0)
            cell.IconScrollView.backgroundColor = UIColor(red: 17/255, green: 12/255, blue: 108/255, alpha: 1.0)
            
        //                曇り
        case 300..<400:
            cell.backgroundColor = UIColor(red: 73/255, green: 96/255, blue: 102/255, alpha: 0.6)
            cell.animationString = "CloudIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 73/255, green: 96/255, blue: 102/255, alpha: 0.6)
            cell.baceView.backgroundColor = UIColor(red: 73/255, green: 96/255, blue: 102/255, alpha: 0.6)
            cell.IconScrollView.backgroundColor = UIColor(red: 73/255, green: 96/255, blue: 102/255, alpha: 0.6)
            
        //                雨
        case 500..<600:
            cell.backgroundColor = UIColor(red: 88/255, green: 147/255, blue: 255/255, alpha: 1.0)
            cell.animationString = "RainIcon"
            cell.weatherIconView.backgroundColor = .systemBlue
            cell.baceView.backgroundColor = .systemBlue
            cell.IconScrollView.backgroundColor = .systemBlue
            
        //                雪
        case 600..<700:
            cell.backgroundColor = UIColor(red: 217/255, green: 229/255, blue: 255/255, alpha: 1.0)
            cell.animationString = "snowIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 217/255, green: 229/255, blue: 255/255, alpha: 1.0)
            cell.baceView.backgroundColor = UIColor(red: 217/255, green: 229/255, blue: 255/255, alpha: 1.0)
            cell.IconScrollView.backgroundColor = UIColor(red: 217/255, green: 229/255, blue: 255/255, alpha: 1.0)
            
        //                風
        case 700..<800:
            cell.backgroundColor = UIColor(red: 88/255, green: 147/255, blue: 255/255, alpha: 1.0)
            cell.animationString = "windyIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 88/255, green: 147/255, blue: 255/255, alpha: 1.0)
            cell.baceView.backgroundColor = UIColor(red: 88/255, green: 147/255, blue: 255/255, alpha: 1.0)
            cell.IconScrollView.backgroundColor = UIColor(red: 88/255, green: 147/255, blue: 255/255, alpha: 1.0)
            
            
        //                 晴れ
        case 800:
            cell.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.animationString = "SunnyIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.baceView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.IconScrollView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            
        //                曇り
        case 801..<900:
            cell.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.animationString = "CloudIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.baceView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.IconScrollView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            
        //                曇り
        default:
            cell.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.animationString = "CloudIcon"
            cell.weatherIconView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.baceView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
            cell.IconScrollView.backgroundColor = UIColor(red: 140/255, green: 255/255, blue: 235/255, alpha: 1.0)
        }
        
        
//        let tempTextA = String(tempArrayA)
//        let tempTextB = String(self.tempArrayB[indexPath.row])
//        let tempTextC = String(self.tempArrayC[indexPath.row])
//        let tempTextD = String(self.tempArrayD[indexPath.row])
//        let tempTextE = String(self.tempArrayE[indexPath.row])
//        let tempTextF = String(self.tempArrayF[indexPath.row])
//        let tempTextG = String(self.tempArrayG[indexPath.row])
        
        
        
        cell.weatherIconLabel.text = weatherIconChange(weatherId: weatherId)
        cell.tempTextLabel.text = "\(tempureture)℃"
        
        cell.weatherIconLabelA.text = weatherIconChange(weatherId: weatherIdA)
        cell.tempTextLabelA.text = "\(tempA)℃"
        
        cell.weatherIconLabelB.text = weatherIconChange(weatherId: weatherIdB)
        cell.tempTextLabelB.text = "\(tempB)℃"
        
        cell.weatherIconLabelC.text = weatherIconChange(weatherId: weatherIdC)
        cell.tempTextLabelC.text = "\(tempC)℃"
        
        cell.weatherIconLabelD.text = weatherIconChange(weatherId: weatherIdD)
        cell.tempTextLabelD.text = "\(tempD)℃"
        cell.weatherIconLabelE.text = weatherIconChange(weatherId: weatherIdE)
        cell.tempTextLabelE.text = "\(tempE)℃"
        cell.weatherIconLabelF.text = weatherIconChange(weatherId: weatherIdF)
        cell.tempTextLabelF.text = "\(tempF)℃"
        cell.weatherIconLabelG.text = weatherIconChange(weatherId: weatherIdG)
        cell.tempTextLabelG.text = "\(tempG)℃"
        
         cell.timeTextLabel.text = timeText
         cell.timeTextLabelA.text = timeTextA
         cell.timeTextLabelB.text = timeTextB
         cell.timeTextLabelC.text = timeTextC
         cell.timeTextLabelD.text = timeTextD
         cell.timeTextLabelE.text = timeTextE
         cell.timeTextLabelF.text = timeTextF
         cell.timeTextLabelG.text = timeTextG
        
            
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height
    }
    
    func weatherIconChange(weatherId:Int)->String{
               
               var weatherIcon:String = ""
               
           switch weatherId{
                  case 200..<300:   weatherIcon = "⚡️"
                  case 300..<400:   weatherIcon = "🌫"
                  case 500..<600:   weatherIcon = "☔️"
                  case 600..<700:   weatherIcon = "⛄️"
                  case 700..<800:  weatherIcon = "🌪"
                  case 800:   weatherIcon = "☀️"
                  case 801..<900:  weatherIcon = "☁️"
                  case 900..<1000:  weatherIcon = "🌀"
                  default:   weatherIcon = "☁️"
                         }
               
               return weatherIcon
           }
       
       func timeTextChange(time:String)->String{
           
           let timeStr:String = String(time[time.index(time.startIndex, offsetBy: 11)..<time.index(time.startIndex, offsetBy: 13)])
           let timeString:String = "\(timeStr)時"
           return timeString
           
       }
           
           func tempChange(temp:Double)->Double{
               
               let tempRound:Double = round(temp*10)/10
               return tempRound
         
           }
           

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
