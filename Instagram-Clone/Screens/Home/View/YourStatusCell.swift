//
//  YourStatusCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 22/04/24.
//

import UIKit

class YourStatusCell: UICollectionViewCell {
    @IBOutlet weak var isStatusImg: UIImageView!
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    
    var isStatusPresent: Bool = true{
        didSet{
            isStatusImg.isHidden = !isStatusPresent
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
