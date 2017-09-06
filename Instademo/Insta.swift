//
//  Insta.swift
//  Instademo
//
//  Created by appinventiv on 06/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Insta: UIViewController {

    @IBOutlet var instaTableView: UITableView!
    
    @IBOutlet var instaCollectiew: UICollectionView!
    @IBAction func tapButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
     //Variable Declarations**************************************************************************************
    var images = ["conjuring", "oranges", "The avengers", "The incredibles"]
    var imagesNames = ["conjuring", "oranges", "The avengers", "The incredibles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.instaTableView.dataSource = self
        self.instaTableView.delegate = self
        self.instaCollectiew.dataSource = self
        self.instaCollectiew.delegate = self
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
// Lifecycle of Tableview*****************************************************************************************
extension Insta: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = instaTableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
            else {
            fatalError("not found")
        }
        cell.nameLabel.text = imagesNames[indexPath.row]
        cell.picturesUIImageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    }
// Lifecycle of CollectionView************************************************************************************
extension Insta: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = instaCollectiew.dequeueReusableCell(withReuseIdentifier: "Gallerycells", for: indexPath) as? Gallerycells
            else {
            fatalError("not found")
        }
        cell.name2Label.text = imagesNames[indexPath.row]
        cell.pictures2UIImageView.image = UIImage(named: images[indexPath.row])
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
