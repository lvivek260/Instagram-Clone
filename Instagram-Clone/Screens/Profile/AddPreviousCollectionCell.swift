//
//  AddPreviousCollectionCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 24/04/24.
//

import UIKit

class AddPreviousCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!{
        didSet{
            imgView.layer.cornerRadius = 28
            imgView.layer.borderWidth = 1
            imgView.layer.borderColor = UIColor.secondaryLabel.cgColor
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
