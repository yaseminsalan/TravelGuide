//
//  SearchTableViewCell.swift
//  TravelGuide

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchDescription: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    
    @IBOutlet weak var searchTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
