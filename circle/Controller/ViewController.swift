//
//  ViewController.swift
//  goSocial
//
//  Created by 林佑淳 on 2023/10/18.
//


import UIKit
import CoreLocation//A.有關定位
import AVFoundation//B.有關拍照


class ViewController: UIViewController {
    
    
    
    let locationManager = CLLocationManager() //A.有關定位
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self//A.有關定位
        locationManager.requestAlwaysAuthorization()//A.有關定位/要求存取
        // 監聽位置更新
        locationManager.desiredAccuracy = kCLLocationAccuracyBest//A.有關定位提供最準確的位置信息
        locationManager.startUpdatingLocation()//A.有關定位/一直在更新位置
        
        
        
        // Auto layout, variables, and unit scale are not yet supported
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        // Auto layout, variables, and unit scale are not yet supported
        let view2 = UIView()
        view2.frame = CGRect(x: 0, y: 0, width: 367, height: 655)
        let parent = self.view!
        parent.addSubview(view)
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.widthAnchor.constraint(equalToConstant: 367).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 655).isActive = true
        view2.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 12).isActive = true
        view2.topAnchor.constraint(equalTo: parent.topAnchor, constant: 137).isActive = true
        
    }
}








//MARK: - CLLocationManagerDelegate


A.有關定位
extension ViewController: CLLocationManagerDelegate {
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           
        // 獲取使用者 A 的最新位置
           let locationA = locations.first!

           // 獲取使用者 B 的最新位置
           let locationB = locations.last!

           // 判斷兩位使用者是否在同一個空間下
           let distance = locationA.distance(from: locationB)
           if distance < 10 {
               // 兩位使用者在同一個空間下
               // ...
           }
       }
}

//MARK: - AVCapturePhotoCaptureDelegate

//extension ViewController: AVCapturePhotoCaptureDelegate {
//
//    
//}
