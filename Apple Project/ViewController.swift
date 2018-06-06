//
//  ViewController.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/5/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //ensuring we have a vaild path
        //create an if/let or guard statement to silence warning before running
        guard let path = Bundle.main.path(forResource: "cities", ofType: "json") else { return }
        
        let url = URL.init(fileURLWithPath: path)
        
        do {
            let data = try Data.init(contentsOf: url)
            //using JSONSerialization to  convert data object into serialized json
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            print(json)
        } catch  {
            print(error)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

