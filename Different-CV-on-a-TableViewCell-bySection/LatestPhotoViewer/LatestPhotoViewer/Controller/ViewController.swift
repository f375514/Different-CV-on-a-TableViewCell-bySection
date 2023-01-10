//
//  ViewController.swift
//  LatestPhotoViewer
//
//  Created by Md. Faysal Ahmed on 13/11/22.
//


// MARK:  If I load different collectionView on a collectionViewCell by section and want to scroll top collectionViews when scroll 
// MARK: current (vertical) collectionView, then I've to disable customCollectionView scrolling and five them height according to.


import UIKit
import Photos

struct PhotoModel {
    var phAsset: PHAsset
}

class ViewController: UIViewController {
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableViewCell()
    }
    
    
    func setUpTableViewCell() {
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        let nib2 = UINib(nibName: "HomeTVCell", bundle: nil)
        
        customTableView.register(nib, forCellReuseIdentifier: "cell")
        customTableView.register(nib2, forCellReuseIdentifier: "cell2")
        
        customTableView.delegate = self
        customTableView.dataSource = self
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.section == 0 || indexPath.section == 1 {
            let cell = customTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

            return cell
            
        }else{
            let cell = customTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! HomeTVCell
            return cell
        }
        
    }
    
}

// MARK: - row size
extension ViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 2 {
            return view.frame.width/4 * 28/4 + 40   //28 img, 40sideSize
        }
        else {
            return 120
        }
    }
    
}
