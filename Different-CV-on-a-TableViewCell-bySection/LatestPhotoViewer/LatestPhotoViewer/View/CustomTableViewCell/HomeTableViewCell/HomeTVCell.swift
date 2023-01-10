//
//  HomeTVCell.swift
//  LatestPhotoViewer
//
//  Created by Md. Faysal Ahmed on 13/11/22.
//

import UIKit

class HomeTVCell: UITableViewCell {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let images = [UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "a"),
                  UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "a"),
                  UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "a"),
                  UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "b"),
                  UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "b"),
                  UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "b"),
                  UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "b"),
                  UIImage(named: "a")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCollectionView() {
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
}


extension HomeTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.img.image = images[indexPath.row]
        
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    
    
}


extension HomeTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = homeCollectionView.frame.width
        return CGSize(width: width/4 - 2, height: width/4 - 2)
    }
}
