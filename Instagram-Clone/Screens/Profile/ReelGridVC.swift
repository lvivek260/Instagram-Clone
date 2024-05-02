//
//  ReelGridVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 30/04/24.
//

import UIKit
import XLPagerTabStrip

class ReelGridVC: UIViewController {

    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var heightOfCollectionView: NSLayoutConstraint!
    var setHeight: ((_ height: CGFloat)->Void)?
    
    override func viewWillAppear(_ animated: Bool) {
        postCollectionView.reloadData()
    }
}

extension ReelGridVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = postCollectionView.dequeueReusableCell(withReuseIdentifier: PostProfileCell.id, for: indexPath) as? PostProfileCell else{
            fatalError()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){ [self] in
            heightOfCollectionView.constant = postCollectionView.contentSize.height
            setHeight?(heightOfCollectionView.constant)
        }
    }
}

extension ReelGridVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = postCollectionView.frame.width-3
        return .init(width: totalWidth/3, height: (totalWidth/3)*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1.5
    }
}

// MARK: - XLPagerTabStrip Title Set
extension ReelGridVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        return IndicatorInfo(image: UIImage(systemName: "video.bubble", withConfiguration: configuration))
    }
}
