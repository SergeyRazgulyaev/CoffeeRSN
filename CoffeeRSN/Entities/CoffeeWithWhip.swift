//
//  CoffeeWithWhip.swift
//  CoffeeRSN
//
//  Created by Sergey Razgulyaev on 08.10.2021.
//

import Foundation

class CoffeeWithWhip: CoffeeDecorator {
    var whipPrice: Int
    var whipCount: Int
    
    lazy var price: Int = base.price + whipPrice * whipCount
    var base: Coffee
    
    required init(base: Coffee, additivePrice: Int, additiveCount: Int) {
        self.base = base
        self.whipPrice = additivePrice
        self.whipCount = additiveCount
    }
}
