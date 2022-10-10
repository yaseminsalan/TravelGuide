//
//  BookmarksTableViewCell.swift
//  TravelGuide


import UIKit

class BookmarksTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var bookmarksImage: UIImageView!
    
    @IBOutlet weak var bookmarksTitle: UILabel!
    
    @IBOutlet weak var bookmarksDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

 
    }

}
