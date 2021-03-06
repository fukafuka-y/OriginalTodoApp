//
//  WeatherViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SegementSlide
import SwiftyJSON
import Alamofire
import Lottie
import CoreLocation

class WeatherViewController: UITableViewController,SegementSlideContentScrollViewDelegate,CLLocationManagerDelegate{
    
        var areaStringArray = [String]()
        var weatherIconArray = [String]()
        var tempuretureArray = [Double]()
        var MaxTempArray = [Double]()
        var MinTempArray = [Double]()
        var weatherIdArray = [Int]()
        
        var weatherIdArrrayA = [Int]()
        var weatherIdArrrayB = [Int]()
        var weatherIdArrrayC = [Int]()
        var weatherIdArrrayD = [Int]()
        var weatherIdArrrayE = [Int]()
        var weatherIdArrrayF = [Int]()
        var weatherIdArrrayG = [Int]()
        
        var tempArrayA = [Double]()
        var tempArrayB = [Double]()
        var tempArrayC = [Double]()
        var tempArrayD = [Double]()
        var tempArrayE = [Double]()
        var tempArrayF = [Double]()
        var tempArrayG = [Double]()
        
        var timeTextArray = [String]()
        var timeTextArrayA = [String]()
        var timeTextArrayB = [String]()
        var timeTextArrayC = [String]()
        var timeTextArrayD = [String]()
        var timeTextArrayE = [String]()
        var timeTextArrayF = [String]()
        var timeTextArrayG = [String]()
    
    @IBOutlet weak var weatherTableView: UITableView!
    
        
//        var pickerView: UIPickerView = UIPickerView()
//        let areaList = ["Osaka", "Tokyo", "Nagoya", "Okinawa"]
    
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
                    let weatherIcon = json["list"][0]["weather"][0]["main"].string
                    let tempureture = json["list"][0]["main"]["temp"].double
                    let MaxTemp = json["list"][0]["main"]["temp_max"].double
                    let MinTemp = json["list"][0]["main"]["temp_min"].double
                    let area  = json["city"]["name"].string
                    let weatherId = json["list"][0]["weather"][0]["id"].int

                    let weatherIdA = json["list"][1]["weather"][0]["id"].int
                    let weatherIdB = json["list"][2]["weather"][0]["id"].int
                    let weatherIdC = json["list"][3]["weather"][0]["id"].int
                    let weatherIdD = json["list"][4]["weather"][0]["id"].int
                    let weatherIdE = json["list"][5]["weather"][0]["id"].int
                    let weatherIdF = json["list"][6]["weather"][0]["id"].int
                    let weatherIdG = json["list"][7]["weather"][0]["id"].int
                    
                    let dtText = json["list"][0]["dt_txt"].string
                    let dtTextA = json["list"][1]["dt_txt"].string
                    let dtTextB = json["list"][2]["dt_txt"].string
                    let dtTextC = json["list"][3]["dt_txt"].string
                    let dtTextD = json["list"][4]["dt_txt"].string
                    let dtTextE = json["list"][5]["dt_txt"].string
                    let dtTextF = json["list"][6]["dt_txt"].string
                    let dtTextG = json["list"][7]["dt_txt"].string
                    
                    let tempuretureA = json["list"][1]["main"]["temp"].double
                    let tempuretureB = json["list"][2]["main"]["temp"].double
                    let tempuretureC = json["list"][3]["main"]["temp"].double
                    let tempuretureD = json["list"][4]["main"]["temp"].double
                    let tempuretureE = json["list"][5]["main"]["temp"].double
                    let tempuretureF = json["list"][6]["main"]["temp"].double
                    let tempuretureG = json["list"][7]["main"]["temp"].double

                    let tempNumRound = self.tempChange(temp:tempureture!)
                    let MaxTempRoud = self.tempChange(temp: MaxTemp!)
                    let MinTempRound = self.tempChange(temp: MinTemp!)
                    
                    let tempNumRoundA = self.tempChange(temp:tempuretureA!)
                    let tempNumRoundB = self.tempChange(temp:tempuretureB!)
                    let tempNumRoundC = self.tempChange(temp:tempuretureC!)
                    let tempNumRoundD = self.tempChange(temp:tempuretureD!)
                    let tempNumRoundE = self.tempChange(temp:tempuretureE!)
                    let tempNumRoundF = self.tempChange(temp:tempuretureF!)
                    let tempNumRoundG = self.tempChange(temp:tempuretureG!)
                    
