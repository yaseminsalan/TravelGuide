//
//  HotelsTableViewCell.swift
//  TravelGuide


import UIKit

class HotelsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var hotelImage: UIImageView!
    
    @IBOutlet weak var hotelDescription: UILabel!
    @IBOutlet weak var hotelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
