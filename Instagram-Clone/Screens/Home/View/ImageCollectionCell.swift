//
//  ImageCollectionCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 23/04/24.
//

import UIKit
import Lottie

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lottieView: LottieAnimationView!{
        didSet{
            lottieView.animationSpeed = 0.75
            lottieView.loopMode = .playOnce
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(postDubbleTap))
        tap.numberOfTapsRequired = 2
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    @objc func postDubbleTap(){
        self.lottieView.isHidden = false
        lottieView.play(){ completed in
            self.lottieView.isHidden = true
        }
    }
}
