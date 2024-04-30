//
//  ReelCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 29/04/24.
//

import UIKit
import AVKit

class ReelCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var reel: ReelModel? {
        didSet {
            if let reel = reel {
                lblTitle.text = reel.title
                lblSubTitle.text = reel.description
                
                // Initialize AVPlayer with the video URL
                player = AVPlayer(url: URL(string: reel.sources)!)
                playerLayer = AVPlayerLayer(player: player)
              
                // Add AVPlayerLayer to the view's layer
                if let playerLayer = playerLayer {
                    playerLayer.videoGravity = .resizeAspectFill
                    self.videoView.layer.addSublayer(playerLayer)
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = videoView.bounds
    }
    
    func playVideo(){
        player?.play()
    }
   
    func pauseVideo(){
        player?.pause()
    }
}
