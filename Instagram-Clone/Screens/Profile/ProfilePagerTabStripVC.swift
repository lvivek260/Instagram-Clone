//
//  HomePagerTabStripVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 30/04/24.
//

import UIKit
import XLPagerTabStrip

class ProfilePagerTabStripVC: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        configuration()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Configurations
    private func configuration(){
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        
        settings.style.selectedBarBackgroundColor = .red
        
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14)
        settings.style.selectedBarHeight = 1.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = .red
        }
    }
    
    
    // MARK: - Default override Method
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let postVC = AppStoryboard.profile.getViewController(PostsVC.self)
        let reelGridVc = AppStoryboard.profile.getViewController(ReelGridVC.self)
        let tagPostsVC = AppStoryboard.profile.getViewController(TagPostsVC.self)
        return [postVC, reelGridVc, tagPostsVC]
    }
    
}
