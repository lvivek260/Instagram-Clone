//
//  PreviusCollectionCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 24/04/24.
//

import UIKit

class PreviusCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.layer.cornerRadius = 28
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