                    self.weatherIconArray.append(weatherIcon!)
                    self.tempuretureArray.append(tempNumRound)
                    self.MaxTempArray.append(MaxTempRoud)
                    self.MinTempArray.append(MinTempRound)
                    self.areaStringArray.append(area!)
                    self.weatherIdArray.append(weatherId!)
                    self.timeTextArray.append(dtText!)
                    
                    self.weatherIdArrrayA.append(weatherIdA!)
                    self.weatherIdArrrayB.append(weatherIdB!)
                    self.weatherIdArrrayC.append(weatherIdC!)
                    self.weatherIdArrrayD.append(weatherIdD!)
                    self.weatherIdArrrayE.append(weatherIdE!)
                    self.weatherIdArrrayF.append(weatherIdF!)
                    self.weatherIdArrrayG.append(weatherIdG!)
                    
                    self.timeTextArrayA.append(dtTextA!)
                    self.timeTextArrayB.append(dtTextB!)
                    self.timeTextArrayC.append(dtTextC!)
                    self.timeTextArrayD.append(dtTextD!)
                    self.timeTextArrayE.append(dtTextE!)
                    self.timeTextArrayF.append(dtTextF!)
                    self.timeTextArrayG.append(dtTextG!)
                    
                    
                    self.tempArrayA.append(tempNumRoundA)
                    self.tempArrayB.append(tempNumRoundB)
                    self.tempArrayC.append(tempNumRoundC)
                    self.tempArrayD.append(tempNumRoundD)
                    self.tempArrayE.append(tempNumRoundE)
                    self.tempArrayF.append(tempNumRoundF)
                    self.tempArrayG.append(tempNumRoundG)
                        
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
            return weatherIconArray.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
    //        getData()
            cell.areaTextLabel.text = self.areaStringArray[indexPath.row]
            let tempText = String(self.tempuretureArray[indexPath.row])
            let MaxText = String(self.MaxTempArray[indexPath.row])
            let MinText = String(self.MinTempArray[indexPath.row])
            cell.temprutureLabel.text = "\(tempText)℃"
            cell.MaxTempLabel.text = "\(MaxText)℃"
            cell.MinTempLabel.text = "\(MinText)℃"
//            cell.IconLabel.text = weatherIconChange(weatherId: weatherIdArray[indexPath.row])
            tableView.backgroundColor = .clear
            cell.contentView.backgroundColor = .clear
            
            
            switch weatherIdArray[indexPath.row] {
//             雷
            case 200..<300:
                cell.backgroundColor = .systemYellow
                cell.animationString = "ThunderIcon"
                cell.weatherIconView.backgroundColor = .systemYellow
                cell.baceView.backgroundColor = .systemYellow
                cell.IconScrollView.backgroundColor = .systemYellow
                
//                曇り
            case 300..<400:
                cell.backgroundColor = .lightGray
                cell.animationString = "CloudIcon"
                cell.weatherIconView.backgroundColor = .lightGray
                cell.baceView.backgroundColor = .lightGray
                cell.IconScrollView.backgroundColor = .lightGray
                
//                雨
            case 500..<600:
                cell.backgroundColor = .systemBlue
                cell.animationString = "RainIcon"
                cell.weatherIconView.backgroundColor = .systemBlue
                cell.baceView.backgroundColor = .systemBlue
                cell.IconScrollView.backgroundColor = .systemBlue
                
//                雪
             case 600..<700:
                cell.backgroundColor = .white
                cell.animationString = "snowIcon"
                cell.weatherIconView.backgroundColor = .white
                cell.baceView.backgroundColor = .white
                cell.IconScrollView.backgroundColor = .white
               
//                風
             case 700..<800:
                cell.backgroundColor = .lightGray
                cell.animationString = "windyIcon"
                cell.weatherIconView.backgroundColor = .lightGray
                cell.baceView.backgroundColor = .lightGray
                cell.IconScrollView.backgroundColor = .lightGray
                
                
//                曇り
            case 800:
                cell.backgroundColor = .lightGray
                cell.animationString = "SunnyIcon"
                cell.weatherIconView.backgroundColor = .lightGray
                cell.baceView.backgroundColor = .lightGray
                cell.IconScrollView.backgroundColor = .lightGray
                
//                曇り
            case 801..<900:
                cell.backgroundColor = .lightGray
                cell.animationString = "CloudIcon"
                cell.weatherIconView.backgroundColor = .lightGray
                cell.baceView.backgroundColor = .lightGray
                cell.IconScrollView.backgroundColor = .lightGray
                
//                曇り
            default:
                cell.backgroundColor = .lightGray
                cell.animationString = "CloudIcon"
                cell.weatherIconView.backgroundColor = .lightGray
                cell.baceView.backgroundColor = .lightGray
                cell.IconScrollView.backgroundColor = .lightGray
            }
            
            
            let tempTextA = String(self.tempArrayA[indexPath.row])
            let tempTextB = String(self.tempArrayB[indexPath.row])
            let tempTextC = String(self.tempArrayC[indexPath.row])
            let tempTextD = String(self.tempArrayD[indexPath.row])
            let tempTextE = String(self.tempArrayE[indexPath.row])
            let tempTextF = String(self.tempArrayF[indexPath.row])
            let tempTextG = String(self.tempArrayG[indexPath.row])
            
