//
//  ViewController.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/5/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadJson(){
        //ensuring we have a vaild path
        //create an if/let or guard statement to silence warning before running
        guard let path = Bundle.main.path(forResource: "cities", ofType: "json") else { return }
        
        let url = URL.init(fileURLWithPath: path)
        
        do {
            let data = try Data.init(contentsOf: url)
            //using JSONSerialization to  convert data object into serialized json
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            //print(json)
            
            guard let array = json as? [Any] else { return }
            
            for user in array {
                guard let userDict = user as? [String: Any] else { return }
                guard let profileId = userDict["_id"] as? Int else { print("not a double"); return }
                guard let coordinates = userDict["coord"] as? [String: Double] else { return }
                guard let latitude = coordinates["lat"] else { return }
                guard let longitude = coordinates["lon"] else { return }
                guard let country = userDict["country"] as? String else { return }
                guard let city = userDict["name"] as? String else { return }
                
                print(profileId)
                print(latitude)
                print(longitude)
                print(country)
                print(city)
                print(" ")
            }
        } catch  {
            print(error)
        }
    }


}

