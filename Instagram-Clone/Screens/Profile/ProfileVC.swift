//
//  ProfileVC.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 24/04/24.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var profileImgView: UIImageView!{
        didSet{
            profileImgView.layer.borderWidth = 2
            profileImgView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        }
    }
    
    @IBOutlet weak var statusCollection: UICollectionView!{
        didSet{
            statusCollection.register(PreviusCollectionCell.nib, forCellWithReuseIdentifier: PreviusCollectionCell.id)
            statusCollection.register(AddPreviousCollectionCell.nib, forCellWithReuseIdentifier: AddPreviousCollectionCell.id)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfilePagerTabStripVC" {
            if let profilePagerTabStripVC = segue.destination as? ProfilePagerTabStripVC{
                profilePagerTabStripVC.setHeight = { height in
                    self.containerViewHeight.constant = height
                }
            }
        }
    }

}


extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row{
        case 0...2 :
            guard let cell = statusCollection.dequeueReusableCell(withReuseIdentifier: PreviusCollectionCell.id, for: indexPath) as? PreviusCollectionCell else{
                fatalError()
            }
            return cell
        default :
            guard let cell = statusCollection.dequeueReusableCell(withReuseIdentifier: AddPreviousCollectionCell.id, for: indexPath) as? AddPreviousCollectionCell else{
                fatalError()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 56, height: collectionView.frame.height)
    }
}
