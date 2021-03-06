//
//  ViewController.swift
//  PropertyGarden
//
//  Created by UTKARSH VARMA on 2021-03-02.
//

import UIKit

class ViewController: UIViewController {
    
    var searchProperty = SearchProperty()
    var sendingInfo:[Listing] = []
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchQuery: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        searchButton.isEnabled = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden=true
        searchQuery.delegate = self
        searchProperty.delegate = self
    }


    @IBAction func searchClicked(_ sender: Any) {
        if let search = searchQuery.text{
            searchProperty.startSearch(search)
            searchButton.isEnabled = false

        }else{
            searchQuery.placeholder = "Please Enter city name to start search"

        }
    }
    
    
}

extension ViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}

extension ViewController:PropertyInfoDelegate{
    func loadInfo(listingInfo: [Listing]) {
        print("GOT IT")
        sendingInfo = listingInfo
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "showListing", sender: self)

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DisplayListingsVC
        destinationVC.currentListings = sendingInfo
    }
    
    
}
