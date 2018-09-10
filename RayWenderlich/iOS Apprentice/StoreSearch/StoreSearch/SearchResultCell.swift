//
//  SearchResultCell.swift
//  StoreSearch
//
//  Created by Enrica on 2018/9/11.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// imageView
    @IBOutlet weak var artworkImageView: UIImageView!
    
    /// name
    @IBOutlet weak var nameLabel: UILabel!
    
    /// artistName
    @IBOutlet weak var artistNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
