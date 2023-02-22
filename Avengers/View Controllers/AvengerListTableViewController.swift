//
//  AvengerListTableViewController.swift
//  Avengers
//
//  Created by iMac Pro on 2/22/23.
//

import UIKit

class AvengerListTableViewController: UITableViewController {

    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "avengerCell", for: indexPath)

        // Configure the cell...

        return cell
    }


    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toAvengerDetailVC" {
        
    }


}
