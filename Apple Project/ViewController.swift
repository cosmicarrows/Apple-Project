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
    }
    
    func downloadJson(){
        //ensuring we have a vaild path
        //create an if/let or guard statement to silence warning before running
        guard let path = Bundle.main.path(forResource: "cities", ofType: "json") else { return }
        
        let url = URL.init(fileURLWithPath: path)
        
        do {
            let data = try Data.init(contentsOf: url)

            let downloadedPlots = try JSONDecoder().decode([City].self, from: data)
    
            let testRun = {
                downloadedPlots.sorted(by: { if $0.name != $1.name {
                    return $0.name < $1.name
                } else {
                    return $0.country < $1.country
                    }})
            }
            
            cities = testRun()

            //console log cities for debugging purposes.  Remove this code before pushing to production.
            for plot in cities {
                print(plot.name)
            }
         
        } catch  {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell") as? CitiesTableViewCell else { return UITableViewCell()}
        
       
        
        cell.locationLabel.text = "\(cities[indexPath.row].name), \(cities[indexPath.row].country)"
        
       
        
        return cell
    }


}

