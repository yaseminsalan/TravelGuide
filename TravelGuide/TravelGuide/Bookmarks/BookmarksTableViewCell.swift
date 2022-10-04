//
//  BookmarksTableViewCell.swift
//  TravelGuide
//
//  Created by amarenasoftware on 4.10.2022.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var bookmarksImage: UIImageView!
    
    @IBOutlet weak var bookmarksTitle: UILabel!
    
    @IBOutlet weak var bookmarksDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