            let timeText = timeTextChange(time: timeTextArray[indexPath.row])
            let timeTextA = timeTextChange(time: timeTextArrayA[indexPath.row])
            let timeTextB = timeTextChange(time: timeTextArrayB[indexPath.row])
            let timeTextC = timeTextChange(time: timeTextArrayC[indexPath.row])
            let timeTextD = timeTextChange(time: timeTextArrayD[indexPath.row])
            let timeTextE = timeTextChange(time: timeTextArrayE[indexPath.row])
            let timeTextF = timeTextChange(time: timeTextArrayF[indexPath.row])
            let timeTextG = timeTextChange(time: timeTextArrayG[indexPath.row])
            
            cell.weatherIconLabel.text = weatherIconChange(weatherId: weatherIdArray[indexPath.row])
            cell.timeTextLabel.text = timeText
            cell.tempTextLabel.text = "\(tempText)℃"

            cell.weatherIconLabelA.text = weatherIconChange(weatherId: weatherIdArrrayA[indexPath.row])
            cell.timeTextLabelA.text = timeTextA
            cell.tempTextLabelA.text = "\(tempTextA)℃"

            cell.weatherIconLabelB.text = weatherIconChange(weatherId: weatherIdArrrayB[indexPath.row])
            cell.timeTextLabelB.text = timeTextB
            cell.tempTextLabelB.text = "\(tempTextB)℃"

            cell.weatherIconLabelC.text = weatherIconChange(weatherId: weatherIdArrrayC[indexPath.row])
            cell.timeTextLabelC.text = timeTextC
            cell.tempTextLabelC.text = "\(tempTextC)℃"

            cell.weatherIconLabelD.text = weatherIconChange(weatherId: weatherIdArrrayD[indexPath.row])
            cell.timeTextLabelD.text = timeTextD
            cell.tempTextLabelD.text = "\(tempTextD)℃"

            cell.weatherIconLabelE.text = weatherIconChange(weatherId: weatherIdArrrayE[indexPath.row])
            cell.timeTextLabelE.text = timeTextE
            cell.tempTextLabelE.text = "\(tempTextE)℃"

            cell.weatherIconLabelF.text = weatherIconChange(weatherId: weatherIdArrrayF[indexPath.row])
            cell.timeTextLabelF.text = timeTextF
            cell.tempTextLabelF.text = "\(tempTextF)℃"

