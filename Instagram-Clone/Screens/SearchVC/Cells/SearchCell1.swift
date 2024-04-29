//
//  SearchCell1.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 29/04/24.
//

import UIKit

class SearchCell1: UITableViewCell {

    @IBOutlet var imageViews: [UIImageView]!{
        didSet{
            if let imageViews{
                for view in imageViews {
                    view.layer.borderColor = UIColor.systemBackground.cgColor
                    view.layer.borderWidth = 1
                }
            }
        }
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
