//
//  SearchVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 23/04/24.
//

import UIKit

class SearchVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search View"
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.navigationController?.setNavigationBarHidden(velocity.y > 0, animated: true)
    }
}

