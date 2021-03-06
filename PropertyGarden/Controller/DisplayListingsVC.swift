//
//  DisplayListingsVC.swift
//  PropertyGarden
//
//  Created by UTKARSH VARMA on 2021-03-06.
//

import UIKit

class DisplayListingsVC: UIViewController {
    @IBOutlet weak var listingsTable: UITableView!

    var currentListings:[Listing]?{
        didSet{
            DispatchQueue.main.async {
                self.listingsTable.reloadData()
                print(self.currentListings!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listingsTable.delegate=self
        listingsTable.dataSource = self
        listingsTable.reloadData()
    }
    

    
}
extension DisplayListingsVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentListings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "listing")
        cell.textLabel?.text = currentListings?[indexPath.row].address
        return cell
    }
    
    
}
