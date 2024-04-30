//
//  ReelVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 29/04/24.
//

import UIKit

class ReelVC: UIViewController {

    @IBOutlet weak var reelCollectionView: UICollectionView!{
        didSet{
            reelCollectionView.register(ReelCell.nib, forCellWithReuseIdentifier: ReelCell.id)
            reelCollectionView.dataSource = self
            reelCollectionView.delegate = self
        }
    }
    
    let reels = ReelViewModel().reels
    var isFirstTime: Bool = true

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstTime{
            reelCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            isFirstTime.toggle()
        }
    }
}

extension ReelVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reelCollectionView.dequeueReusableCell(withReuseIdentifier: ReelCell.id, for: indexPath) as? ReelCell else{
            fatalError()
        }
        cell.reel = reels[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = reelCollectionView.frame.height
        let width = reelCollectionView.frame.width
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let reelCell = cell as? ReelCell{
            reelCell.playVideo()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                reelCell.layoutSubviews()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let reelCell = cell as? ReelCell{
            reelCell.pauseVideo()
        }
    }
}
