//
//  FlightsTableViewCell.swift
//  TravelGuide


import UIKit

class FlightsTableViewCell: UITableViewCell {

    @IBOutlet weak var flightsDescriptions: UILabel!
    
    @IBOutlet weak var flightsTitle: UILabel!
    
    @IBOutlet weak var flightsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
