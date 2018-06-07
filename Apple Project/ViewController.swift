//
//  ViewController.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/5/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var cities = [City]()
    var currentCitiesArray = [City]() // updated array based on typed in search
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
        setupSearchBar()
        
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
            
            currentCitiesArray = cities

            //console log cities for debugging purposes.  Remove this code before pushing to production.
            for plot in cities {
                print(plot.name)
            }
         
        } catch  {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return currentCitiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCell") as? CitiesTableViewCell else { return UITableViewCell()}
        
       
        
        cell.locationLabel.text = "\(currentCitiesArray[indexPath.row].name), \(currentCitiesArray[indexPath.row].country)"
        
       
        
        return cell
    }

    func setupSearchBar(){
        
    }
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar,textDidChange searchText: String){
        guard !searchText.isEmpty else {
            currentCitiesArray = cities
            tableView.reloadData()
            return
            
        }
        currentCitiesArray = cities.filter({ city -> Bool in
            
            return city.name.hasPrefix(searchText)
            
        })
       tableView.reloadData()
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
}

