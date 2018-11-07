//
//  TableViewCell.swift
//  KivaLoan
//
//  Created by Enrica on 2018/11/7.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    
    /// nameLabel
    @IBOutlet weak var nameLabel: UILabel!
    
    /// countryLabel
    @IBOutlet weak var countryLabel: UILabel!
    
    /// useLabel
    @IBOutlet weak var useLabel: UILabel!
    
    /// amountLabel
    @IBOutlet weak var amountLabel: UILabel!
    
    
    // MARK: - 类自带的方法

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
