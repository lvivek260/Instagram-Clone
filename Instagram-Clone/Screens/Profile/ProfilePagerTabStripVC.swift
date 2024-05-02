//
//  HomePagerTabStripVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 30/04/24.
//

import UIKit
import XLPagerTabStrip

class ProfilePagerTabStripVC: ButtonBarPagerTabStripViewController {
    
    var setHeight: ((_ height: CGFloat)->Void)?
    
    override func viewDidLoad() {
        configuration()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Configurations
    private func configuration(){
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .systemBackground
        settings.style.buttonBarItemBackgroundColor = .systemBackground
        
        settings.style.selectedBarBackgroundColor = .label
        settings.style.selectedBarHeight = 10
        
        //settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14)
        settings.style.buttonBarHeight = 48
        settings.style.selectedBarHeight = 1.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else { return }
            oldCell?.imageView.tintColor = .label
            newCell?.imageView.tintColor = .label
        }
    }
    
    
    // MARK: - Default override Method
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let postVC = AppStoryboard.profile.getViewController(PostsVC.self)
        postVC.setHeight = setHeight
        
        let reelGridVc = AppStoryboard.profile.getViewController(ReelGridVC.self)
        reelGridVc.setHeight = setHeight
        
        let tagPostsVC = AppStoryboard.profile.getViewController(TagPostsVC.self)
        tagPostsVC.setHeight = setHeight
        
        return [postVC, reelGridVc, tagPostsVC]
    }
    
}
