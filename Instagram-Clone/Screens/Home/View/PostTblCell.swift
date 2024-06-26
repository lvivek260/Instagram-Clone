//
//  PostTblCell.swift
//  Instagram-Clone
//
//  Created by PHN MAC 1 on 23/04/24.
//

import UIKit

class PostTblCell: UITableViewCell {
    @IBOutlet weak var postCollection: UICollectionView!{
        didSet{
            postCollection.delegate = self
            postCollection.dataSource = self
            postCollection.register(ImageCollectionCell.nib, forCellWithReuseIdentifier: ImageCollectionCell.id)
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [UIImage] = []{
        didSet{
            images.shuffle()
            pageControl.currentPage = 0
            pageControl.numberOfPages = images.count
            postCollection.reloadData()
        }
    }
    
    var isLike = false{
        didSet{
            likeButton.imageView?.image = UIImage(systemName: isLike ? "heart.fill" : "heart")
        }
    }
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func likeButtonClick(_ sender: UIButton) {
        isLike.toggle()
    }
    
    var isSave = false{
        didSet{
            saveButton.imageView?.image = self.isSave ? UIImage(systemName: "bookmark.fill") : .save
        }
    }
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveButtonClick(_ sender: UIButton) {
        isSave.toggle()
    }
    
}

extension PostTblCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = postCollection.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.id, for: indexPath) as? ImageCollectionCell else {
            fatalError()
        }
        cell.isLikeHandler = { self.isLike = true }
        cell.imgView.image = images[indexPath.row]
        return cell
    }
}

extension PostTblCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = postCollection.frame.width
        let height = postCollection.frame.height
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
//    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        pageControl.currentPage = indexPath.row
//    }
}


