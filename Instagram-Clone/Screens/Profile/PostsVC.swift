//
//  PostsVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 30/04/24.
//

import UIKit
import XLPagerTabStrip

class PostProfileCell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
}

class PostsVC: UIViewController {

    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var heightOfCollectionView: NSLayoutConstraint!
    var setHeight: ((_ height: CGFloat)->Void)?
    
    var posts: [UIImage] = [.P_1, ._1, .P_2, ._2, .P_3, ._3, .P_4, ._4, .P_5, .P_6, ._74, .P_1, ._1, .P_2, ._2, .P_3, ._3, .P_4, ._4, .P_5, .P_6, ._74]
    
    override func viewWillAppear(_ animated: Bool) {
        postCollectionView.reloadData()
    }

}

extension PostsVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = postCollectionView.dequeueReusableCell(withReuseIdentifier: PostProfileCell.id, for: indexPath) as? PostProfileCell else{
            fatalError()
        }
        cell.imgView.image = posts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){ [self] in
            heightOfCollectionView.constant = postCollectionView.contentSize.height
            setHeight?(heightOfCollectionView.constant + 50)
        }
    }
}

extension PostsVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = postCollectionView.frame.width-3
        return .init(width: totalWidth/3, height: totalWidth/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1.5
    }
}


// MARK: - XLPagerTabStrip Title Set
extension PostsVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
       // return IndicatorInfo(title: "Posts")
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        return IndicatorInfo(image: UIImage(systemName: "squareshape.split.3x3", withConfiguration: configuration))
    }
}
