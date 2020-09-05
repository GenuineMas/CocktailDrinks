//
//  Webservice.swift
//  CocktailDrinks
//
//  Created by Genuine on 05.09.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//


import Foundation
import Combine

let apiKey = "api_key=65d1815bddd8c90dd8f795081ea294b8&language=en-US&page=1"
let baseURLCategoriesList = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list"
let baseURLDrinksCategory = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink"


class CocktailsAPI {
    
    static func fetchCategories() -> AnyPublisher<[Category], Error> {
          let url = URL(string: baseURLCategoriesList)!
          return URLSession.shared
              .dataTaskPublisher(for: url)
              .handleEvents(receiveOutput: { NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue) })
              .tryMap { try JSONDecoder().decode(Categories<Category>.self, from: $0.data).result }
              .receive(on: DispatchQueue.main)
              .eraseToAnyPublisher()
      }
    
    static func fetchDrinks(category: String) -> AnyPublisher<[Drink], Error> {
        let url = URL(string:  "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=\(category )")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue) })
            .tryMap { try JSONDecoder().decode(DrinksList<Drink>.self, from: $0.data).result }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

