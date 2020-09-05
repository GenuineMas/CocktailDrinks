//
//  ViewController.swift
//  CocktailDrinks
//
//  Created by Genuine on 04.09.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import UIKit

class CocktailsTableViewController: UIViewController, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        <#code#>
//    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktail" , for: indexPath)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

