//
//  RestaurantDetailIconTextCell.swift
//  FoodPin
//
//  Created by Enrica on 2018/10/26.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class RestaurantDetailIconTextCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// iconImageView
    @IBOutlet weak var iconImageView: UIImageView!
    
    /// shortTextLabel
    @IBOutlet weak var shortTextLabel: UILabel! {
        
        didSet {
            shortTextLabel.numberOfLines = 0
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
