//
//  CoffeeWithSugar.swift
//  CoffeeRSN
//
//  Created by Sergey Razgulyaev on 08.10.2021.
//

import Foundation

class CoffeeWithSugar: CoffeeDecorator {
    var sugarPrice: Int
    var sugarCount: Int
    
    lazy var price: Int = base.price + sugarPrice * sugarCount
    var base: Coffee
    
    required init(base: Coffee, additivePrice: Int, additiveCount: Int) {
        self.base = base
        self.sugarPrice = additivePrice
        self.sugarCount = additiveCount
    }
}
