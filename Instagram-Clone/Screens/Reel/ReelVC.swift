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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ReelVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reelCollectionView.dequeueReusableCell(withReuseIdentifier: ReelCell.id, for: indexPath) as? ReelCell else{
            fatalError()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = reelCollectionView.frame.height
        let width = reelCollectionView.frame.width
        return .init(width: width, height: height)
    }
}
