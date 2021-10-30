//
//  CoffeeWithMilk.swift
//  CoffeeRSN
//
//  Created by Sergey Razgulyaev on 08.10.2021.
//

import Foundation

class CoffeeWithMilk: CoffeeDecorator {
    var milkPrice: Int
    var milkCount: Int
    
    lazy var price: Int = base.price + milkPrice * milkCount
    var base: Coffee
    
    required init(base: Coffee, additivePrice: Int, additiveCount: Int) {
        self.base = base
        self.milkPrice = additivePrice
        self.milkCount = additiveCount
    }
}
