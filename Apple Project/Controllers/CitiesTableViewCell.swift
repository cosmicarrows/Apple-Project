//
//  CitiesTableViewCell.swift
//  Apple Project
//
//  Created by Laurence Wingo on 6/6/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import CoreLocation


class CitiesTableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
