//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// descriptionLabel
    @IBOutlet weak var descriptionLabel: UILabel! {
        
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
