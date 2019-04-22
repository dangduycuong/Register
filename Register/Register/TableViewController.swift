//
//  TableViewController.swift
//  Register
//
//  Created by duycuong on 4/22/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var displayPlace: [Place] = DataService.shared.getDataCity(fileName: "Cities")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return displayPlace.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = displayPlace[indexPath.row].name

        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "showDistricts":
            if let destination = segue.destination as? DistrictViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let selectedCity = displayPlace[indexPath.row] as! City
                    destination.displayPlace = DataService.shared.getDataDistrict(fileName: "Districts").filter{$0.cityCode == selectedCity.cityCode}
                    
                }
            }
        default:
            return
        }
    }
 

}

class DistrictViewController: TableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
