//
//  ViewController.swift
//  CocktailDrinks
//
//  Created by Genuine on 04.09.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import UIKit

class CocktailsTableViewController: UITableViewController{
    
    var viewModel = DrinksViewModel()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktail" , for: indexPath)
    
    
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchNextDrinkCategory()
       // print(viewModel.$state)
        // Do any additional setup after loading the view.
    }


}

