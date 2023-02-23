//
//  AvengerListVC.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import UIKit

class AvengerListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var avengersTableView: UITableView!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        avengersTableView.dataSource = self
        fetchAvengers()
    }
    

    //MARK: - PROPERTIES
    var avengers: [Avenger] = []
    
    
    //MARK: - FUNCTIONS
    func fetchAvengers() {
        AvengerController.fetchAvengerList { avengers in
            guard let avengers = avengers else { return }
            self.avengers = avengers
            DispatchQueue.main.async {
                self.avengersTableView.reloadData()
            }
        }
    }
    

    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAvengerDetailVC" {
            if let index = avengersTableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? AvengerDetailVC {
                    let avenger = avengers[index.row]
                    DispatchQueue.main.async {
                        destinationVC.avengerDetails = avenger
                    }
                }
            }
        }
    }
}


//MARK: - EXTENSION TableViewDataSource
extension AvengerListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avengers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "avengerCell", for: indexPath) as? AvengerListTableViewCell else { return UITableViewCell() }
        
        let avengerIndex = avengers[indexPath.row]
        cell.updateViews(avenger: avengerIndex)
        
        return cell
    }
}
