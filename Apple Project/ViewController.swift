//
//  ViewController.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/5/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var cities = [City]()
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
//            //using JSONSerialization to  convert data object into serialized json
//            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//            //print(json)
            
            let downloadedPlots = try JSONDecoder().decode([City].self, from: data)
            
            let sortedCitiesBffyName = downloadedPlots.sorted(by: {
                $0.name < $1.name })
           
           let sortedCitiesByName = downloadedPlots.sorted(by: { $0.name < $1.name })
            
            let testRun = {
                downloadedPlots.sorted(by: { if $0.name != $1.name {
                    return $0.name < $1.name
                } else {
                    return $0.country < $1.country
                    }})
            }
            
            
            cities = testRun()

            for plot in cities {
                print(plot.name)
            }
            
            
            
            
            //print(plots)
            
//            guard let array = json as? [Any] else { return }
//
//            for user in array {
//                guard let userDict = user as? [String: Any] else { return }
//                guard let profileId = userDict["_id"] as? Int32 else { print("not a int"); return }
//                guard let coordinates = userDict["coord"] as? [String: Double] else { return }
//                guard let latitude = coordinates["lat"] else { return }
//                guard let longitude = coordinates["lon"] else { return }
//                guard let country = userDict["country"] as? String else { return }
//                guard let city = userDict["name"] as? String else { return }
//
//                //print(profileId)
//                //print(latitude)
//                //print(longitude)
//                //print(country)
//                //print(city)
//                //print(" ")
//                }
        } catch  {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell") as? CitiesTableViewCell else { return UITableViewCell()}
        
        //cell.countryLabel.text = cities[indexPath.row].country
        //cell.cityLabel.text = cities[indexPath.row].name
        
        cell.countryLabel.text = "\(cities[indexPath.row].name), \(cities[indexPath.row].country)"
        
        //questionalbe code....come back to check if its valid for sending a coordinate to the detail view controller
        cell.coordinate = cities[indexPath.row].coord
        
        return cell
    }


}

