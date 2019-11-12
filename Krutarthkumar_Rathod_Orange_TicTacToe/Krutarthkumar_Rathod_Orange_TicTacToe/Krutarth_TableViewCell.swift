//
//  Krutarth_TableViewCell.swift
//  Krutarthkumar_Rathod_Orange_TicTacToe
//
//  Created by Krutarthkumar Rathod on 2019-09-25.
//  Copyright © 2019 Krutarthkumar Rathod. All rights reserved.
//

import UIKit

class Krutarth_TableViewCell: UITableViewCell {
    
    var gameData : GameData?
    
    // Mark: Outlets
    
    @IBOutlet weak var winLossImage: UIImageView!
    @IBOutlet weak var whoWonLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
