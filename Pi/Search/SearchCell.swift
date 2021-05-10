//
//  SearchCell.swift
//  Pi
//
//  Created by chuantang on 10/05/2021.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func config(model: AirportModel){
        titleLabel.text = model.name
    }
}
