//
//  HomeVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 22/04/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var statusCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarIconConfig()
        statusCollectionView.register(StatusCell.nib, forCellWithReuseIdentifier: StatusCell.id)
        statusCollectionView.register(YourStatusCell.nib, forCellWithReuseIdentifier: YourStatusCell.id)
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


extension HomeVC: UICollectionViewDataSource{
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
}

extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 66, height: collectionView.frame.height)
    }
}
