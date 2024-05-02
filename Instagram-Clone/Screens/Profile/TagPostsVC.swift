//
//  TagPostsVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 30/04/24.
//

import UIKit
import XLPagerTabStrip

class TagPostsVC: UIViewController {

    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var heightOfCollectionView: NSLayoutConstraint!
    var setHeight: ((_ height: CGFloat)->Void)?
    
    var posts: [UIImage] = [.P_1, .P_2, .P_3, .P_4, .P_5, .P_6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        postCollectionView.reloadData()
    }
}

extension TagPostsVC: UICollectionViewDataSource, UICollectionViewDelegate{
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

extension TagPostsVC: UICollectionViewDelegateFlowLayout{
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
extension TagPostsVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        return IndicatorInfo(image: UIImage(systemName: "person.bubble.fill", withConfiguration: configuration))
    }
}
