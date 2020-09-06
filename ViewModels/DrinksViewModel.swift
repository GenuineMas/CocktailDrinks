//
//  DrinksViewModel.swift
//  CocktailDrinks
//
//  Created by Genuine on 06.09.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation

import Combine

class DrinksViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published var state = State()
    @Published var groupState = false
//    @Published var groupFromPicker : Int = 0 {
//
//        didSet {
//            didChangeStateOfGroup()
//            state.movies = []
//            updater()
//            state.canLoadNextPage = true
//        }
//    }
    
    
    func fetchNextDrinkCategory() {
        guard state.canLoadNextPage else { return }
        CocktailsAPI.fetchDrinks(category: "Ordinary_Drink")
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
        print(state.drinks)
    }
    

//    func updater() {
//        DispatchQueue.main.async {
//            self.state.drinks = []
//            self.state.categoryIndex = 1
//
//            self.fetchNextMovieBatch()
//        }
//    }
    
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure:
            state.canLoadNextPage = false
        }
    }
    
    private func onReceive(_ batch: [Drink]) {
        state.drinks += batch
       // state.page += 1
        state.canLoadNextPage = batch.count > 1
    }
    
    
    
    struct State {
        var drinks: [Drink] = []
        var categoryIndex: Int = 1
        var canLoadNextPage = true
        
    }
}
