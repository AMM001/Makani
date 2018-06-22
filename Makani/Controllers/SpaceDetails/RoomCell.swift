//
//  RoomCell.swift
//  Makani
//
//  Created by Ahmed Osman on 6/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var roomCost: UILabel!
    @IBOutlet weak var roomCapacity: UILabel!
    @IBOutlet weak var roomName: UILabel!
    
    @IBAction func edit(_ sender: Any) {
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
