//
//  DrinkModel.swift
//  CocktailDrinks
//
//  Created by Genuine on 05.09.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation

struct Drink:Codable {
    var strDrink: String
    var strDrinkThumb: String
}

struct DrinksList<T: Codable>:Codable {
    var result: [Drink]
}
