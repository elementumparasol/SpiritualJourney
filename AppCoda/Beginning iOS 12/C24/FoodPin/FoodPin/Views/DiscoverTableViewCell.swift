//
//  DiscoverTableViewCell.swift
//  FoodPin
//
//  Created by Enrica on 2018/11/6.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var myImageView: UIImageView! {
        
        didSet {
            
            myImageView.layer.cornerRadius = 5.0
            myImageView.layer.masksToBounds = true
        }
    }
    
    /// nameLabel
    @IBOutlet weak var nameLabel: UILabel!
    
    /// typeLabel
    @IBOutlet weak var typeLabel: UILabel!
    
    /// phoneLabel
    @IBOutlet weak var phoneLabel: UILabel!
    
    /// addressLabel
    @IBOutlet weak var addressLabel: UILabel!
    
    /// descriptionLabel
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
