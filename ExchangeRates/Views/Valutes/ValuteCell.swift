//
//  ValuteTableViewCell.swift
//  myapp
//
//  Created by Ростислав Ермаченков on 06/07/2019.
//  Copyright © 2019 Ростислав Ермаченков. All rights reserved.
//

import UIKit

class ValuteCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
