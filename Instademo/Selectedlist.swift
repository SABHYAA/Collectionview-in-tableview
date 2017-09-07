//
//  Selectedlist.swift
//  Instademo
//
//  Created by appinventiv on 07/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Selectedlist: UIViewController {

    @IBOutlet weak var selectedTableView: UITableView!
    var images = ["conjuring", "oranges", "The Avengers", "The incredibles"]
    var imageNames = ["conjuring", "oranges", "The Avengers", "The incredibles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selectedTableView.dataSource = self
        self.selectedTableView.delegate = self
        let cellnib = UINib(nibName: "PhotoCell", bundle:nil)
        selectedTableView.register(cellnib, forCellReuseIdentifier: "PhotoCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
   
}
extension Selectedlist: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = selectedTableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as?
            PhotoCell else{
                fatalError("not found")
                }
        cell.imageNamesLabel?.text = imageNames[indexPath.row]
        cell.imagesUIimageView.image = UIImage(named: imageNames[indexPath.row])
        cell.tapButton.addTarget(self, action: #selector(tapButtonTapped(_:)), for: .touchUpInside)
        return cell
        
    }
    
    @objc func tapButtonTapped(_ sender: UIButton) {
        //sender.isSelected = !sender.isSelected
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