            cell.weatherIconLabelG.text = weatherIconChange(weatherId: weatherIdArrrayG[indexPath.row])
            cell.timeTextLabelG.text = timeTextG
            cell.tempTextLabelG.text = "\(tempTextG)℃"
            
            
        return cell
            
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
        
    
       
        
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return view.frame.height
        }
        
         func getData(){

//            let APIkey = "3583b769077fdfc4880f9fcd27d339bf"
//            let area = "1853908"
//            let lat = 26.8205
//            let lon = 30.8024
//            let urlText:String = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&lang=ja&APPID=\(APIkey)"
//            let urlQuery = urlText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            let url = URL(string: urlQuery!)
//
//            AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{ responce in
//
//
//                switch responce.result{
//
//                case .success:
//
//                let json:JSON = JSON(responce.data as Any)
//                print(json)
//                let weatherIcon = json["list"][0]["weather"][0]["main"].string
//                let tempureture = json["list"][0]["main"]["temp"].double
//                let MaxTemp = json["list"][0]["main"]["temp_max"].double
//                let MinTemp = json["list"][0]["main"]["temp_min"].double
//                let area  = json["city"]["name"].string
////                let description = json["list"][0]["weather"][0]["description"].string
//                let weatherId = json["list"][0]["weather"][0]["id"].int
//
//                let weatherIdA = json["list"][1]["weather"][0]["id"].int
//                let weatherIdB = json["list"][2]["weather"][0]["id"].int
//                let weatherIdC = json["list"][3]["weather"][0]["id"].int
//                let weatherIdD = json["list"][4]["weather"][0]["id"].int
//                let weatherIdE = json["list"][5]["weather"][0]["id"].int
//                let weatherIdF = json["list"][6]["weather"][0]["id"].int
//                let weatherIdG = json["list"][7]["weather"][0]["id"].int
//
//                let dtText = json["list"][0]["dt_txt"].string
//                let dtTextA = json["list"][1]["dt_txt"].string
//                let dtTextB = json["list"][2]["dt_txt"].string
//                let dtTextC = json["list"][3]["dt_txt"].string
//                let dtTextD = json["list"][4]["dt_txt"].string
//                let dtTextE = json["list"][5]["dt_txt"].string
//                let dtTextF = json["list"][6]["dt_txt"].string
//                let dtTextG = json["list"][7]["dt_txt"].string
//
//                let tempuretureA = json["list"][1]["main"]["temp"].double
//                let tempuretureB = json["list"][2]["main"]["temp"].double
//                let tempuretureC = json["list"][3]["main"]["temp"].double
//                let tempuretureD = json["list"][4]["main"]["temp"].double
//                let tempuretureE = json["list"][5]["main"]["temp"].double
//                let tempuretureF = json["list"][6]["main"]["temp"].double
//                let tempuretureG = json["list"][7]["main"]["temp"].double
//
//                let tempNumRound = self.tempChange(temp:tempureture!)
//                let MaxTempRoud = self.tempChange(temp: MaxTemp!)
//                let MinTempRound = self.tempChange(temp: MinTemp!)
//
//                let tempNumRoundA = self.tempChange(temp:tempuretureA!)
//                let tempNumRoundB = self.tempChange(temp:tempuretureB!)
//                let tempNumRoundC = self.tempChange(temp:tempuretureC!)
//                let tempNumRoundD = self.tempChange(temp:tempuretureD!)
//                let tempNumRoundE = self.tempChange(temp:tempuretureE!)
//                let tempNumRoundF = self.tempChange(temp:tempuretureF!)
//                let tempNumRoundG = self.tempChange(temp:tempuretureG!)
//
//                self.weatherIconArray.append(weatherIcon!)
//                self.tempuretureArray.append(tempNumRound)
//                self.MaxTempArray.append(MaxTempRoud)
//                self.MinTempArray.append(MinTempRound)
//                self.areaStringArray.append(area!)
////                self.descriptionArray.append(description!)
//                self.weatherIdArray.append(weatherId!)
//                self.timeTextArray.append(dtText!)
//
//                self.weatherIdArrrayA.append(weatherIdA!)
//                self.weatherIdArrrayB.append(weatherIdB!)
//                self.weatherIdArrrayC.append(weatherIdC!)
//                self.weatherIdArrrayD.append(weatherIdD!)
//                self.weatherIdArrrayE.append(weatherIdE!)
//                self.weatherIdArrrayF.append(weatherIdF!)
//                self.weatherIdArrrayG.append(weatherIdG!)
//
//                self.timeTextArrayA.append(dtTextA!)
//                self.timeTextArrayB.append(dtTextB!)
//                self.timeTextArrayC.append(dtTextC!)
//                self.timeTextArrayD.append(dtTextD!)
//                self.timeTextArrayE.append(dtTextE!)
//                self.timeTextArrayF.append(dtTextF!)
//                self.timeTextArrayG.append(dtTextG!)
//
//
//                self.tempArrayA.append(tempNumRoundA)
//                self.tempArrayB.append(tempNumRoundB)
//                self.tempArrayC.append(tempNumRoundC)
//                self.tempArrayD.append(tempNumRoundD)
//                self.tempArrayE.append(tempNumRoundE)
//                self.tempArrayF.append(tempNumRoundF)
//                self.tempArrayG.append(tempNumRoundG)
//
//               case.failure:
//                break
//
//                }
//                self.tableView.reloadData()
//            }

                  
        }
        

   
    // MARK: - Table view data source

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

         Configure the cell...

        return cell
    }
    */

    /*
     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
     Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
             Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
     Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
     Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         Return false if you do not want the item to be re-orderable.
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
