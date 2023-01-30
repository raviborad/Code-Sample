//
//  AppDataTVCell.swift
//  itunesstoretest
//
//  Created by Ravi Borad on 16/11/22.
//

import UIKit

class AppDataTVCell: UITableViewCell {
    
    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSummary: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
