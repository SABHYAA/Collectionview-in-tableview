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
        var cellview = sender.superview
        while !(cellview is UITableViewCell) {
            cellview = cellview!.superview
            
        }
        let cell = cellview as! UITableViewCell
        let indexPath = self.instaTableView.indexPath(for: cell)
        if self.selectedIndexpath.contains(indexPath!){
            self.selectedIndexpath.remove(at: (indexPath?.row)!)
        }else
        {
            self.selectedIndexpath.append(indexPath!)
        }
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "SelectedlistId") as? Selectedlist
        self.navigationController?.pushViewController(obj!, animated: true)
        self.instaTableView.reloadData()
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 2.0, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            sender.alpha = 0
        }) { (true) in
            sender.alpha = 1
        }
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
//            sender.alpha = 0
//        }) { (true) in
//            sender.alpha = 1
//        }
    }
 
     //Variable Declarations**************************************************************************************
    var images = ["conjuring", "oranges", "The avengers", "The incredibles"]
    var imagesNames = ["conjuring", "oranges", "The avengers", "The incredibles"]
var selectedIndexpath = [IndexPath]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.instaTableView.dataSource = self
    self.instaTableView.delegate = self
    self.instaCollectiew.dataSource = self
    self.instaCollectiew.delegate = self
    }}
    //func tapButton(_ sender: UIButton) {
        //var cellview = sender.superview
      //  while !(cellview is UITableViewCell) {
         //   cellview = cellview!.superview
       // }
       // let cell = cellview as! UITableViewCell
      //  let indexpath = self.instaTableView.indexPath(for: cell)
      //  self.instaTableView.reloadData()
        

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

// Lifecycle of Tableview*****************************************************************************************
extension Insta: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count + 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = instaTableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
            else {
            fatalError("not found")
        }
        cell.nameLabel.text = imagesNames[indexPath.row%4]
        cell.picturesUIImageView.image = UIImage(named: imagesNames[indexPath.row%4])
        
        if self.selectedIndexpath.contains(indexPath) {
            cell.tapUIButton.setImage(UIImage(named: "filledheart"), for: .normal)
        }else{
            cell.tapUIButton.setImage(UIImage(named:"unfilledheart"), for: .normal)
        }
        return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if self.selectedIndexpath.contains(indexPath){
        self.selectedIndexpath.remove(at: indexPath.row)
    }
    else{
        self.selectedIndexpath.append(indexPath)
        
    }
    self.instaTableView.reloadData()
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

