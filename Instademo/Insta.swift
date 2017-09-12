//
//  Insta.swift
//  Instademo
//
//  Created by appinventiv on 06/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Insta: UIViewController {

    //Variable Declarations**************************************************************************************
    var imagesNames = ["conjuring", "oranges", "The avengers", "The incredibles"]
    var img = [String]()
    
    @IBOutlet var instaTableView: UITableView!
    @IBOutlet var instaCollectiew: UICollectionView!
    
    @IBAction func tapButton(_ sender: UIButton) {
    }
    
    @IBAction func favouritesButton(_ sender: UIButton) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "SelectedlistId") as? Selectedlist
        obj?.imageNames = self.img
        self.navigationController?.pushViewController(obj!, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.instaTableView.dataSource = self
        self.instaTableView.delegate = self
        self.instaCollectiew.dataSource = self
        self.instaCollectiew.delegate = self
    }}

//Tableview delegates and datasource*************************************************
extension Insta: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = instaTableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
            else {
            fatalError("not found")
        }
        cell.nameLabel.text = imagesNames[indexPath.row]
        cell.picturesUIImageView.image = UIImage(named: imagesNames[indexPath.row])
        if self.img.contains(imagesNames[indexPath.row]) {
            cell.tapUIButton.setImage(UIImage(named: "filledheart"), for: .normal)
        }else{
            cell.tapUIButton.setImage(UIImage(named:"unfilledheart"), for: .normal)
        }
        return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if self.img.contains(imagesNames[indexPath.row]){
        if let index = self.img.index(of: imagesNames[indexPath.row]) {
            self.img.remove(at: index)
        }
        print(self.img)
    }
    else{
        self.img.append(imagesNames[indexPath.row])
    }
    self.instaTableView.reloadData()
}
}
//CollectionView delegates and data source *****************************************
extension Insta: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = instaCollectiew.dequeueReusableCell(withReuseIdentifier: "Gallerycells", for: indexPath) as? Gallerycells
            else {
            fatalError("not found")
        }
        cell.name2Label.text = imagesNames[indexPath.row]
        
        cell.pictures2UIImageView.image = UIImage(named: imagesNames[indexPath.row])
        return cell
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 160)

}
}
// Outlets of Customcell Class of UITableviewCell****************************************************************
class Customcell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var picturesUIImageView: UIImageView!
    
    @IBOutlet weak var tapUIButton: UIButton!
    
}
// Outlets of gallerycells class of UICollectionviewCell**********************************************************
class Gallerycells: UICollectionViewCell {
    
    @IBOutlet weak var name2Label: UILabel!
    @IBOutlet weak var pictures2UIImageView: UIImageView!
}

