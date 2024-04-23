//
//  HomeVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 22/04/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var statusCollectionView: UICollectionView!{
        didSet{
            statusCollectionView.register(StatusCell.nib, forCellWithReuseIdentifier: StatusCell.id)
            statusCollectionView.register(YourStatusCell.nib, forCellWithReuseIdentifier: YourStatusCell.id)
        }
    }
    @IBOutlet weak var postTblView: UITableView!{
        didSet{
            postTblView.register(PostTblCell.nib, forCellReuseIdentifier: PostTblCell.id)
        }
    }
    @IBOutlet weak var postTblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarIconConfig()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @IBAction func navigationMessageBtnClick(_ sender: Any) {
    }
    
    
    @IBAction func navigationLikeBtnClick(_ sender: Any) {
    }
}

//Navigation Bar configurations
extension HomeVC{
    private func navigationBarIconConfig(){
        // 1. Create your custom view
        let instagramImg = UIImageView()
        instagramImg.image = .instagramLogo1
        instagramImg.contentMode = .scaleAspectFit
        instagramImg.tintColor = .label
        instagramImg.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(instagrmImgClick))
        instagramImg.addGestureRecognizer(tap)
        
        
        // 2. Set up the navigation bar
        let navigationBar = UINavigationBar()
        navigationBar.barTintColor = .white
        navigationBar.tintColor = .black // Set the color of the back button and items on the navigation bar
        
        // 3. Add the custom view to the left side of the navigation bar
        let leftBarButtonItem = UIBarButtonItem(customView: instagramImg)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // Add the navigation bar to the view
        view.addSubview(navigationBar)
    }
    
    @objc func instagrmImgClick(){
        print(#function)
    }
    
    
}


extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatusCell.id, for: indexPath) as? StatusCell{
                return cell
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YourStatusCell.id, for: indexPath) as? YourStatusCell{
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 66, height: collectionView.frame.height)
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTblCell.id, for: indexPath) as? PostTblCell else{
            fatalError()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01){ [self] in
            postTblHeight.constant = postTblView.contentSize.height
        }
    }
}

extension HomeVC: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == myScrollView else{ return }
        
        let currentOffsetY = scrollView.contentOffset.y + 20
        
        if currentOffsetY > lastContentOffset{
            // Scrolling down
            if navigationController?.isNavigationBarHidden == false {
                navigationController?.setNavigationBarHidden(true, animated: true)
            }
            UIView.animate(withDuration: 0.3) {
                self.navigationController?.navigationBar.alpha = 0
            }
            lastContentOffset = currentOffsetY
           
        } else if currentOffsetY < lastContentOffset {
            // Scrolling up
            if navigationController?.isNavigationBarHidden == true {
                navigationController?.setNavigationBarHidden(false, animated: true)
            }
            UIView.animate(withDuration: 0.3) {
                self.navigationController?.navigationBar.alpha = 1
            }
            lastContentOffset = currentOffsetY
        }
    }
}


