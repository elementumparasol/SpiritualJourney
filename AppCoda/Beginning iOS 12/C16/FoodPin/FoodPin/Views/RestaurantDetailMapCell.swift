//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/27.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// mapView
    @IBOutlet weak var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
