//
//  TagPostsVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 30/04/24.
//

import UIKit
import XLPagerTabStrip

class TagPostsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - XLPagerTabStrip Title Set
extension TagPostsVC: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: XLPagerTabStrip.PagerTabStripViewController) -> XLPagerTabStrip.IndicatorInfo {
        return IndicatorInfo(image: UIImage(systemName: "person.bubble.fill"))
    }
}
