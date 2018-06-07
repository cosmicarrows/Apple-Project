//
//  CitiesTableViewCell.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/6/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
      //questionalbe code....come back to check if its valid for sending a coordinate to the detail view controller
import CoreLocation


class CitiesTableViewCell: UITableViewCell {

    @IBOutlet var countryLabel: UILabel!

          //questionalbe code....come back to check if its valid for sending a coordinate to the detail view controller
    var coordinate: Coordinate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
