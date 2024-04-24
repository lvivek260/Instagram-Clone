//
//  ImageCollectionCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 23/04/24.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(postDubbleTap))
      //  tap.numberOfTapsRequired = 2
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tap)
    }
    
    @objc func postDubbleTap(){
       // lottieView.play()
        print(#function)
    }
}
