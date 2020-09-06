//
//  CategoryModel.swift
//  CocktailDrinks
//
//  Created by Genuine on 05.09.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation

struct Category:Codable {
    var strCategory: String
}

struct Categories<T: Codable>:Codable  {
    var drinks: [Category]
}

