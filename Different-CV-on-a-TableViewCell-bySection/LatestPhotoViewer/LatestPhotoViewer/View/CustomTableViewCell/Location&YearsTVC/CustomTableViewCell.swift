//
//  CustomTableViewCell.swift
//  LatestPhotoViewer
//
//  Created by Md. Faysal Ahmed on 13/11/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images = [UIImage(named: "a"),
                  UIImage(named: "b"),
                  UIImage(named: "c"),
                  UIImage(named: "b"),
                  UIImage(named: "a"),
                  UIImage(named: "b")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCollectionView() {
        let nib = UINib(nibName: "LocationCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}


extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocationCollectionViewCell
        cell.img.image = images[indexPath.row]
        
        return cell
    }
    
    
}


extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        return CGSize(width: width/3.5, height: width/2.5)
    }
}
