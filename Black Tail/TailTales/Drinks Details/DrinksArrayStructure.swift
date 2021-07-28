//
//  DrinksArrayStructure.swift
//  Black Tail
//
//  Created by Mbuso on 2021/07/21.
//

import Foundation
import UIKit

protocol DrinksAdded {
    var strDrink: String {get}
    var idDrink: String {get}
    var strDrinkThumb: String {get}
    //var strInstructions: String {get}
}
//Top array
class TopDrinks: Decodable {
    let drinks: [Drinks]
    
    init(drinks: [Drinks]) {
        self.drinks = drinks
    }
}

class Drinks: Decodable, DrinksAdded {
    let strDrink: String
    let idDrink: String
    let strDrinkThumb: String
    //let strInstructions: String
    
    init(strDrink: String, idDrink: String, strDrinkThumb: String) {
        self.strDrink = strDrink
        self.idDrink = idDrink
        self.strDrinkThumb = strDrinkThumb
        
    }
}

//----------------------------------------------------------------------------------------------


protocol DrinksAdded1 {
    var strDrink: String {get}
    var idDrink: String {get}
    var strDrinkThumb: String {get}
    var strInstructions: String {get}
    var strCategory: String {get}
}
//Top array
class TopDrinks1: Decodable {
    let drinks: [Drinks1]
    
    init(drinks: [Drinks1]) {
        self.drinks = drinks
    }
}

class Drinks1: Decodable, DrinksAdded {
    let strDrink: String
    let idDrink: String
    let strDrinkThumb: String
    let strInstructions: String
    let strCategory: String
    
    init(strDrink: String, idDrink: String, strDrinkThumb: String, strInstructions: String, strCategory: String) {
        self.strDrink = strDrink
        self.idDrink = idDrink
        self.strDrinkThumb = strDrinkThumb
        self.strInstructions = strInstructions
        self.strCategory = strCategory
    }
}
